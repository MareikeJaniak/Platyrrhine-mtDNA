### script to generate sbatch files for running MitoFinder on all samples in list. Fastq files are trimmed, subsampled, and then run through mitofinder

ref_dir='/home/mcj43/scratch/MitoFinder/references'
trim_dir='/home/mcj43/scratch/MitoFinder/data'
data_dir='/home/mcj43/scratch/Salford/fastqs'
out_dir='/home/mcj43/scratch/MitoFinder/output'
mito_dir='/home/mcj43/scratch/MitoFinder'

while read line; do
	sampleID=$(echo $line | awk '{print $1}') 

	fileName=$(echo $line | awk '{print $2}') 

	ref=$(echo $line | awk '{print $5}')

	echo "#!/bin/bash
cd $mito_dir

cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --cores=12 -o $trim_dir/${fileName}_1.trimmed.fastq.gz -p $trim_dir/${fileName}_2.trimmed.fastq.gz $data_dir/${fileName}_1.fastq.gz $data_dir/${fileName}_2.fastq.gz

module load StdEnv/2020
module load bbmap/38.86

reformat.sh usejni=t ow=t in1=$trim_dir/${fileName}_1.trimmed.fastq.gz in2=$trim_dir/${fileName}_2.trimmed.fastq.gz out1=$trim_dir/${fileName}_1.trimmed.subsampled.fastq.gz out2=$trim_dir/${fileName}_2.trimmed.subsampled.fastq.gz samplereadstarget=3500000

cd $out_dir

module load java/13.0.2

mitofinder -j ${sampleID} --metaspades --override -1 $trim_dir/${fileName}_1.trimmed.subsampled.fastq.gz -2 $trim_dir/${fileName}_2.trimmed.subsampled.fastq.gz -r $ref_dir/${ref}_MT_ref.gb -o 2 -p 12 -m 50" > $mito_dir/sbatch/$sampleID.mitofinder.sh; done < $mito_dir/samples_MitoFinder_refs_all.tsv
