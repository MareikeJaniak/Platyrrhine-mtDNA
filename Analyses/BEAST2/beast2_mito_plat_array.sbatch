#!/bin/bash

#SBATCH --partition=long-serial
#SBATCH -e /home/users/mjaniak/projects/BEAST2/errors/mtDNA_plat_run13_chain%a.err
#SBATCH -o /home/users/mjaniak/projects/BEAST2/errors/mtDNA_plat_run13_chain%a.out
#SBATCH --job-name=beast_plat13
#SBATCH --time=160:00:00
#SBATCH --array=1-2
#SBATCH -N 1
#SBATCH -n 1

cd $HOME/projects/BEAST2/Platyrrhine_mtDNA/runs/run13_15Sep2021/chain${SLURM_ARRAY_TASK_ID}/

conda activate beast2

beast mtDNA_plat_bModelTest_relaxedClock.xml
