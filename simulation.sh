#!/bin/bash

#SBATCH --job-name=simulation
#SBATCH --mail-user=jerrick@umich.edu
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=10:00
#SBATCH --account=stats506f24_class
#SBATCH --partition=standard

module load R
Rscript simulation.R
