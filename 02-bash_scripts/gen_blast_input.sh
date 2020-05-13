#!/bin/bash
for F in fragmented_pairs/**/*.split.50mer.25overlap.fa; do
  d="$(dirname $F)" 
  ln -s $F > /blast_input/$d ; 
done
