#!/usr/bin/bash
wd=$1
cd $wd
for f1 in *_R1_001.fastq.gz; do

	inprefix="$(basename $f1 _R1_001.fastq.gz)"
	outprefix="$(echo ${f1}|cut -d_ -f3-5)"
	f2=${inprefix}_R2_001.fastq.gz
	submitjob -m 20 $HOME/chipseq_script/chipseq_data_processing_pe.sh ${outprefix} ${f1} ${f2}

done
