wget http://rice.plantbiology.msu.edu/pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir/all.gff3 -O Osativa_Nipponbare.gff

gffread Osativa_Nipponbare.gff -T -o Osativa_Nipponbare.gtf

mkdir txdb

Rscript ../../script/makeTxdb.R Osativa_Nipponbare.gtf txdb/Osativa_Nipponbare_txdb.sqlite
