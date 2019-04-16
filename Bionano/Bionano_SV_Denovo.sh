# /project/personal/gaoyn/software/Solve3.3_10252018/Pipeline/10252018/clusterArguments.xml
# /project/personal/gaoyn/software/Solve3.3_10252018/Pipeline/clusterArguments.xml

usage() {
    echo "Usage: $0 -b <bnx-path> -l <output-path> -r <reference> -T <thread> -m" 1>&2;

    exit 1;
}

if [ $# -lt 1 ]; then
    usage
    exit
fi
#echo "$OPTS"
#eval set -- "$OPTS"
# B=0
# i=2
while true; do
  case "$1" in
    -b | --b ) bnx="$2";  shift; shift ;;
   # -e | --e ) name="$2"; shift; shift ;;
    -l | --l ) output=$2; shift; shift ;;
    -r | --r ) reference=$2;    shift; shift ;;
    -T | --t ) thread=$2; shift; shift ;;
    # -B | --b )   B=$2; shift; shift ;;
    # -i | --i )   i=$2; shift; shift ;;
    -h | --help )  usage; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

SOLVE_PATH=/project/personal/gaoyn/software/Solve3.3_10252018/

if [ ${reference} = "BSSSI" ]; then
        ref=xx
#        gap_common_segdup_min2_com10kb_seg50kb.bed
fi

if [ ${reference} = "BSPQI" ]; then
        ref=/project/personal/gaoyn/Bionano/ningxiang.cmap
#        common_segdup_min4_com10kb_seg50kb.bed
fi

echo /project/personal/zhangh/0.software/Myconda/bin/python $SOLVE_PATH/Pipeline/10252018/pipelineCL.py \
-l ${output} \
-t $SOLVE_PATH/RefAligner/7915.7989rel/ \
-C /project/personal/gaoyn/software/Solve3.3_10252018/Pipeline/clusterArguments.xml \
-b ${bnx} -d -U -y -i 2 -F 1 \
-a $SOLVE_PATH/RefAligner/7915.7989rel/optArguments_haplotype_saphyr_human.xml \
-r ${ref} \
-f 0.1 -J 40 -T ${thread} -N 4 \

/project/personal/zhangh/0.software/Myconda/bin/python $SOLVE_PATH/Pipeline/10252018/pipelineCL.py \
-l ${output} \
-t $SOLVE_PATH/RefAligner/7915.7989rel/ \
-C /project/personal/gaoyn/software/Solve3.3_10252018/Pipeline/clusterArguments.xml \
-b ${bnx} -d -U -y -i 2 -F 1 \
-a $SOLVE_PATH/RefAligner/7915.7989rel/optArguments_nonhaplotype_noES_noCut_saphyr.xml \
-r ${ref} \
-f 0.1 -J 40 -T ${thread} -N 4 \



