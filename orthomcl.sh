set -e #if there is a error in the running of shell, it exit!
/export/apps/software/Annotation/software/analysis/orthomclSoftware-v2.0.9/bin/orthomclLoadBlast ./orthomcl.config similarSequences.txt
/export/apps/software/Annotation/software/analysis/orthomclSoftware-v2.0.9/bin/orthomclPairs ./orthomcl.config orthomcl_pairs.log cleanup=no
/export/apps/software/Annotation/software/analysis/orthomclSoftware-v2.0.9/bin/orthomclDumpPairsFiles ./orthomcl.config
/home/tiany/software/phylogeny/latest/bin/mcl mclInput -te 50 -I 1.5 -o mclOutput --abc
/export/apps/software/Annotation/software/analysis/orthomclSoftware-v2.0.9/bin/orthomclMclToGroups Group_ 0000 < mclOutput > group.txt
/export/apps/software/Annotation/software/analysis/orthomclSoftware-v2.0.9/bin/orthomclPairs ./orthomcl.config orthomcl_pairs.log cleanup=all
