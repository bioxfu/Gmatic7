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

mkdir ref
cat TAIR10_chr1.fas | sed -r 's/ CHROMOSOME.+//' > ref/Chr1.fa
cat TAIR10_chr2.fas | sed -r 's/ CHROMOSOME.+//' > ref/Chr2.fa
cat TAIR10_chr3.fas | sed -r 's/ CHROMOSOME.+//' > ref/Chr3.fa
cat TAIR10_chr4.fas | sed -r 's/ CHROMOSOME.+//' > ref/Chr4.fa
cat TAIR10_chr5.fas | sed -r 's/ CHROMOSOME.+//' > ref/Chr5.fa
cat TAIR10_chrC.fas | sed -r 's/chloroplast CHROMOSOME.+/ChrC/' > ref/ChrC.fa
cat TAIR10_chrM.fas | sed -r 's/mitochondria CHROMOSOME.+/ChrM/' > ref/ChrM.fa

rm TAIR10_chr*

echo "$PWD/ref/Chr1.fa" >  file_with_references.txt
echo "$PWD/ref/Chr2.fa" >> file_with_references.txt
echo "$PWD/ref/Chr3.fa" >> file_with_references.txt
echo "$PWD/ref/Chr4.fa" >> file_with_references.txt
echo "$PWD/ref/Chr5.fa" >> file_with_references.txt
echo "$PWD/ref/ChrC.fa" >> file_with_references.txt
echo "$PWD/ref/ChrM.fa" >> file_with_references.txt
