# Processes

 The workflow has the following steps in it:

 - Input fasta pairs are aligned to one another with [muscle](http://www.drive5.com/muscle/muscle.html).
 - Gap characters in aligned fasta are replaces with X character. 
 - The pairs are split into individual fasta files with `faSplit byname` tool.
 - Each fasta for the pair is then fragmented using the `pyfasta split` where `-k` flag is used to define window size and `-o` flag is used to define overlap between fragments. 
 -Fragmented files are then subjected to `blastp`.
 - `blastp` output is then parsed to obtain a table of fragment to fragment match and percent identity shared by a pair of fragments. 
 - The window size vs percent ID plots are generated to visualise the breakpoints of diversification and recombination.