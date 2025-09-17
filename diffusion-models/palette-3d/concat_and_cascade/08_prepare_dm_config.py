import argparse
from collections import OrderedDict
import json
import numpy as np
import os
from pathlib import Path
import pandas as pd
from shutil import copy
import sys

def main(output_dir, meas_dir, fconfig_template, chunk_num, 
         cascade_num, batchsize,  # TODO: depreciate cascade_num
         training_data_dir, training_checkpoint,
         linear_end,
         umin, umax, vmin, vmax, wmin, wmax,
         Tmin, Tmax, TKEmin, TKEmax,
         lower_cascade_dir=None):
    '''
    Given one chunk of lidar measurements, 
      and possibly timesteps of data from previous inpainting,
      set up the inpainting process for the measurements
    Returns:
      - The name of the .json file that will be passed into an inpainting GPU call
    '''
    ### ~~~~~~~~~~ Grab parameters based off the trained network ~~~~~~~~~~    
    params_df = pd.read_csv(Path(training_data_dir, 'train/hyperparameters.csv'))
    
    ## Read sizing parameters
    nchan_out = int(params_df['nchan_out'].iloc[0])

    tlo_in_train_rel = int(params_df['tlo_in_rel'].iloc[0])
    jlo_in_train_rel = int(params_df['jlo_in_rel'].iloc[0])
    klo_in_train_rel = int(params_df['klo_in_rel'].iloc[0])
    
    thi_in_train_rel = int(params_df['thi_in_rel'].iloc[0])
    jhi_in_train_rel = int(params_df['jhi_in_rel'].iloc[0])
    khi_in_train_rel = int(params_df['khi_in_rel'].iloc[0])

    tlo_out_train_rel = int(params_df['tlo_out_rel'].iloc[0])
    jlo_out_train_rel = int(params_df['jlo_out_rel'].iloc[0])
    klo_out_train_rel = int(params_df['klo_out_rel'].iloc[0])
    
    thi_out_train_rel = int(params_df['thi_out_rel'].iloc[0])
    jhi_out_train_rel = int(params_df['jhi_out_rel'].iloc[0])
    khi_out_train_rel = int(params_df['khi_out_rel'].iloc[0])
    
    ## Assert that there isn't a size mismatch between training and sampling
    assert khi_in_train_rel-klo_in_train_rel == int(output_dir.name.split('_')[0]), f"Mismatch between training and sampling data sizes! {khi_in_train_rel-klo_in_train_rel} vs {int(output_dir.name.split('_')[0])}"
    assert khi_out_train_rel-klo_out_train_rel == int(output_dir.name.split('_')[-1]), f"Mismatch between training and sampling data sizes!  {khi_out_train_rel-klo_out_train_rel} vs {int(output_dir.name.split('_')[-1])} for file {output_dir}"

    ### ~~~~~~~~~~ Copy stuff over to the working directory ~~~~~~~~~~
    ### Copy over the first piece of conditioning
    ## Create a directory for the DM input
    chunk_id = str(chunk_num).zfill(4)
    dm_input_dir = Path(output_dir, f'chunk{chunk_id}/input')
    dm_input_dir.mkdir(exist_ok=True, parents=True)

    ## Copy over the data
    ##  ASSUME: meas_dir is structured like meas_dir/reconstruction00, meas_dir/reconstruction01, ...
    ##  and inside each recon## dir, we have the different time chunks for the data and the mask
    if chunk_num == 0:  # If first chunk, the input data will be only lidar measurements, and not have any prior memory
        for ibatch in range(batchsize):
            batch_id = str(ibatch).zfill(2)
            copy(Path(meas_dir, f'reconstruction{batch_id}', f'data_chunk{chunk_id}.npy'),
                 Path(dm_input_dir, f'data_chunk{chunk_id}_{batch_id}.npy'))
            
    else: # If not first chunk, merge previously inpainted data with incoming lidar measurements
        for ibatch in range(batchsize):
            batch_id = str(ibatch).zfill(2)
            prev_inpainted_data = np.load(Path(output_dir, 
                                            f'chunk{str(chunk_num-1).zfill(4)}/output/Out_data_chunk{str(chunk_num-1).zfill(4)}_{batch_id}.npy'))
            lidar_data = np.load(Path(meas_dir, f'reconstruction{batch_id}', f'data_chunk{chunk_id}.npy'))
            assert prev_inpainted_data.shape == lidar_data.shape, "Shape mismatch!"

            data_arr = np.zeros_like(prev_inpainted_data)
            len_thalf = int(prev_inpainted_data.shape[1]/2)
            data_arr[:,0:len_thalf,:,:] = prev_inpainted_data[:,len_thalf:,:,:]
            data_arr[:,len_thalf:,:,:] = lidar_data[:,len_thalf:,:,:]

            np.save(Path(dm_input_dir, f'data_chunk{chunk_id}_{batch_id}.npy'), data_arr)

    ## Create the corresponding flist
    dm_flist_dir = Path(output_dir, f'chunk{chunk_id}/flist')
    dm_flist_dir.mkdir(exist_ok=True)

    with open(Path(dm_flist_dir, 'sample.flist'), 'w') as f:
        for ibatch in range(batchsize):
            f.write(f"{Path(dm_input_dir, f'data_chunk{chunk_id}_{str(ibatch).zfill(2)}.npy')}\n")

        # f.write(f"{Path(dm_input_dir, f'data_chunk{chunk_id}_00.npy')}\n")
        # f.write(f"{Path(dm_input_dir, f'data_chunk{chunk_id}_01.npy')}")

    ## Create a directory for the mask and copy
    ##   Reminder: For chunk_num > 0, the masks already come with "thalf" included
    dm_mask_dir = Path(output_dir, f'chunk{chunk_id}/mask')
    dm_mask_dir.mkdir(exist_ok=True)
    if chunk_num == 0:
        copy(Path(training_data_dir, 'masks/mask_cascade1.npy'), # TODO: Make chunk/cascade nomenclature consistent
                Path(dm_mask_dir, f'mask_chunk{chunk_id}.npy'))
    else:
        copy(Path(training_data_dir, 'masks/mask_cascade2.npy'), 
                Path(dm_mask_dir, f'mask_chunk{chunk_id}.npy'))


    ### ~~~~~~~~~~ Prepare the template file ~~~~~~~~~~    
    ### Read in template JSON file
    json_str = ''
    with open(fconfig_template, 'r') as f:
        for line in f:
            line = line.split('//')[0] + '\n'
            json_str += line
    opt = json.loads(json_str, object_pairs_hook=OrderedDict)
    
    ### Modify JSON data
    opt['name'] = f'inpaint_{output_dir.name}'
    
    opt['path']['base_dir'] = str(output_dir)
    opt['path']['resume_state'] = training_checkpoint
    
    opt['datasets']['test']['which_dataset']['args']['data_root'] = str(Path(dm_flist_dir, 'sample.flist'))
    opt['datasets']['test']['which_dataset']['args']['mask_config']['mask_mode'] = 'file'
    opt['datasets']['test']['which_dataset']['args']['mask_config']['mask_dir'] = str(Path(dm_mask_dir, f'mask_chunk{chunk_id}.npy'))
    
    if nchan_out == 1:
        opt['datasets']['test']['which_dataset']['args']['data_bounds'] = [umin, umax]
    elif nchan_out == 5:
        opt['datasets']['test']['which_dataset']['args']['data_bounds'] = [umin, umax, vmin, vmax, wmin, wmax, Tmin, Tmax, TKEmin, TKEmax]
    else:
        raise NotImplementedError
    
    opt['datasets']['test']['which_dataset']['args']['image_size'] = [thi_out_train_rel, jhi_out_train_rel, khi_out_train_rel]

    opt['model']['which_networks'][0]['args']['unet']['image_size'] = [thi_out_train_rel, jhi_out_train_rel, khi_out_train_rel]
    opt['model']['which_networks'][0]['args']['unet']['in_channel'] = 2*nchan_out
    opt['model']['which_networks'][0]['args']['unet']['out_channel'] = nchan_out
    opt['model']['which_networks'][0]['args']['beta_schedule']['test']['linear_end'] = linear_end
    
    ### Write out JSON data
    fout = Path(dm_input_dir, fconfig_template.name)
    with fout.open('wt') as handle:
        json.dump(opt, handle, indent=4, sort_keys=False)
    
    return fout

def parse_args():
    parser = argparse.ArgumentParser("", add_help=False)
    parser.add_argument("--output_dir", help="This is the directory where lidar inpainting occurs", required=True, type=Path)
    parser.add_argument("--meas_dir", help="The directory containing chunked lidar measurements", required=True, type=Path)
    parser.add_argument("--fconfig_template", help="The template .json file for the DM inpainting configuration", required=True, type=Path)
    parser.add_argument("--chunk_num", help="The current chunk number, which will determine the type of mask used", required=True, type=int)
    parser.add_argument("--cascade_num", help="The number of times we have expanded outward horizontally so far", required=True, type=int)
    parser.add_argument("--batchsize", help="The sampling batchsize", required=True, type=int)
    parser.add_argument("--lower_cascade_dir", help="The directory of the previous, lower cascade", type=Path)
    parser.add_argument("--training_data_dir", help="The directory with data that was used to train this network", required=True, type=Path)
    parser.add_argument("--training_checkpoint", help="The checkpoint file with trained weights", required=True, type=str)
    parser.add_argument("--linear_end", help="The max value of noise in the DM", default=0.01, type=float)
    parser.add_argument("--umin", help="The minimum value of u in physical units", default=1.34493249, type=float)
    parser.add_argument("--umax", help="The maximum value of u in physical units", default=16.47643647, type=float)
    parser.add_argument("--vmin", help="The minimum value of v in physical units", default=-5.15847191, type=float)
    parser.add_argument("--vmax", help="The maximum value of v in physical units", default=5.7184444, type=float)
    parser.add_argument("--wmin", help="The minimum value of w in physical units", default=-3.23954867, type=float)
    parser.add_argument("--wmax", help="The maximum value of w in physical units", default=5.30643915, type=float)
    parser.add_argument("--Tmin", help="The minimum value of T in physical units", default=291.015079, type=float)
    parser.add_argument("--Tmax", help="The maximum value of T in physical units", default=292.80893903, type=float)
    parser.add_argument("--TKEmin", help="The minimum value of SGS TKE in physical units", default=-0.180486110, type=float)
    parser.add_argument("--TKEmax", help="The maximum value of SGS TKE in physical units", default=2.24261661, type=float)
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    dm_config = main(args.output_dir, args.meas_dir, args.fconfig_template, args.chunk_num,
                    args.cascade_num, args.batchsize, args.training_data_dir, args.training_checkpoint,
                    args.linear_end,
                    args.umin, args.umax, args.vmin, args.vmax, args.wmin, args.wmax,
                    args.Tmin, args.Tmax, args.TKEmin, args.TKEmax,
                    args.lower_cascade_dir)
    sys.stdout.write(str(dm_config))