#!/bin/bash

#SBATCH --job-name=simulation_futures
#SBATCH --mail-user=jerrick@umich.edu
#SBATCH --mail-type=BEGIN,END
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=10:00
#SBATCH --account=test
#SBATCH --partition=standard
#SBATCH --output=/home/%u/%x-%j.log

Rscript simulation-futures.R
