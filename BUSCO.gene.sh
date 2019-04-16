#!/bin/sh
date
### embryophyta 4 plant ,mammalia 4 animal,insecta 4 insect.All eukaryota 4 eukaryota
Sample=$1
export PATH="/export/apps/software/Annotation/software/GPON/GenePredict/Augustus/latest/bin/:$PATH"
export PATH="/export/apps/software/Annotation/software/GPON/GenePredict/Augustus/latest/scripts/:$PATH"
export PYTHONPATH=/home/wenxl/.local/lib/python2.7/site-packages:$PYTHONPATH
export AUGUSTUS_CONFIG_PATH="/export/personal/lijj/0.temp/2.software/augustus-3.2.2/config"
/export/software/python-2.7.13/bin/python /export/apps/software/Annotation/busco-x/busco-3.0.1/scripts/run_BUSCO.py -i ${Sample} -o ${Sample}.BUSCO -l /export/apps/software/Annotation/data_db/Eukaryota/mammalia_odb9	 -m genome -f -c 15 -t ${Sample}.BUSCO
