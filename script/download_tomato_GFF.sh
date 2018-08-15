# https://solgenomics.net/organism/Solanum_lycopersicum/genome
wget -c ftp://ftp.solgenomics.net/tomato_genome/annotation/ITAG3.2_release/ITAG3.2_gene_models.gff

cat ITAG3.2_gene_models.gff |grep 'sequence-region'|tr ' ' '\t'|cut -f4,6 > ../../genome/tomato/Sly3.chromSize

gffread ITAG3.2_gene_models.gff -T -o Sly3.gtf

cat ITAG3.2_gene_models.gff | awk '{if($3=="gene")print $1"\t"$4"\t"$5"\t"$9"\t"$7}'|sed 's/ID=gene://'|sed 's/;Alias=/\t/'|sed -r 's/;.+\t/\t/'|sort -k1,1 -k2,2n > Sly3_gene.bed

mkdir txdb

Rscript ../../script/makeTxdb.R Sly3.gtf txdb/Sly3_txdb.sqlite
