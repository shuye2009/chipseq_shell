#!/usr/bin/bash
wd=$1
index=$2

cd $wd
for f1 in *_R1_001.fastq.gz; do

	inprefix="$(basename $f1 _R1_001.fastq.gz)"
	submitjob -m 20 $HOME/chipseq_script/chipseq_data_processing_se.sh ${inprefix} ${f1} ${index}

done
