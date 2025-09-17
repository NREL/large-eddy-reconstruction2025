# Code to demonstrate a Large-Eddy Reconstruction (LER) approach
Here, we share code in support of the paper "Ensemble-based, large-eddy reconstruction of wind turbine inflow in a near-stationary atmospheric boundary layer through generative artificial intelligence". In this paper, we demonstrate that it is possible to blend real-world observations of the atmosphere as well as large-eddy simulation data in order to reconstruct the second-by-second dynamics of the real-world atmosphere in locations where you don't have observations. We do this blending through a machine learning algorithm (a diffusion model) that is highly tailored to the specific observational period of interest.

Our goal with this repo is to increase reproducibility of our study, and as such, the code that we share here reflects the state of the code at time of publication. This repo is *not* a streamlined software package that will run LER out of the box.

### `amr-wind-simulations/`
In our manuscript, we carried out many different large-eddy simulations with the code AMR-Wind. 
* We ran simulations in order to generate a machine learning training dataset.
* We ran simulations to generate ground truth data for a synthetic verification study.
* We ran simulations to mimic a SpinnerLidar, which is the instrument that we validate against in the real world.

### `reformat-les-data-for-training/`
After we ran AMR-Wind simulations, we needed to reformat the output of the LES code so that we could train a diffusion model on it.

### `diffusion-models/`
This repo contains the two-dimensional and three-dimensional diffusion models that our LER methodology is based on. We provide demo training and sampling scripts in the `slurm/` subdirectories. Our diffusion model code builds on top of [Janspiry's Palette code](https://github.com/Janspiry/Palette-Image-to-Image-Diffusion-Models).

### `analysis/`
Here, you can see the notebooks that we used to produce the figures in our paper.
