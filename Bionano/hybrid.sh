#!/bin/bash

export PATH="/project/personal/gaoyn/software/Solve3.3_10252018/RefAligner/7915.7989rel/:$PATH"
export PATH=/project/personal/zhangh/0.software/Myconda/bin:$PATH

perl /project/personal/gaoyn/software/Solve3.3_10252018/HybridScaffold/10252018/hybridScaffold.pl -n /project/personal/gaoyn/Bionano/ningxiang.fasta -b /project/personal/gaoyn/Bionano/ningxiang/output/contigs/exp_refineFinal1/EXP_REFINEFINAL1.cmap -c /project/personal/gaoyn/software/Solve3.3_10252018/HybridScaffold/10252018/hybridScaffold_config_aggressive.xml -r /project/personal/gaoyn/software/Solve3.3_10252018/RefAligner/7915.7989rel/RefAligner -o /project/personal/gaoyn/Bionano/ningxiang/hybrid/output -f -B 2 -N 2 -x -y -m /project/personal/gaoyn/Bionano/3.9311/filter/Merge.SD.bnx -p /project/personal/gaoyn/software/Solve3.3_10252018/Pipeline/10252018/ -q /project/personal/gaoyn/software/Solve3.3_10252018/RefAligner/7915.7989rel/optArguments_nonhaplotype_saphyr.xml -e /project/personal/gaoyn/Bionano/ningxiang/hybrid/output/output/contigs/auto_noise/autoNoise1.errbin
