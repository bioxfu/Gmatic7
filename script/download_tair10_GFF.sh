wget -c ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR10_genome_release/TAIR10_gff3/TAIR10_GFF3_genes.gff
wget -c ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR10_genome_release/TAIR10_gff3/TAIR10_GFF3_genes_transposons.gff

cat TAIR10_GFF3_genes.gff |grep 'chromosome'|cut -f1,5 > ../../genome/tair10/tair10.chromSize

gffread TAIR10_GFF3_genes.gff -T -o- | sed -r 's/\.[0-9]+"; gene_name/"; gene_name/' | sed -r 's/\.[0-9]+";$/";/' > tair10.gtf

cat TAIR10_GFF3_genes.gff | awk '{if($3=="gene")print $1"\t"$4-1"\t"$5"\t"$9"\t"$7}'|sed 's/ID=//'|sed 's/;Note=/\t/'|sed -r 's/;.+\t/\t/'|sort -k1,1 -k2,2n > tair10_gene.bed
cat TAIR10_GFF3_genes_transposons.gff | awk '{if($3=="transposable_element")print $1"\t"$4-1"\t"$5"\t"$9"\t"$7}'|sed 's/ID=//'|sed -r 's/;.+Alias=/\t/'|sort -k1,1 -k2,2n > tair10_TE.bed

astalavista -t asta -i tair10.gtf -e [ASE,ASI] --threads 30
zcat tair10_sorted.gtf_astalavista.gtf.gz > tair10_sorted.gtf_astalavista.gtf
