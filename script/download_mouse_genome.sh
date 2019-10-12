## download mouse genome from GENCODE (https://www.gencodegenes.org/mouse/)
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M19/GRCm38.primary_assembly.genome.fa.gz
zcat GRCm38.primary_assembly.genome.fa.gz > GRCm38.fa

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M19/gencode.vM19.transcripts.fa.gz
zcat gencode.vM19.transcripts.fa.gz > GRCm38_trans.fa
grep '>' GRCm38_trans.fa |tr '|' '\t'|cut -f2,6|sort|uniq > GRCm38_gene2name.tsv

