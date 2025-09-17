import torch
import torch.distributed as dist
import tqdm
from core.base_model import BaseModel
from core.logger import LogTracker
import copy
import wandb  # hardcode some wandb logging
import matplotlib.pyplot as plt
from torch.optim.lr_scheduler import CosineAnnealingLR

class EMA():
    def __init__(self, beta=0.9999):
        super().__init__()
        self.beta = beta
    def update_model_average(self, ma_model, current_model):
        for current_params, ma_params in zip(current_model.parameters(), ma_model.parameters()):
            old_weight, up_weight = ma_params.data, current_params.data
            ma_params.data = self.update_average(old_weight, up_weight)
    def update_average(self, old, new):
        if old is None:
            return new
        return old * self.beta + (1 - self.beta) * new

class Palette(BaseModel):
    def __init__(self, networks, losses, sample_num, task, optimizers, ema_scheduler=None, **kwargs):
        ''' must to init BaseModel with kwargs '''
        super(Palette, self).__init__(**kwargs)

        ''' networks, dataloder, optimizers, losses, etc. '''
        self.loss_fn = losses[0]
        self.netG = networks[0]
        if ema_scheduler is not None:
            self.ema_scheduler = ema_scheduler
            self.netG_EMA = copy.deepcopy(self.netG)
            self.EMA = EMA(beta=self.ema_scheduler['ema_decay'])
        else:
            self.ema_scheduler = None
        
        ''' networks can be a list, and must convert by self.set_device function if using multiple GPU. '''
        self.netG = self.set_device(self.netG, distributed=self.opt['distributed'])
        if self.ema_scheduler is not None:
            self.netG_EMA = self.set_device(self.netG_EMA, distributed=self.opt['distributed'])
        self.load_networks()

        self.optG = torch.optim.Adam(list(filter(lambda p: p.requires_grad, self.netG.parameters())), **optimizers[0])
        self.optimizers.append(self.optG)
        self.scheduler = CosineAnnealingLR(optimizer=self.optG,
                                           T_max=self.opt['train']['n_epoch'])  # TODO: Don't hardcode this scheduler
        self.schedulers.append(self.scheduler)
        self.resume_training() 

        if self.opt['distributed']:
            self.netG.module.set_loss(self.loss_fn)
            self.netG.module.set_new_noise_schedule(phase=self.phase)
        else:
            self.netG.set_loss(self.loss_fn)
            self.netG.set_new_noise_schedule(phase=self.phase, device=torch.device('cpu'))

        ''' can rewrite in inherited class for more informations logging '''
        self.train_metrics = LogTracker(*[m.__name__ for m in losses], phase='train')
        self.val_metrics = LogTracker(*[m.__name__ for m in self.metrics], phase='val')
        self.test_metrics = LogTracker(*[m.__name__ for m in self.metrics], phase='test')

        self.sample_num = sample_num
        self.task = task
        
    def set_input(self, data):
        ''' must use set_device in tensor '''
        self.cond_image = self.set_device(data.get('cond_image'))
        self.gt_image = self.set_device(data.get('gt_image'))
        self.mask = self.set_device(data.get('mask'))
        self.mask_image = data.get('mask_image')
        self.path = data['path']
        self.batch_size = len(data['path'])
    
    def get_current_visuals(self, phase='train'):
        dict = {
            'gt_image': (self.gt_image.detach()[:].float().cpu()+1)/2,
            'cond_image': (self.cond_image.detach()[:].float().cpu()+1)/2,
        }
        if self.task in ['inpainting','uncropping']:
            dict.update({
                'mask': self.mask.detach()[:].float().cpu(),
                'mask_image': (self.mask_image+1)/2,
            })
        if phase != 'train':
            dict.update({
                'output': (self.output.detach()[:].float().cpu()+1)/2
            })
        return dict

    def save_current_results(self):
        ret_path = []
        ret_result = []
        for idx in range(self.batch_size):
            ret_path.append('GT_{}'.format(self.path[idx]))
            ret_result.append(self.gt_image[idx].detach().float().cpu())

            ret_path.append('Process_{}'.format(self.path[idx]))
            ret_result.append(self.visuals[idx::self.batch_size].detach().float().cpu())
            
            ret_path.append('Out_{}'.format(self.path[idx]))
            ret_result.append(self.visuals[idx-self.batch_size].detach().float().cpu())
        
        if self.task in ['inpainting','uncropping']:
            ret_path.extend(['Mask_{}'.format(name) for name in self.path])
            ret_result.extend(self.mask_image)

        self.results_dict = self.results_dict._replace(name=ret_path, result=ret_result)
        return self.results_dict._asdict()

    def train_step(self):
        if self.opt['global_rank'] == 0:
            print("ALEX AT TOP OF train_step in model.py; epoch is ", self.epoch)
        self.netG.train()
        self.train_metrics.reset()
        total_train_loss = torch.tensor(0.0).to(self.opt['global_rank'])  # Create a tensor to store the training loss on each GPU
        for train_data in tqdm.tqdm(self.phase_loader):
            self.set_input(train_data)
            self.optG.zero_grad()
            loss = self.netG(self.gt_image, self.cond_image, mask=self.mask)
            total_train_loss += loss.item()
            loss.backward()
            self.optG.step()

            self.iter += self.batch_size
            self.writer.set_iter(self.epoch, self.iter, phase='train')
            self.train_metrics.update(self.loss_fn.__name__, loss.item())
            if self.iter % self.opt['train']['log_iter'] == 0:
                for key, value in self.train_metrics.result().items():
                    self.logger.info('{:5s}: {}\t'.format(str(key), value))
                    self.writer.add_scalar(key, value)
                for key, value in self.get_current_visuals().items():
                    self.writer.add_images(key, value)

            if self.ema_scheduler is not None:
                if self.iter > self.ema_scheduler['ema_start'] and self.iter % self.ema_scheduler['ema_iter'] == 0:
                    self.EMA.update_model_average(self.netG_EMA, self.netG)

        # Log in wandb
        dist.all_reduce(total_train_loss, op=dist.ReduceOp.SUM)
        normalized_train_loss = total_train_loss / self.opt['n_phase_data']
        if self.opt['global_rank'] == 0:
            # Sum the training losses from all GPUs
            wandb_train_out_dict = {}
            current_lr = self.schedulers[0].get_last_lr()[0]  # TODO: Don't hardcode assumption of one scheduler
            wandb_train_out_dict['lr'] = current_lr
            wandb_train_out_dict['epoch'] = self.epoch
            wandb_train_out_dict['normalized_train_loss'] = normalized_train_loss
            wandb.log(wandb_train_out_dict)
        total_train_loss.zero_()

        for scheduler in self.schedulers:
            scheduler.step()

        if self.epoch % self.opt['train']['save_checkpoint_epoch'] == 0:
            self.logger.info('Saving the self at the end of epoch {:.0f}'.format(self.epoch))
            self.save_everything()

        return self.train_metrics.result()

    def val_step(self):
        self.netG.eval()
        self.val_metrics.reset()
        with torch.no_grad():
            val_loss_like_train = 0
            # Loop over entire val dataset and calculate basic loss
            for val_data in tqdm.tqdm(self.val_loader):
                self.set_input(val_data)
                if self.opt['global_rank'] == 0:
                    val_loss_like_train += self.netG(self.gt_image, self.cond_image, mask=self.mask)

                    self.iter += self.batch_size
                    self.writer.set_iter(self.epoch, self.iter, phase='val')

            if self.opt['global_rank'] == 0:
                val_loss_like_train =  val_loss_like_train / self.opt['n_val_data']
                wandb.log({'val_loss_like_train': val_loss_like_train})

            # Do the full restoration calculation, but just on the last batch
            assert self.cond_image.shape[0] == self.batch_size, "Adjust the number of validation files so that it's a multiple of the bachsize"
            if self.opt['distributed']:
                if self.task in ['inpainting','uncropping']:
                    self.output, self.visuals = self.netG.module.restoration(self.cond_image, y_t=self.cond_image, 
                        y_0=self.gt_image, mask=self.mask, sample_num=self.sample_num)
                else:
                    self.output, self.visuals = self.netG.module.restoration(self.cond_image, sample_num=self.sample_num)
            else:
                if self.task in ['inpainting','uncropping']:
                    self.output, self.visuals = self.netG.restoration(self.cond_image, y_t=self.cond_image, 
                        y_0=self.gt_image, mask=self.mask, sample_num=self.sample_num)
                else:
                    self.output, self.visuals = self.netG.restoration(self.cond_image, sample_num=self.sample_num)

            if self.opt['global_rank'] == 0:       # wandb log
                wandb_val_out_dict = {}
                total_val_loss = self.metrics[0](self.gt_image, self.output)
                normalized_val_loss = total_val_loss / self.batch_size
                wandb_val_out_dict['val_reconstruction2000_loss_one_batch'] = normalized_val_loss
                wandb.log(wandb_val_out_dict)

                if self.output.shape[4] == 24:  # TODO: Don't hardcode
                    kplt = 12
                elif self.output.shape[4] >= 16:
                    kplt = 12
                elif self.output.shape[4] == 12:
                    kplt = 8
                elif self.output.shape[4] == 8:
                    kplt = 4
                elif self.output.shape[4] == 4:
                    kplt = 3

                iplt, jplt = 16, 16
                u_xy_gt = self.gt_image[:self.batch_size,0,:,:,kplt].cpu().float().numpy()
                u_xy_pred = self.visuals[-self.batch_size:,0,:,:,kplt].cpu().float().numpy()
                u_xz_gt = self.gt_image[:self.batch_size,0,:,jplt,:].cpu().float().numpy()
                u_xz_pred = self.visuals[-self.batch_size:,0,:,jplt,:].cpu().float().numpy()
                u_yz_gt = self.gt_image[:self.batch_size,0,iplt,:,:].cpu().float().numpy()
                u_yz_pred = self.visuals[-self.batch_size:,0,iplt,:,:].cpu().float().numpy()

                fig_u_xy = self.plot_cross_section_wandb(u_xy_gt, u_xy_pred, self.batch_size)
                fig_u_xz = self.plot_cross_section_wandb(u_xz_gt, u_xz_pred, self.batch_size)
                fig_u_yz = self.plot_cross_section_wandb(u_yz_gt, u_yz_pred, self.batch_size)

                wandb.log({'visual demo u_xy': fig_u_xy,
                            'visual demo u_xz': fig_u_xz,
                            'visual demo u_yz': fig_u_yz})

                plt.close(fig_u_xy)
                plt.close(fig_u_xz)
                plt.close(fig_u_yz)

            for key, value in self.get_current_visuals(phase='val').items():
                self.writer.add_images(key, value)
            self.writer.save_images(self.save_current_results(), self.opt['datatype'])


        return self.val_metrics.result()

    def test(self):
        while self.epoch < self.opt['test']['n_epoch']:
            self.epoch += 1
            self.netG.eval()
            self.test_metrics.reset()
            with torch.no_grad():
                for phase_data in tqdm.tqdm(self.phase_loader):
                    self.set_input(phase_data)
                    if self.opt['distributed']:
                        if self.task in ['inpainting','uncropping']:
                            self.output, self.visuals = self.netG.module.restoration(self.cond_image, y_t=self.cond_image, 
                                y_0=self.gt_image, mask=self.mask, sample_num=self.sample_num)
                        else:
                            self.output, self.visuals = self.netG.module.restoration(self.cond_image, sample_num=self.sample_num)
                    else:
                        if self.task in ['inpainting','uncropping']:
                            self.output, self.visuals = self.netG.restoration(self.cond_image, y_t=self.cond_image, 
                                y_0=self.gt_image, mask=self.mask, sample_num=self.sample_num)
                        else:
                            self.output, self.visuals = self.netG.restoration(self.cond_image, sample_num=self.sample_num)
                            
                    self.iter += self.batch_size
                    self.writer.set_iter(self.epoch, self.iter, phase='test')
                    wandb_test_out_dict = {}
                    total_test_loss = 0
                    for met in self.metrics:
                        key = met.__name__
                        value = met(self.gt_image, self.output)
                        total_test_loss += value
                        self.test_metrics.update(key, value)
                        self.writer.add_scalar(key, value)
                    normalized_test_loss = total_test_loss / self.opt['n_phase_data']
                    wandb_test_out_dict['normalized_test_loss'] = normalized_test_loss
                    if self.opt['global_rank'] == 0:
                        wandb.log(wandb_test_out_dict)

                        if self.output.shape[4] == 24:  # TODO: Don't hardcode
                            kplt = 12
                        elif self.output.shape[4] >= 16:
                            kplt = 12
                        elif self.output.shape[4] == 12:
                            kplt = 8
                        elif self.output.shape[4] == 8:
                            kplt = 4
                        elif self.output.shape[4] == 4:
                            kplt = 3

                        iplt, jplt = 16, 16
                        u_xy_gt = self.gt_image[:self.batch_size,0,:,:,kplt].cpu().float().numpy()
                        u_xy_pred = self.visuals[-self.batch_size:,0,:,:,kplt].cpu().float().numpy()
                        u_xz_gt = self.gt_image[:self.batch_size,0,:,jplt,:].cpu().float().numpy()
                        u_xz_pred = self.visuals[-self.batch_size:,0,:,jplt,:].cpu().float().numpy()
                        u_yz_gt = self.gt_image[:self.batch_size,0,iplt,:,:].cpu().float().numpy()
                        u_yz_pred = self.visuals[-self.batch_size:,0,iplt,:,:].cpu().float().numpy()

                        fig_u_xy = self.plot_cross_section_wandb(u_xy_gt, u_xy_pred, self.batch_size)
                        fig_u_xz = self.plot_cross_section_wandb(u_xz_gt, u_xz_pred, self.batch_size)
                        fig_u_yz = self.plot_cross_section_wandb(u_yz_gt, u_yz_pred, self.batch_size)

                        wandb.log({'visual demo u_xy': fig_u_xy,
                                'visual demo u_xz': fig_u_xz,
                                'visual demo u_yz': fig_u_yz})

                        plt.close(fig_u_xy)
                        plt.close(fig_u_xz)
                        plt.close(fig_u_yz)

                    for key, value in self.get_current_visuals(phase='test').items():
                        self.writer.add_images(key, value)
                    self.writer.save_images(self.save_current_results(), self.opt['datatype'])
            
            test_log = self.test_metrics.result()
            ''' save logged informations into log dict ''' 
            test_log.update({'epoch': self.epoch, 'iters': self.iter})

            ''' print logged informations to the screen and tensorboard ''' 
            for key, value in test_log.items():
                self.logger.info('{:5s}: {}\t'.format(str(key), value))

    def load_networks(self):
        """ save pretrained model and training state, which only do on GPU 0. """
        if self.opt['distributed']:
            netG_label = self.netG.module.__class__.__name__
        else:
            netG_label = self.netG.__class__.__name__
        self.load_network(network=self.netG, network_label=netG_label, strict=False)
        if self.ema_scheduler is not None:
            self.load_network(network=self.netG_EMA, network_label=netG_label+'_ema', strict=False)

    def save_everything(self):
        """ load pretrained model and training state. """
        if self.opt['distributed']:
            netG_label = self.netG.module.__class__.__name__
        else:
            netG_label = self.netG.__class__.__name__
        self.save_network(network=self.netG, network_label=netG_label)
        if self.ema_scheduler is not None:
            self.save_network(network=self.netG_EMA, network_label=netG_label+'_ema')
        self.save_training_state()

    def plot_cross_section_wandb(self, data0_plane, data1_plane, batchsize):
        '''
        Plot a cross-section of data
        - data0_plane: a plane of data shaped [nbatch, nwhatever, nwhatever]
        '''
        batchsize = min(batchsize, 8)
        if (data0_plane.shape[1] == 600) or (data0_plane.shape[1] == 256):
            fig, ax = plt.subplots(3, batchsize, sharex=True, sharey=True, figsize=(batchsize*25, 3*2.5), dpi=125)
        else:
            fig, ax = plt.subplots(3, batchsize, sharex=True, sharey=True, figsize=(batchsize*2.5, 3*2.5), dpi=125)

        data2_plane = data1_plane - data0_plane
        pltmin, pltmax = data0_plane.min(), data0_plane.max()
        pltmin2, pltmax2 = data2_plane.min(), data2_plane.max()

        if batchsize > 1:
            for i, axs in enumerate(ax[0,:]):
                axs.set_title(f'GT, Mem {i}')
                im0 = axs.imshow(data0_plane[i,:,:].T,
                        vmin=pltmin,
                        vmax=pltmax,
                        origin='lower')
            for i, axs in enumerate(ax[1,:]):
                axs.set_title(f'Pred, Mem {i}')
                axs.imshow(data1_plane[i,:,:].T,
                        vmin=pltmin,
                        vmax=pltmax,
                        origin='lower')
            for i, axs in enumerate(ax[2,:]):
                axs.set_title(f'Diff, Mem {i}')
                im1 = axs.imshow(data2_plane[i,:,:].T,
                        vmin=pltmin2,
                        vmax=pltmax2,
                        cmap='RdBu_r',
                        origin='lower')
                
            cax0 = fig.add_axes([ax[-1,-1].get_position().x1+0.01,
                                ax[1,-1].get_position().y0,
                                0.02,
                                ax[0,-1].get_position().y1-ax[1,-1].get_position().y0])
            cbar0 = fig.colorbar(im0, cax=cax0)
            cbar0.set_label(f'Data [m/s]')
            cbar0.ax.tick_params()

            cax1 = fig.add_axes([ax[-1,-1].get_position().x1+0.01,
                                ax[-1,-1].get_position().y0,
                                0.02,
                                ax[-1,-1].get_position().y1-ax[-1,-1].get_position().y0])
            cbar1 = fig.colorbar(im1, cax=cax1)
            cbar1.set_label(f'Pred - GT [%]')
            cbar1.ax.tick_params()

        else:
            ax[0].set_title(f'GT, Mem {0}')
            im0 = ax[0].imshow(data0_plane[0,:,:].T,
                    vmin=pltmin,
                    vmax=pltmax,
                    origin='lower')
            ax[1].set_title(f'Pred, Mem {0}')
            ax[1].imshow(data1_plane[0,:,:].T,
                    vmin=pltmin,
                    vmax=pltmax,
                    origin='lower')
            ax[2].set_title(f'Diff, Mem {0}')
            im1 = ax[2].imshow(data2_plane[0,:,:].T,
                    vmin=pltmin2,
                    vmax=pltmax2,
                    cmap='RdBu_r',
                    origin='lower')
                
            cax0 = fig.add_axes([ax[-1].get_position().x1+0.01,
                                ax[-1].get_position().y0,
                                0.02,
                                ax[-1].get_position().y1-ax[-1].get_position().y0])
            cbar0 = fig.colorbar(im0, cax=cax0)
            cbar0.set_label(f'Data [m/s]')
            cbar0.ax.tick_params()

            cax1 = fig.add_axes([ax[0].get_position().x0-0.15,
                                ax[0].get_position().y0,
                                0.02,
                                ax[0].get_position().y1-ax[0].get_position().y0])
            cbar1 = fig.colorbar(im1, cax=cax1)
            cbar1.set_label(f'Pred - GT [%]')
            cbar1.ax.tick_params()            

        return fig
