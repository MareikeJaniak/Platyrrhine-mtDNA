### script to generate sbatch files for running MitoFinder on all samples in list. Reruns the mitofinder annotation step with a contig size cutoff, in order to properly annotate and format the output files for samples that had more than one matching contig. 

ref_dir='/home/mcj43/scratch/MitoFinder/references'
trim_dir='/home/mcj43/scratch/MitoFinder/data'
out_dir='/home/mcj43/scratch/MitoFinder/output'
mito_dir='/home/mcj43/scratch/MitoFinder'

while read line; do
        sampleID=$(echo $line | awk '{print $1}') 

        fileName=$(echo $line | awk '{print $2}') 

        ref=$(echo $line | awk '{print $5}')

        echo "#!/bin/bash

cd $out_dir

mitofinder -j ${sampleID} --contig-size-min 10000 --max-contig 1 --metaspades -1 $trim_dir/${fileName}_1.trimmed.subsampled.fastq.gz -2 $trim_dir/${fileName}_2.trimmed.subsampled.fastq.gz -r $ref_dir/${ref}_MT_ref.gb -o 2 -p 1 -m 4" > $mito_dir/sbatch/$sampleID.select.mitofinder.sh; done < $mito_dir/samples_MitoFinder_refs_all.tsv
