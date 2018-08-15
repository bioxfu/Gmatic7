samtools faidx Sly3.fa

mkdir bowtie
bowtie-build Sly3.fa bowtie/Sly3

mkdir bowtie2
bowtie2-build Sly3.fa bowtie2/Sly3

mkdir hisat2
hisat2-build Sly3.fa hisat2/Sly3

mkdir bwa
bwa index -p bwa/Sly3 Sly3.fa 

bismark_genome_preparation --genomic_composition --verbose .
