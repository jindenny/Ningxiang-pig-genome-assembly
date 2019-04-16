#!/bin/sh
date
hostname
Sample=$1
ls ../00_data/*.clean.fastq > ${Sample}.lst
/export/personal/lijj/0.temp/1.script/KmerFreq_AR -k 17 -t 10 -q 33 -p ${Sample} ${Sample}.lst > kmerfreq.cout 2>kmerfreq.cerr
date
echo "kmerfreq finished"
/export/personal/lijj/0.temp/2.software/R-patched/bin/Rscript /export/personal/lijj/0.temp/1.script/Survey/kmerfreq_17-mer.R ${Sample}.freq.stat 
date
echo "kmer freq done"
