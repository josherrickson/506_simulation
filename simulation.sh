#!/bin/bash

#SBATCH --job-name=simulation
#SBATCH --mail-user=jerrick@umich.edu
#SBATCH --mail-type=BEGIN,END
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=10:00
#SBATCH --account=cscar
#SBATCH --partition=standard

Rscript simulation.R
