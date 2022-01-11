#!/bin/bash

#SBATCH --account=def-amelin
#SBATCH --time=8:00:00
#SBATCH -N 1 
#SBATCH -n 12
#SBATCH --mem-per-cpu=5G
#SBATCH --job-name=MitoFinder
#SBATCH -e /home/mcj43/scratch/MitoFinder/errors/job%a.MitoFinder.err
#SBATCH -o /home/mcj43/scratch/MitoFinder/stdout/job%a.MitoFinder.out

# Call with sbatch --array=1-${NUM_INDIVIDUALS} call_mitofinder.sbatch

#### LOAD MODULES ####

module load StdEnv/2020
module load bbmap/38.86
module load java/13.0.2

#### VARIABLES ####

working_dir='/home/mcj43/scratch/MitoFinder'

THIS_IND=`awk "NR==$SLURM_ARRAY_TASK_ID" /home/mcj43/scratch/MitoFinder/sample_list.txt`

#### RUN ####

cd $working_dir

bash sbatch/${THIS_IND}.mitofinder.sh
