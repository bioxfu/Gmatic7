samtools faidx GRCm38.fa

mkdir STAR
STAR --runThreadN 30 --runMode genomeGenerate --genomeDir ./STAR --genomeFastaFiles ./GRCm38.fa

mkdir bowtie
bowtie-build GRCm38.fa bowtie/GRCm38

mkdir bowtie2
bowtie2-build GRCm38.fa bowtie2/GRCm38

mkdir hisat2
hisat2-build GRCm38.fa hisat2/GRCm38

mkdir bwa
bwa index -p bwa/GRCm38 GRCm38.fa 

bismark_genome_preparation --genomic_composition --verbose .

mkdir BRAT-bw
$HOME/Gmatic7/script/build_bw -P $HOME/Gmatic7/genome/GRCm38/BRAT-bw -G 1 -r file_with_references.txt
$HOME/Gmatic7/script/build_bw -P $HOME/Gmatic7/genome/GRCm38/BRAT-bw -G 2 -r file_with_references.txt

mkdir kallisto
kallisto index -i kallisto/GRCm38 GRCm38.fa
