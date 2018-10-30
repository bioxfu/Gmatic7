wget -c ftp://ftp.solgenomics.net/genomes/Nicotiana_benthamiana/annotation/Niben101/Niben101_annotation.functional.txt
echo -e 'GeneID\tDescription\tGO' > Niben101_gene_anno.tsv
cat Niben/Niben101_annotation.functional.txt|grep '^Niben'|cut -f1,4,6|sed -r 's/\.[0-9]+\t/\t/' >> Niben/Niben101_gene_anno.tsv

wget -c ftp://ftp.solgenomics.net/genomes/Nicotiana_benthamiana/annotation/Niben101/Niben101_annotation.proteins.wdesc.fasta.gz
zcat Niben101_annotation.proteins.wdesc.fasta.gz > Niben101_prot.fa
wget -c ftp://ftp.arabidopsis.org/home/tair/Proteins/TAIR10_protein_lists/TAIR10_pep_20110103_representative_gene_model

## BLAST to Arabidopsis
mkdir ortholog
module add bedtools/2.25.0
module add blast+/2.5.0
makeblastdb -dbtype prot -in TAIR10_pep_20110103_representative_gene_model -out ortholog/TAIR10_prot
blastp -query Niben101_prot.fa -db ortholog/TAIR10_prot -out ortholog/Niben101_vs_TAIR10.blast_out -num_threads 30 -evalue 1e-5 -outfmt 6 -max_target_seqs 1
cat ortholog/Niben101_vs_TAIR10.blast_out|cut -f1,2|grep -P '\.1\t'|sed -r 's/\..//g'|sort -k2,2|uniq > ortholog/Niben101_vs_TAIR10.tsv
