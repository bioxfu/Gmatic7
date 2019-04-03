source activate icount
# Get list of available ENSEMBL releases:
iCount releases
# Get list of available species for given ENSEMBL release:
iCount species -r 88

# Download the human/mouse genome sequence from release 88:
iCount genome homo_sapiens -r 88
iCount genome mus_musculus -r 88

# Download the annotation of human/mouse genome from release 88:
iCount annotation homo_sapiens -r 88
iCount annotation mus_musculus -r 88

# Generate human/mouse genome index that is used by STAR mapper:
mkdir hs88 mm88
iCount indexstar homo_sapiens.88.fa.gz hs88 --annotation homo_sapiens.88.gtf.gz --threads 20
iCount indexstar mus_musculus.88.fa.gz mm88 --annotation mus_musculus.88.gtf.gz --threads 20

# Generate a new annotation file with genome segmentation:
iCount segment homo_sapiens.88.gtf.gz hs88seg.gtf.gz homo_sapiens.88.fa.gz.fai 
iCount segment mus_musculus.88.gtf.gz mm88seg.gtf.gz mus_musculus.88.fa.gz.fai 


zcat homo_sapiens.88.gtf.gz|awk -F '\t' '{if($3=="gene")print $1"\t"$4-1"\t"$5"\t"$9}'|grep 'protein_coding'|grep -v '^[KG]' > homo_sapiens.88.pc.gene.bed
zcat mus_musculus.88.gtf.gz|awk -F '\t' '{if($3=="gene")print $1"\t"$4-1"\t"$5"\t"$9}'|grep 'protein_coding'|grep -v '^[JG]' > mus_musculus.88.pc.gene.bed

paste hs88/chrName.txt hs88/chrLength.txt > homo_sapiens.88.chrLength
paste mm88/chrName.txt mm88/chrLength.txt > mus_musculus.88.chrLength

zcat homo_sapiens.88.fa.gz > homo_sapiens.88.fa
zcat mus_musculus.88.fa.gz > mus_musculus.88.fa

wget -c http://www.genemine.org/codes/GTFtools_0.6.5.zip
zcat mus_musculus.88.gtf.gz > mus_musculus.88.gtf
zcat homo_sapiens.88.gtf.gz > homo_sapiens.88.gtf

python GTFtools_0.6.5/gtftools.py -i mus_musculus.88.intron.bed mus_musculus.88.gtf
python GTFtools_0.6.5/gtftools.py -i homo_sapiens.88.intron.bed homo_sapiens.88.gtf

grep -v '#' homo_sapiens.88.gtf|awk '{if($3=="gene")print $14"-"$10"\t"$5-$4+1}'|sed 's/[";]//g' > homo_sapiens.88.gtf.geneLen
grep -v '#' mus_musculus.88.gtf|awk '{if($3=="gene")print $14"-"$10"\t"$5-$4+1}'|sed 's/[";]//g' > mus_musculus.88.gtf.geneLen

grep -v '#' homo_sapiens.88.gtf|awk '{if($3=="gene")print $1"\t"$4-1"\t"$5"\t"$14"-"$10"\t.\t"$7}'|sed 's/[";]//g' > homo_sapiens.88.gtf.gene.bed
grep -v '#' mus_musculus.88.gtf|awk '{if($3=="gene")print $1"\t"$4-1"\t"$5"\t"$14"-"$10"\t.\t"$7}'|sed 's/[";]//g' > mus_musculus.88.gtf.gene.bed
