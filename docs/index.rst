=================
mwa-secmet-bgc
=================
This is the documentation for the workflow associated with moving window 
analysis for a pair of sequences that have been prealigned. The workflow 
lets you split the sequences in input fasta file based on a custom window
size and and overlap between windows. These split sequences are then 
subjected to pairwise comparison using blastp or blastn depending on the
alphabet to generate blast tables. The blast tables are modified and visualised
to show variations in percent identity across the windows. 



---------------------------------
Getting started with the workflow
---------------------------------
The workflow requires the following preinstalled components on the system.

* A linux sub-system 
* Initialised miniconda package manager
* Jupyter installed in the base environment of miniconda - 
  
  `conda install jupyter`

Introduction
============

This is an example reStructuredText document that starts at the very top
with a title and a sub-title. There is one primary header, Introduction.
There is one example subheading below.
The document is just plain text so it is easily readable even before
being converted to HTML, man page, PDF or other formats.

Subheading
----------

The basic syntax is not that different from Markdown, but it also
has many more powerful features that Markdown doesn't have. We aren't
taking advantage of those yet though.

- Bullet points
- Are intuitive
- And simple too