## download tair10 genome
wget -c ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR10_chr1.fas
wget -c ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR10_chr2.fas
wget -c ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR10_chr3.fas
wget -c ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR10_chr4.fas
wget -c ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR10_chr5.fas
wget -c ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR10_chrC.fas
wget -c ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/TAIR10_chrM.fas

cat TAIR10_chr1.fas | sed -r 's/ CHROMOSOME.+//' >  tair10.fa
cat TAIR10_chr2.fas | sed -r 's/ CHROMOSOME.+//' >> tair10.fa
cat TAIR10_chr3.fas | sed -r 's/ CHROMOSOME.+//' >> tair10.fa
cat TAIR10_chr4.fas | sed -r 's/ CHROMOSOME.+//' >> tair10.fa
cat TAIR10_chr5.fas | sed -r 's/ CHROMOSOME.+//' >> tair10.fa
cat TAIR10_chrC.fas | sed -r 's/chloroplast CHROMOSOME.+/ChrC/' >> tair10.fa
cat TAIR10_chrM.fas | sed -r 's/mitochondria CHROMOSOME.+/ChrM/' >> tair10.fa

rm TAIR10_chr*
