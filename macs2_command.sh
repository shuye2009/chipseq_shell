#!/bin/bash

treat=$1 # CMTR1_ChIP-1*.sam CMTR1_ChIP-2*.sam
control=$2 # CMTR1_INP-1*.sam CMTR1_INP-2*.sam
prefix=$3 # CMTR1_chipseq
wd=$4
inputFormat=$5
outdir=$6
mkdir -p $outdir

cd $wd
macs2 callpeak -t $treat -c $control -f $inputFormat --call-summits -n $prefix --cutoff-analysis --outdir $outdir
