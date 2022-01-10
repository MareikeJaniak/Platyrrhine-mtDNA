#!/bin/bash

cd $HOME/projects/species_delim/Platyrrhine_mtDNA/

$HOME/software/mptp-0.2.4-linux-x86_64/bin/mptp --tree_file mtDNA_plat.RAxML.trimmed.noND6.noProsim.tree --minbr_auto mtDNA_plat.trimmed.noND6.noprosim.aln.fasta --output_file plat_mtDNA.minbr1

$HOME/software/mptp-0.2.4-linux-x86_64/bin/mptp --tree_file mtDNA_plat.RAxML.trimmed.noND6.noProsim.tree --minbr_auto mtDNA_plat.trimmed.noND6.noout.aln.fasta --output_file plat_mtDNA.minbr --outgroup NC_020008.2_Papio_kindae,NC_018753.1_Nomascus_gabriellae,NC_001643.1_Pan_troglodytes,NC_006901.1_Colobus_guereza --outgroup_crop 
