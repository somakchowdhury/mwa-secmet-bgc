[![Documentation Status](https://readthedocs.org/projects/mwa-secmet-bgc/badge/?version=latest)](https://mwa-secmet-bgc.readthedocs.io/en/latest/?badge=latest)

# mwa-secmet-bgc

This repository contains workflow for moving-window-analysis (MWA) carried out on secondary metabolite BGC genes of bacterial origin

Documentation  --> mwa-secmet-bgc.rtfd.io


The workflow requires the following preinstalled components on the system.

 - A linux sub-system
 - Initialised miniconda package manager
 - Jupyter installed in the base environment of miniconda.

## Step 1:

- Navigate to your directory
```
 cd path/to/your/dir 
``` 
- Clone this repository in that directory
```
git clone https://github.com/somakchowdhury/mwa-secmet-bgc.git 
```

## Step 2: 

- Navigate to `mwa-secmet-bgc` folder
- Then run this command
```
jupyter notebook
```
- In the browser open the jupyter notebook file `.ipynb`

Follow through the steps listed in the workflow. 

## Expected Outputs

Four unnumbered output folders will be created at the end of the workflow.

```
mwa-secmet-bgc
|___fragmented_pairs/
|___blast_out/
|___result_plots/
|___result_tables/
```

The `results_plot/` contains pairwise graphs of the compared sequences with appropriate titles for subject and query

The `result_tables/` contains modified and filtered blast output tables that were used to produce the plots. 
<!--stackedit_data:
eyJoaXN0b3J5IjpbODA0NTgzMTEzLC00Mzg1ODQ5MDEsLTI0MD
IwOTc3XX0=
-->