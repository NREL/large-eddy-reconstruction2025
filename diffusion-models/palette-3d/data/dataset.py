import torch.utils.data as data
from torchvision import transforms
from PIL import Image
import os
import torch
import numpy as np

from .util.mask import (bbox2mask, brush_stroke_mask, get_irregular_mask, get_stripe_mask, get_random_mask, random_bbox, random_bbox_3d, random_cropping_bbox, get_custom_mask, get_gappy_lidar_mask, get_gappy_lidar_and_thalf_mask, get_noisy_gappy_lidar_mask, get_noisy_gappy_lidar_and_thalf_mask)

IMG_EXTENSIONS = [
    '.jpg', '.JPG', '.jpeg', '.JPEG',
    '.png', '.PNG', '.ppm', '.PPM', '.bmp', '.BMP',
]

ARR_EXTENSIONS = ['.npy']

def is_image_file(filename):
    return any(filename.endswith(extension) for extension in IMG_EXTENSIONS)

def is_array_file(filename):
    return any(filename.endswith(extension) for extension in ARR_EXTENSIONS)

def make_dataset(dir, filetype='image'):
    if os.path.isfile(dir):
        samples = [i for i in np.genfromtxt(dir, dtype=str, encoding='utf-8')]  # 240518 changed np.str --> str from Eagle --> Kestrel
    else:
        samples = []
        assert os.path.isdir(dir), '%s is not a valid directory' % dir
        for root, _, fnames in sorted(os.walk(dir)):
            for fname in sorted(fnames):
                if filetype == 'image':
                    if is_image_file(fname):
                        path = os.path.join(root, fname)
                        samples.append(path)
                elif filetype == 'array':
                    if is_array_file(fname):
                        path = os.path.join(root, fname)
                        samples.append(path)
                else:
                    raise ValueError(f'Filetype of "{filetype}" not recognized')           

    return samples

def pil_loader(path):
    return Image.open(path).convert('RGB')

def numpy_loader(path):
    return np.load(path)

def numpy_transforms(arr, data_bounds):
    '''
    Inputs: 
      - arr: Numpy array, where data comes from natural values
      - data_bounds: Tuple containing values for rescaling (umin, umax, vmin, vmax[, wmin, wmax])
    Output: Torch tensor rescaled to [-1,1]
    '''

    # Rescale to [-1,1]
    if len(arr.shape) == 3:  # For planar data
        # First drop q but retain u&v for the QG data
        arr = arr[1:,:,:]  # Drop q, retain u+v

        # Then rescale
        umin, umax, vmin, vmax = data_bounds
        arr[0,:,:] = 2*(arr[0,:,:] - umin)/(umax - umin) - 1
        arr[1,:,:] = 2*(arr[1,:,:] - vmin)/(vmax - vmin) - 1

    elif len(arr.shape) == 4:  # For volume data
        if len(data_bounds) == 2:
            umin, umax = data_bounds
            arr[0,:,:,:] = 2*(arr[0,:,:,:] - umin)/(umax - umin) - 1
        elif len(data_bounds) == 10:
            umin, umax, vmin, vmax, wmin, wmax, Tmin, Tmax, TKEmin, TKEmax = data_bounds
            arr[0,:,:,:] = 2*(arr[0,:,:,:] - umin)/(umax - umin) - 1
            arr[1,:,:,:] = 2*(arr[1,:,:,:] - vmin)/(vmax - vmin) - 1
            arr[2,:,:,:] = 2*(arr[2,:,:,:] - wmin)/(wmax - wmin) - 1
            arr[3,:,:,:] = 2*(arr[3,:,:,:] - Tmin)/(Tmax - Tmin) - 1
            arr[4,:,:,:] = 2*(arr[4,:,:,:] - TKEmin)/(TKEmax - TKEmin) - 1
        else:
            raise NotImplemented("len(data_bounds) must be either 2 or 10!")

    else:
        raise ValueError("Expected tuple containing (umin, umax, vmin, vmax[, wmin, wmax])!")

    # numpy array -> torch tensor with correct dtype
    arr = torch.from_numpy(arr).float()

    return arr

class InpaintLESDataset(data.Dataset):
    def __init__(self, data_root, data_bounds, mask_config={}, data_len=-1, image_size=[32, 32, 32], loader=numpy_loader):
        imgs = make_dataset(data_root, filetype='array')  # Refer to samples as "imgs" for simplicity's sake
        if data_len > 0:
            self.imgs = imgs[:int(data_len)]
        else:
            self.imgs = imgs
        self.tfs = numpy_transforms
        self.loader = loader
        self.data_bounds = data_bounds
        self.mask_config = mask_config
        self.mask_mode = self.mask_config['mask_mode']
        if 'mask_dir' in mask_config.keys():
            self.mask_dir = self.mask_config['mask_dir']
        if 'mask_dir1' in mask_config.keys():
            self.mask_dir1 = self.mask_config['mask_dir1']
        if 'mask_dir2' in mask_config.keys():
            self.mask_dir2 = self.mask_config['mask_dir2']
        self.nchan = int(len(data_bounds)//2)
        self.image_size = image_size

        ## The position of conditioning info inside the mask
        # if 'tlo_in_rel' in mask_config.keys():
        #     self.tlo_in_rel = self.mask_config['tlo_in_rel']
        # if 'thi_in_rel' in mask_config.keys():
        #     self.thi_in_rel = self.mask_config['thi_in_rel']
        if 'jlo_in_rel' in mask_config.keys():
            self.jlo_in_rel = self.mask_config['jlo_in_rel']
        if 'jhi_in_rel' in mask_config.keys():
            self.jhi_in_rel = self.mask_config['jhi_in_rel']
        if 'klo_in_rel' in mask_config.keys():
            self.klo_in_rel = self.mask_config['klo_in_rel']
        if 'khi_in_rel' in mask_config.keys():
            self.khi_in_rel = self.mask_config['khi_in_rel']

    def __getitem__(self, index):
        ret = {}
        path = self.imgs[index]
        img = self.tfs(self.loader(path), self.data_bounds)
        mask = self.get_mask()
        cond_image = img*(1. - mask) + mask*torch.randn_like(img)
        mask_img = img*(1. - mask) + mask

        ret['gt_image'] = img
        ret['cond_image'] = cond_image
        ret['mask_image'] = mask_img
        ret['mask'] = mask
        ret['path'] = path.rsplit("/")[-1].rsplit("\\")[-1]
        return ret

    def __len__(self):
        return len(self.imgs)

    def get_mask(self):
        if self.mask_mode == 'bbox':
            mask = bbox2mask(self.image_size, random_bbox())
        elif self.mask_mode == 'center':
            h, w = self.image_size
            mask = bbox2mask(self.image_size, (h//4, w//4, h//2, w//2))
        elif self.mask_mode == 'irregular':
            mask = get_irregular_mask(self.image_size)
        elif self.mask_mode == 'free_form':
            mask = brush_stroke_mask(self.image_size)
        elif self.mask_mode == 'hybrid':
            regular_mask = bbox2mask(self.image_size, random_bbox())
            irregular_mask = brush_stroke_mask(self.image_size, )
            mask = regular_mask | irregular_mask
        elif self.mask_mode == 'hybrid_3d':
            mask_num = np.random.randint(0,3)
            if mask_num == 0:
                mask = bbox2mask(self.image_size, random_bbox_3d())
            elif mask_num == 1:
                mask = get_stripe_mask(self.image_size)
            elif mask_num == 2:
                mask = get_random_mask(self.image_size)
            else:
                raise ValueError("mask_num is out of bounds")
        elif self.mask_mode == 'hybrid_3d_file':
            mask_num = np.random.randint(0,4)
            if mask_num == 0:
                mask = bbox2mask(self.image_size, random_bbox_3d())
            elif mask_num == 1:
                mask = get_stripe_mask(self.image_size, x0_stripe=4, dx_stripe=8, n_stripes=7, axis=0)
            elif mask_num == 2:
                mask = get_random_mask(self.image_size)
            elif mask_num == 3:
                mask = get_custom_mask(self.image_size, self.mask_dir)
            else:
                raise ValueError("mask_num is out of bounds")
            
        elif self.mask_mode == 'gappy_lidar':
            mask_num = np.random.randint(0,2)
            if mask_num == 1:
                mask = get_gappy_lidar_mask(self.image_size, self.nchan, self.jlo_in_rel, self.jhi_in_rel, self.klo_in_rel, self.khi_in_rel)
            elif mask_num == 2:
                mask = get_gappy_lidar_and_thalf_mask(self.image_size, self.nchan, self.jlo_in_rel, self.jhi_in_rel, self.klo_in_rel, self.khi_in_rel)

        elif self.mask_mode == 'noisy_gappy_lidar':
            mask_num = np.random.randint(0,2)
            if mask_num == 0:
                mask = get_noisy_gappy_lidar_mask(self.image_size, self.nchan, self.jlo_in_rel, self.jhi_in_rel, self.klo_in_rel, self.khi_in_rel)
            elif mask_num == 1:
                mask = get_noisy_gappy_lidar_and_thalf_mask(self.image_size, self.nchan, self.jlo_in_rel, self.jhi_in_rel, self.klo_in_rel, self.khi_in_rel)

        elif self.mask_mode == 'file':
            mask = get_custom_mask(self.image_size, self.mask_dir)

        elif self.mask_mode == 'two_files':
            mask_num = np.random.randint(0,2)
            if mask_num == 0:
                mask = get_custom_mask(self.image_size, self.mask_dir1)
            elif mask_num == 1:
                mask = get_custom_mask(self.image_size, self.mask_dir2)

        else:
            raise NotImplementedError(
                f'Mask mode {self.mask_mode} has not been implemented.')
        return torch.from_numpy(mask).permute((3,0,1,2))
