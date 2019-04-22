# download reference dataset
wget http://cf.10xgenomics.com/supp/cell-exp/refdata-cellranger-GRCh38-3.0.0.tar.gz
wget http://cf.10xgenomics.com/supp/cell-exp/refdata-cellranger-mm10-3.0.0.tar.gz

cellranger mkref --genome=tair10 --fasta=/home/xfu/Gmatic7/genome/tair10/tair10.fa --genes=/home/xfu/Gmatic7/gene/tair10/tair10.gtf

