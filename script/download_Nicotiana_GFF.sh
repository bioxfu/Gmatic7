wget -c ftp://ftp.solgenomics.net/genomes/Nicotiana_benthamiana/annotation/Niben101/Niben101_annotation.gene_models.gff

cat Niben101_annotation.gene_models.gff | gffread -T -o-|sed 's/geneID/gene_id/' > Niben101.gtf

cat Niben101_annotation.gene_models.gff | awk '{if($3=="gene")print $1"\t"$4"\t"$5"\t"$9"\t"$7}'|sed 's/ID=//'|sed 's/;Alias=/\t/'|sed -r 's/;.+\t/\t/'|sort -k1,1 -k2,2n > Niben101_gene.bed

mkdir txdb

Rscript ../../script/makeTxdb.R Niben101.gtf txdb/Niben101_txdb.sqlite Niben101_merged_exons_length.tsv
