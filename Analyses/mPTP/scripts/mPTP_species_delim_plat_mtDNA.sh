#!/bin/bash

cd $HOME/projects/species_delim/Platyrrhine_mtDNA

mkdir ML
mkdir MCMC

$HOME/software/mptp-0.2.4-linux-x86_64/bin/mptp --tree_file mtDNA_plat.RAxML.trimmed.noND6.noProsim.tree --minbr 0.0000760000 --output_file ML/plat_mtDNA.delim_out_single_ML --ml --single --outgroup NC_020008.2_Papio_kindae,NC_018753.1_Nomascus_gabriellae,NC_001643.1_Pan_troglodytes,NC_006901.1_Colobus_guereza --outgroup_crop

$HOME/software/mptp-0.2.4-linux-x86_64/bin/mptp --tree_file mtDNA_plat.RAxML.trimmed.noND6.noProsim.tree --minbr 0.0000760000 --output_file ML/plat_mtDNA.delim_out_multi_ML --ml --multi --outgroup NC_020008.2_Papio_kindae,NC_018753.1_Nomascus_gabriellae,NC_001643.1_Pan_troglodytes,NC_006901.1_Colobus_guereza --outgroup_crop

$HOME/software/mptp-0.2.4-linux-x86_64/bin/mptp --tree_file mtDNA_plat.RAxML.trimmed.noND6.noProsim.tree --minbr 0.0000760000 --output_file MCMC/plat_mtDNA.delim_out_single_MCMC --mcmc 1000000 --mcmc_sample 100 --mcmc_runs 2  --mcmc_log --single --outgroup NC_020008.2_Papio_kindae,NC_018753.1_Nomascus_gabriellae,NC_001643.1_Pan_troglodytes,NC_006901.1_Colobus_guereza --outgroup_crop  

$HOME/software/mptp-0.2.4-linux-x86_64/bin/mptp --tree_file mtDNA_plat.RAxML.trimmed.noND6.noProsim.tree --minbr 0.0000760000 --output_file MCMC/plat_mtDNA.delim_out_multi_MCMC --mcmc 1000000 --mcmc_sample 100 --mcmc_runs 2  --mcmc_log --multi --outgroup NC_020008.2_Papio_kindae,NC_018753.1_Nomascus_gabriellae,NC_001643.1_Pan_troglodytes,NC_006901.1_Colobus_guereza --outgroup_crop  
