library(GenomicFeatures)

argv <- commandArgs(T)

gtf_fname <- argv[1]

txdb <- GenomicFeatures::makeTxDbFromGFF(gtf_fname, format = 'gtf')

saveDb(txdb, file=argv[2])

