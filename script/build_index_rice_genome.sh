samtools faidx Osativa_Nipponbare.fa

mkdir bowtie
bowtie-build Osativa_Nipponbare.fa bowtie/Osativa_Nipponbare

mkdir bwa
bwa index -p bwa/Osativa_Nipponbare Osativa_Nipponbare.fa 

