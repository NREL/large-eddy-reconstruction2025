import argparse
import numpy as np
import os
from pathlib import Path
from shutil import move, copy, rmtree
import sys
from tempfile import mkstemp

def main(chunk_num, output_dir,
         umin, umax, vmin, vmax, wmin, wmax,
         Tmin, Tmax, TKEmin, TKEmax):
    '''
    Copy over the output of the DM to the working directory,
      and un-normalize that file
    '''
    ### Copy the output of the reconstructions
    ## Identify the inpainted sample
    curr_chunk_id = str(chunk_num).zfill(4)
    exec_dir_pattern = 'test_inpaint*'
    exec_dir = list(Path(output_dir).glob(exec_dir_pattern))[0]
    inpainted_samples = list(Path(exec_dir).glob(f'results/test/1/Out_data_chunk*.npy'))
    inpainted_samples.sort()
    n_batch = len(inpainted_samples)
    curr_dm_output_dir = Path(output_dir, f'chunk{curr_chunk_id}/output')
    curr_dm_output_dir.mkdir(exist_ok=True)

    ## Copy over the inpainted sample
    for inpainted_sample in inpainted_samples:
        copy(inpainted_sample, curr_dm_output_dir)

        ### Un-normalize the output
        curr_outfile_name = Path(curr_dm_output_dir, inpainted_sample.name)
        curr_output_arr_normed = np.load(curr_outfile_name)
        if curr_output_arr_normed.shape[0] == 1:
            curr_output_arr_unnormed = unnorm(curr_output_arr_normed, umin, umax)
        elif curr_output_arr_normed.shape[0] == 5:
            curr_output_arr_unnormed = np.zeros_like(curr_output_arr_normed)
            curr_output_arr_unnormed[0] = unnorm(curr_output_arr_normed[0], umin, umax)
            curr_output_arr_unnormed[1] = unnorm(curr_output_arr_normed[1], vmin, vmax)
            curr_output_arr_unnormed[2] = unnorm(curr_output_arr_normed[2], wmin, wmax)
            curr_output_arr_unnormed[3] = unnorm(curr_output_arr_normed[3], Tmin, Tmax)
            curr_output_arr_unnormed[4] = unnorm(curr_output_arr_normed[4], TKEmin, TKEmax)
        else:
            raise NotImplementedError(f"Add code for {curr_output_arr_normed.shape[0]} channels!")
        np.save(curr_outfile_name, curr_output_arr_unnormed)

    ## Delete the DM execution directory
    rmtree(exec_dir)

def unnorm(xp, xmin, xmax):
    '''
    Take data from [-1,1] back to the original values
    '''
    return (xp + 1)*0.5*(xmax-xmin)+xmin

def parse_args():
    parser = argparse.ArgumentParser("", add_help=False)
    parser.add_argument("--chunk_num", help="The current chunk number", required=True, type=int)
    parser.add_argument("--output_dir", help="This directory houses the inpainting for the current size", required=True, type=Path)
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
    main(args.chunk_num, args.output_dir,
            args.umin, args.umax, args.vmin, args.vmax, args.wmin, args.wmax,
            args.Tmin, args.Tmax, args.TKEmin, args.TKEmax)