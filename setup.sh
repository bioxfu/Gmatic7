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

## Nicotiana benthamiana
mkdir genome/Niben
mkdir gene/Niben
cd genome/Niben
download_Nicotiana_genome.sh
build_index_Nicotiana_genome.sh
cd -
cd gene/Niben
download_Nicotiana_GFF.sh
download_Nicotiana_anno.sh

## mouse
mkdir genome/mouse
mkdir gene/mouse
cd genome/mouse
download_mouse_genome.sh
build_index_mouse_genome.sh
cd -
cd gene/mouse
download_mouse_GTF.sh

## human
mkdir genome/human
mkdir gene/human
cd genome/human
download_human_genome.sh
build_index_human_genome.sh
cd -
cd gene/human
download_human_GTF.sh

## GtRNAdb
download_GtRNAdb.sh

## Uniprot/Swissprot
mkdir uniprot
download_sprot_plant.sh

## Repbase
mkdir Repbase
cd Repbase
download_and_install_repbase.sh

