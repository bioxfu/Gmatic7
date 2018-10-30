library(GenomicFeatures)

argv <- commandArgs(T)

gtf_fname <- argv[1]

txdb_fname <- argv[2]

gene_length_fname <- argv[3]

txdb <- GenomicFeatures::makeTxDbFromGFF(gtf_fname, format = 'gtf')

saveDb(txdb, file=txdb_fname)

# then collect the exons per gene id
exons.list.per.gene <- exonsBy(txdb, by="gene")
# then for each gene, reduce all the exons to a set of non overlapping exons, calculate their lengths (widths) and sum then
exonic.gene.sizes <- sapply(exons.list.per.gene, function(x){sum(width(reduce(x)))})

dfm <- data.frame(Length = exonic.gene.sizes)
write.table(dfm, gene_length_fname, col.names = NA, quote = F, sep = '\t')
