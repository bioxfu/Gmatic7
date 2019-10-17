wget -c ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR10_genome_release/TAIR10_functional_descriptions_20140331.txt

echo -e "name\tgene_model_type\tshort_description\tdetailed_description" > tair10_gene_anno.tsv
cat TAIR10_functional_descriptions_20140331.txt|grep '^AT[0-9]G'|cut -f1-4|sed -r 's/\.[0-9]+\t/\t/'|sort|uniq > tmp
cat tmp|grep 'other_rna'|cut -f1,2|sort|uniq|awk '{print $0"\tother RNA"}' > tmp2
cat tmp|grep 'transposable_element_gene'|cut -f1,2|sort|uniq|awk '{print $0"\ttransposable element gene"}' >> tmp2
cat tmp|grep -v 'other_rna'|grep -v 'transposable_element_gene' > tmp3
cat tmp2 tmp3|sed 's/ $//'|sort|uniq  >> tair10_gene_anno.tsv
rm tmp tmp2 tmp3
