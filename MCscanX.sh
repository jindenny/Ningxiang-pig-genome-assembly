#!/bash
les Ningxiangzhu.genomic.gff.longest.gff3 | awk '$3=="mRNA" && $1=="Chr02"' |awk '{if ($4>=150117650 && $5<=152282630)print }' |sed 's/;/\t/g' | cut -f9 |sed 's/ID=//g' > NXZ_Tandem_1M.id 
les GCF_000003025.6_Sscrofa11.1_genomic.gff |awk '$3=="mRNA" && $1=="NC_010444.4"' |awk '{if ($4>=8607627 && $5<=10747405)print }' |sed 's/;/\t/g' | cut -f9 |sed 's/ID=//g' > DLK_Tandem_1M.rna.id 
les DLK_Tandem_1M.NC_010444.4.gff  | awk '$3=="CDS"' |awk '{if ($4>=8607627 && $5<=10747405)print }' |sed 's/;/\t/g' | awk '{printf $9"\t";for (i=9;i<=NF;i++){if ($i~/protein_id=/){printf $i}};printf "\n"}'| sed 's/ID=//;s/protein_id=//' | sort -u |cut -f2 > DLK_Tandem_1M.pep.id 
fishInWinter.pl -bf table -ff table NXZ_Tandem_1M.id ../at_vv.blast | awk '{if ($2!~/Pig/)print}' | awk '{print $2"\t"$1"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12}' > d_n.1.blast
fishInWinter.pl -bf table -ff table DLK_Tandem_1M.pep.id d_n.1.blast | awk '{print $2"\t"$1"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$12}'  > d_n.result.blast
perl top_hit.pl d_n.result.blast  > D_N.blast
les ../GCF_000003025.6_Sscrofa11.1_genomic.gff | awk ' $3=="CDS"' | sed 's/;/\t/g' | awk '{for (i=9;i<=NF;i++){if ($i~/Parent=/){printf $i"\t"}if ($i~/protein_id=/){printf $i"\n"}}}'|grep -v "gene" |sed 's/Parent=//;s/protein_id=//' | sort -u > DLK_rna-cds.id 
perl -e 'open IN,$ARGV[0];while (<IN>){chomp;@l=split;$a{$l[0]}.=$l[1];}open II,$ARGV[1];while (<II>){chomp;@l=split;print "$l[0]\t$l[1]\t$l[2]\t$a{$l[3]}\t$l[4]\t$l[5]\n"}' DLK_rna-cds.id DLK.bed  > DLK.NC_010444.4.bed
python -m jcvi.graphics.synteny test.txt pig.all.bed pig.layout --switch=pig.ids
