#!/bin/bash
mkdir result_tables
mkdir result_plots 
for F in blast_out/*.txt; do 
  N=$(basename $F .txt) ; 
  Rscript 03-rscripts/gen_annotated_blastTab_mod.R -t $F -o result_tables/$N.tsv -p $N.pdf ;
  mv $N.pdf result_plots ; 
done
