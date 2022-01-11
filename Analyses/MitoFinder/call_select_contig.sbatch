#!/bin/bash

#SBATCH --account=def-amelin
#SBATCH --time=0:20:00
#SBATCH -N 1 
#SBATCH -n 1
#SBATCH --mem-per-cpu=4G
#SBATCH --job-name=MitoFinder
#SBATCH -e /home/mcj43/scratch/MitoFinder/errors/job%a.select.MitoFinder.err
#SBATCH -o /home/mcj43/scratch/MitoFinder/stdout/job%a.select.MitoFinder.out

# Call with sbatch --array=1-${NUM_INDIVIDUALS} call_select_contig.sbatch

#### LOAD MODULES ####

module load StdEnv/2020
module load java/13.0.2

#### VARIABLES ####

working_dir='/home/mcj43/scratch/MitoFinder'

THIS_IND=`awk "NR==$SLURM_ARRAY_TASK_ID" /home/mcj43/scratch/MitoFinder/individuals_multi_contig.txt`

#### RUN ####

cd $working_dir

bash sbatch/${THIS_IND}.select.mitofinder.sh
