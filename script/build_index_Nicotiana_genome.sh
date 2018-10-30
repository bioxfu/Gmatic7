samtools faidx Niben101.fa

mkdir bowtie
bowtie-build Niben101.fa bowtie/Niben101

mkdir bowtie2
bowtie2-build Niben101.fa bowtie2/Niben101

mkdir hisat2
hisat2-build Niben101.fa hisat2/Niben101

mkdir bwa
bwa index -p bwa/Niben101 Niben101.fa 
