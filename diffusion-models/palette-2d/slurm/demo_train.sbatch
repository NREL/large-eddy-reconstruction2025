#!/bin/bash
#SBATCH --nodes=1          #
#SBATCH --time=48:00:00    # Set time limit
#SBATCH --partition=gpu-h100
#SBATCH --account=<ACCOUNT>
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:h100:4          # GPU request
#SBATCH --output=logs/%x.%j.out

module load conda
conda activate /projects/ai4wind/orybchuk/conda/sciml_2405

export CUDA_VISIBLE_DEVICES=0,1,2,3
export MPICH_GPU_SUPPORT_ENABLED=1
OMPI_MCA_opal_cuda_support=true

python run.py -c <CONFIG JSON FILE> -gpu 0,1,2,3 -b 32
