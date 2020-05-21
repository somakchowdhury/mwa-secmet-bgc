# Introduction

This workflow documentation explains how a moving window analysis can be done on a pair of protein sequences to ascertain start points of diversification or recombination. 

The use case here is modules of secondary metabolite producing genes. These modules contain protein domains which serve specific role in synthesis of natural products. 

## Prerequisites for the Workflow

 - A linux/Unix sub-system
 - Initialised miniconda package manager [link](https://docs.conda.io/projects/conda/en/latest/user-guide/install/)
 - Jupyter installed in the base environment of miniconda with bash kernel. 
 - Install BASH kernel for jupyter with following commands - 
 ```
 pip install bash_kernel
 python -m bash_kernel.install
 ```


 # Processes

 The workflow has the following steps in it:

 - Input fasta pairs are aligned to one another with [muscle](http://www.drive5.com/muscle/muscle.html).
 - Gap characters in aligned fasta are replaces with X character. 
 - The pairs are split into individual fasta files with `faSplit byname` tool.
 - Each fasta for the pair is then fragmented using the `pyfasta split` where `-k` flag is used to define window size and `-o` flag is used to define overlap between fragments. 
 -Fragmented files are then subjected to `blastp`.
 - `blastp` output is then parsed to obtain a table of fragment to fragment match and percent identity shared by a pair of fragments. 
 - The window size vs percent ID plots are generated to visualise the breakpoints of diversification and recombination.

 # Workflow Initialisation 

## Step 1: Getting the files

- Navigate to the directory where analysis needs to be conducted
```
 cd path/to/your/dir 
``` 
- Clone this repository in that directory
```
git clone https://github.com/somakchowdhury/mwa-secmet-bgc.git 
```

## Step 2: Access the `.ipynb` notebook to start workflow

- Navigate to `mwa-secmet-bgc` folder
```
cd mwa-secmet-bgc/
```
- Then run this command
```
jupyter notebook
```
- In the browser open the jupyter notebook file `.ipynb`

Follow through the steps listed in the workflow to obtain the desired output files. The input files can be changed. Only condition is that they should contain only a pair of fasta sequences. 

# Expected Outputs

Four unnumbered output folders will be created at the end of the workflow.

```
mwa-secmet-bgc
|___aligned_pairs/
|___fragmented_pairs/
|___blast_out/
|___result_plots/
|___result_tables/
```

The `results_plot/` contains pairwise graphs of the compared sequences with appropriate titles for subject and query

The `result_tables/` contains modified and filtered blast output tables that were used to produce the plots. 