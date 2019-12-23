wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M19/gencode.vM19.primary_assembly.annotation.gtf.gz
zcat gencode.vM19.primary_assembly.annotation.gtf.gz > GRCm38_vM19.gtf

mkdir txdb
Rscript ../../script/makeTxdb.R GRCm38_vM19.gtf txdb/GRCm38_vM19_txdb.sqlite GRCm38_vM19_merged_exons_length.tsv
