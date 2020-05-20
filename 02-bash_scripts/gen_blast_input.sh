#!/bin/bash

#Create Output Directories
mkdir x
mkdir aligned_pairs
mkdir fragmented_pairs
mkdir blast_out

for F in 01-Input_data/*.fa; do 
  N=$(basename $F .fa) ;
  muscle -in $F -out x/$N.fa -quiet ;
done

for F in x/*.fa; do 
  N=$(basename $F .fa) ;
  awk '/^[^>]/{gsub("-","X");print toupper($0);next;}1' $F > aligned_pairs/$N.fa ; 
done

rm -Rf x

for F in aligned_pairs/*.fa; do 
  N=$(basename $F .fa) ; 
  mkdir fragmented_pairs/$N ; 
  faSplit byname $F fragmented_pairs/$N/ ; 
done

for F in fragmented_pairs/**/*.fa; do
  pyfasta split -k 50 -o 25 -n 1 $F ; 
done






