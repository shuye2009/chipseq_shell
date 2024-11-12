#!/bin/bash
wd=$1
index=$2
factor=$3
field=$4
cd $wd
for f11 in *${factor}*_L001_R1_001.fastq.gz; do

	outprefix="$(echo ${f11}|cut -d_ -f${field})"
	
	inprefix=$(basename $f11 _L001_R1_001.fastq.gz)
	f12=${inprefix}_L002_R1_001.fastq.gz
	f21=${inprefix}_L001_R2_001.fastq.gz
	f22=${inprefix}_L002_R2_001.fastq.gz
	
	submitjob -w 100 -m 20 $HOME/chipseq_script/chipseq_data_processing_pe.sh ${outprefix} ${f11},${f12} ${f21},${f22} $index

done
