#!/bin/bash

#SBATCH --job-name=simulation_futures
#SBATCH --mail-user=jerrick@umich.edu
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=10:00
#SBATCH --account=stats506f23-class
#SBATCH --partition=standard

module load R
Rscript simulation-futures.R
