#!/bin/bash
#SBATCH --nodes=1          #
#SBATCH --time=24:00:00    # Set time limit
# #SBATCH --time=12:00:00    # Set time limit
# #SBATCH --partition=short
# #SBATCH --time=00:59:00
# #SBATCH --partition=debug
#SBATCH --partition=gpu-h100
#SBATCH --account=airom
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:h100:4          # GPU request
#SBATCH --output=slurm/logs/%x.%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alex.rybchuk@gmail.com
#SBATCH --reservation=h100-testing
#SBATCH --exclusive

export MPICH_GPU_SUPPORT_ENABLED=1
export CUDA_VISIBLE_DEVICES=0,1,2,3
OMPI_MCA_opal_cuda_support=true

module load conda
conda activate /projects/ai4wind/orybchuk/conda/sciml_2405

# User inputs
echo "Reading in user inputs..."
OUTPUT_PARENT_DIR=/scratch/orybchuk/wakedynamics/bcs-ldm/palette_3d/concat_and_cascade/july17/1500
FCONFIG_TEMPLATE=/projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/config/template_sample_inpainting_july17.json

INPUT_DATA_DIR=/projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/concat_and_cascade/sampling_output/july17/1500/4_to_12/ensemble_recons/traunch3
TRAIN_DATA_DIR=/projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/experiments/july10_k0_12_0_24/dataset_info  # Obs at 3D
TRAINED_CHK=/projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/experiments/july10_k0_12_0_24/run11/8000
NZ_IN=12
NZ_OUT=24
NBATCH=8
LINEAR_END=0.01  # Run 11 uses a linear end of 0.01

# Values based on the regenerated LES dataset used for new lidar data (small differences)
UMAX=15.28925506
UMIN=-1.54859019
VMAX=7.40720122
VMIN=-7.41711377
WMAX=7.26906726
WMIN=-4.73665247
TMAX=322.20324584
TMIN=317.892112
TKEMAX=3.73675291
TKEMIN=-0.257892700

### ~~~~~~~~~~ 1-to-4 pixels tall ~~~~~~~~~~
CASCADE_NUM=0
# Create the working directory
echo "Creating the working directory..."
WORKING_DIR=$(python /projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/concat_and_cascade/06_create_concat_cascade_dir.py --output_parent_dir ${OUTPUT_PARENT_DIR} --meas_dir ${INPUT_DATA_DIR})
echo "Created the working directory: ${WORKING_DIR}"

# Create the directory where we inpaint lidar measurements
echo "Creating the directory where we will inpaint lidar measurements..."
LIDAR_INPAINT_DIR=$(python /projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/concat_and_cascade/07_create_resolution_inpaint_dir.py --working_dir ${WORKING_DIR} --nz_in ${NZ_IN} --nz_out ${NZ_OUT})

# Prepare the DM config for the first sample
echo "Preparing the DM configuration for the first sample..."
CHUNK_NUM=0
DMCONFIG_DIR=$(python /projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/concat_and_cascade/08_prepare_dm_config.py --output_dir ${LIDAR_INPAINT_DIR} --meas_dir ${INPUT_DATA_DIR} --fconfig_template ${FCONFIG_TEMPLATE} --chunk_num ${CHUNK_NUM} --cascade_num ${CASCADE_NUM} --batchsize ${NBATCH} --training_data_dir ${TRAIN_DATA_DIR} --training_checkpoint ${TRAINED_CHK} --linear_end ${LINEAR_END} --umin ${UMIN} --umax ${UMAX} --vmin ${VMIN} --vmax ${VMAX} --wmin ${WMIN} --wmax ${WMAX} --Tmin ${TMIN} --Tmax ${TMAX} --TKEmin ${TKEMIN} --TKEmax ${TKEMAX})

# Inpaint the first sample
echo "Inpainting the first lidar sample..."
python run.py -p test -c ${DMCONFIG_DIR} -gpu 0,1,2,3 -b ${NBATCH}

# Cleanup after the first inpainting
echo "Cleaning up after the first sample..."
python /projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/concat_and_cascade/09_clean_after_inpaint.py --chunk_num ${CHUNK_NUM} --output_dir ${LIDAR_INPAINT_DIR} --umin ${UMIN} --umax ${UMAX} --vmin ${VMIN} --vmax ${VMAX} --wmin ${WMIN} --wmax ${WMAX} --Tmin ${TMIN} --Tmax ${TMAX} --TKEmin ${TKEMIN} --TKEmax ${TKEMAX}

for CHUNK_NUM in {1..4}
do
    date +"Date : %d/%m/%Y Time : %H:%M:%S"
    echo "Preparing the DM configuration for sample ${CHUNK_NUM}..."
    DMCONFIG_DIR=$(python /projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/concat_and_cascade/08_prepare_dm_config.py --output_dir ${LIDAR_INPAINT_DIR} --meas_dir ${INPUT_DATA_DIR} --fconfig_template ${FCONFIG_TEMPLATE} --chunk_num ${CHUNK_NUM} --cascade_num ${CASCADE_NUM} --batchsize ${NBATCH} --training_data_dir ${TRAIN_DATA_DIR} --training_checkpoint ${TRAINED_CHK} --linear_end ${LINEAR_END} --umin ${UMIN} --umax ${UMAX} --vmin ${VMIN} --vmax ${VMAX} --wmin ${WMIN} --wmax ${WMAX} --Tmin ${TMIN} --Tmax ${TMAX} --TKEmin ${TKEMIN} --TKEmax ${TKEMAX})

    echo "Inpainting for sample ${CHUNK_NUM}..."
    python run.py -p test -c ${DMCONFIG_DIR} -gpu 0,1,2,3 -b ${NBATCH}

    echo "Cleaning up after the sample ${CHUNK_NUM}..."
    python /projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/concat_and_cascade/09_clean_after_inpaint.py --chunk_num ${CHUNK_NUM} --output_dir ${LIDAR_INPAINT_DIR} --umin ${UMIN} --umax ${UMAX} --vmin ${VMIN} --vmax ${VMAX} --wmin ${WMIN} --wmax ${WMAX} --Tmin ${TMIN} --Tmax ${TMAX} --TKEmin ${TKEMIN} --TKEmax ${TKEMAX}
done