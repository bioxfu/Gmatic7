#! /usr/bin/env python

import sys
from Bio import SeqIO

for record in SeqIO.parse(sys.argv[1], 'swiss'):
	print ">%s\n%s" % (record.id, record.seq) 
