samtools faidx GRCh38.fa

mkdir STAR
STAR --runThreadN 30 --runMode genomeGenerate --genomeDir ./STAR --genomeFastaFiles ./GRCh38.fa

mkdir bowtie
bowtie-build GRCh38.fa bowtie/GRCh38

mkdir bowtie2
bowtie2-build GRCh38.fa bowtie2/GRCh38

mkdir hisat2
hisat2-build GRCh38.fa hisat2/GRCh38

mkdir bwa
bwa index -p bwa/GRCh38 GRCh38.fa 

bismark_genome_preparation --genomic_composition --verbose .

mkdir BRAT-bw
$HOME/Gmatic7/script/build_bw -P $HOME/Gmatic7/genome/GRCh38/BRAT-bw -G 1 -r file_with_references.txt
$HOME/Gmatic7/script/build_bw -P $HOME/Gmatic7/genome/GRCh38/BRAT-bw -G 2 -r file_with_references.txt
