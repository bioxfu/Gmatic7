source activate gmatic
export PATH=$PWD/script:$PATH

mkdir genome
mkdir gene

## Arabidopsis thaliana
mkdir genome/tair10
mkdir gene/tair10

cd genome/tair10
download_tair10_genome.sh
build_index_tair10_genome.sh
cd -

cd gene/tair10
download_tair10_GFF.sh
download_tair10_anno.sh

## Solanum lycopersicum
mkdir genome/tomato
mkdir gene/tomato

cd genome/tomato
download_tomato_genome.sh
build_index_tomato_genome.sh
cd -

cd gene/tomato
download_tomato_GFF.sh
cd -

## GtRNAdb
download_GtRNAdb.sh

## Uniprot/Swissprot
mkdir uniprot
download_sprot_plant.sh

## Repbase
mkdir Repbase
cd Repbase
download_and_install_repbase.sh

