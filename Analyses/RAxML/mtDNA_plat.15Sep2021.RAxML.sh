#!/bin/sh

~/software/raxml-ng_v1.0.2/raxml-ng --msa mtDNA_plat.trimmed.noND6.noProsim.aln.fasta --model partitions.txt --prefix T2 --outgroup NC_001643.1_Pan_troglodytes,NC_020008.2_Papio_kindae,NC_018753.1_Nomascus_gabriellae,NC_006901.1_Colobus_guereza --threads 4 --seed 2 --tree pars{25},rand{25}
