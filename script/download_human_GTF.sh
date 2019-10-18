wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_29/gencode.v29.primary_assembly.annotation.gtf.gz
zcat gencode.v29.primary_assembly.annotation.gtf.gz > GRCh38_v29.gtf
cat GRCh38_v29.gtf |awk '{if($3=="gene")print $10"\t"$14"\t"$12}'|sed 's/[";]//g' > GRCh38_v29_id2name2biotype

mkdir txdb
Rscript ../../script/makeTxdb.R GRCh38_v29.gtf txdb/GRCh38_v29_txdb.sqlite GRCh38_v29_merged_exons_length.tsv
