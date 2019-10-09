## download human genome from GENCODE (https://www.gencodegenes.org/human/)
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_29/GRCh38.primary_assembly.genome.fa.gz
zcat GRCh38.primary_assembly.genome.fa.gz > GRCh38.fa

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_29/gencode.v29.transcripts.fa.gz
zcat gencode.v29.transcripts.fa.gz > GRCh38_trans.fa
