#!/bin/bash
mkdir fragmented_pairs
for F in 01-Input_data/*.fa; do 
  N=$(basename $F .fa) ; 
  mkdir fragmented_pairs/$N ; 
  faSplit byname $F fragmented_pairs/$N/ ; 
done
