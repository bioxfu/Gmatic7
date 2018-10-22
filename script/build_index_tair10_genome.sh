samtools faidx tair10.fa

mkdir bowtie
bowtie-build tair10.fa bowtie/tair10

mkdir bowtie2
bowtie2-build tair10.fa bowtie2/tair10

mkdir hisat2
hisat2-build tair10.fa hisat2/tair10

mkdir bwa
bwa index -p bwa/tair10 tair10.fa 

bismark_genome_preparation --genomic_composition --verbose .

mkdir BRAT-bw
$HOME/Gmatic7/script/build_bw -P $HOME/Gmatic7/genome/tair10/BRAT-bw -G 1 -r file_with_references.txt
$HOME/Gmatic7/script/build_bw -P $HOME/Gmatic7/genome/tair10/BRAT-bw -G 2 -r file_with_references.txt
