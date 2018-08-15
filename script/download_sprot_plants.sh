wget -c ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/taxonomic_divisions/uniprot_sprot_plants.dat.gz -P uniprot
wget -c ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/taxonomic_divisions/reldate.txt -P uniprot

source ~/Python/biopython/bin/activate
zcat uniprot/uniprot_sprot_plants.dat.gz > uniprot/uniprot_sprot_plants.dat

./script/swissprot2fasta.py uniprot/uniprot_sprot_plants.dat > uniprot/uniprot_sprot_plants.fa

rm uniprot/uniprot_sprot_plants.dat

