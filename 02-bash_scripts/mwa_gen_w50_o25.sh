#!/bin/bash
mkdir blast_out 
for F in fragmented_pairs/**/*.fa; do
  pyfasta split -k 50 -o 25 -n 1 $F ; 
done
