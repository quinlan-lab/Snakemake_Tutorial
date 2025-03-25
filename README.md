# Snakemake Tutorial
Joshua L. Major-Mincer 
Last updated: 03/24/2025

## WARNING
**Please ensure that you are on a compute or interactive node if you are testing this on the CHPC, NOT on a login node!**

## Quickstart
```
# Get snakemake tutorial. 
git clone https://github.com/quinlan-lab/Snakemake_Tutorial.git
cd Snakemake_Tutorial 

# Downloaded necessary files. 
wget https://snakemake-tutorial.s3.us-west-1.amazonaws.com/data.tar.gz -O data.tar.gz

wget https://snakemake-tutorial.s3.us-west-1.amazonaws.com/reference.tar.gz -O reference.tar.gz

# Uncompress files. 
tar -zxvf data.tar.gz
tar -zxvf reference.tar.gz

# Remove the archives if desired. 
rm data.tar.gz 
rm reference.tar.gz 

# Activate environment using either conda or environment modules.
# ====== OPTION 1 - Conda
conda env create -f envs/snakemake_env.yaml
conda activate snakemake_tutorial

# ====== OPTION 2 - Env Modules
module load bwa/2020_03_19 fastp/0.20.1 R/4.4.0 samtools/1.16 snakemake/8.16.0

```

## Description
This repository serves as an introduction to Snakemake for the members of the Quinlan lab. Each subdirectory is a module meant to provide information and practice with concepts that can help with the development and portability of Snakemake workflows. The concepts covered here are meant to provide an introductory lesson to how Snakemake workflows are generally structured, function, and 'tips-n-tricks' to make the most out of reproducible workflows. Each module uses the same input files, those that are downloaded and extracted into `data/` and `reference/`. As such, if you want to run the modules' Snakefiles to practice, **download the data.tar.gz and reference.tar.gz files before proceeding!**

There may be more to follow, but for now, advanced concepts such as rule output aggregation, parallel SLURM job execution, etc. will not be included. **If you would like any such concepts to be covered, or have any suggestions, please let me know!**

## Modules
Each module serves a purpose to introduce one or a few new concepts to build upon the previous ones, ordered numerically. Each module contains a Snakefile(s), and the inputs referenced are `data/` and `reference/`. Each comes with a README, providing a description on the new concepts introduced, as well as the command-line to run the pipeline. 
1. Module 1 - Basics: Shows the bare-bones skeleton of Snakemake workflows and how to get a minimally-function workflow running. 
2. Module 2 - Muliptple Rules: Illustrates the chaining of inputs-outputs of many rules to make a longer, more comprehensive workflow. 
3. Module 3 - Workflow Decorations: Some rules may need specific resources, such as CPU cores or RAM limits. This module shows how to define these. 
4. Module 4 - Branching: An intermediate output might need to have two separate operations performed on it. In this instance, it is useful to know how to "branch" the workflow into deviating paths. 
5. Module 5 - Config: Configurations are `.yaml` files that provide flexibility to the workflow using defined dictionary options. 
6. Module 6 - Conda or Modules: Snakemake provides the ability to define software environments to run the rule with. In this module, we exemplify the usage of either conda environments or installed modules on a high performance computing environment (i.e. `module load tool/1.0.0`)
7. Module 7 - ScriptsAndOOP: More complicated rules can be put into Python or R scripts, which is covered here. Additionally, illustrated is the Object Orientation of Snakemake and how to leverage this to make your workflow more legible. 
8. Module 8 - ProfilesAndSlurm: Information on how to run a pipeline using a cluster such as SLURM. Since this necessitates greater numbers of command line arguments, also covers profiles, which allow reproducible command line argument files.
9. Module 9 - Full Pipeline: This workflow ties together all of these concepts, with a few minor changes that can clean up and make your workflows neater and more legible. 


## Acknowledgement
1000 Genomes Acknowledgement for deep coverage of the 2504 phase 3 genomes (or subset thereof):

The following cell lines/DNA samples were obtained from the NIGMS Human Genetic Cell Repository at the Coriell Institute for Medical Research: [NA06984, NA06985, NA06986, NA06989, NA06994, NA07000, NA07037, NA07048, NA07051, NA07056, NA07347, NA07357, NA10847, NA10851, NA11829, NA11830, NA11831, NA11832, NA11840, NA11843, NA11881, NA11892, NA11893, NA11894, NA11918, NA11919, NA11920, NA11930. NA11931, NA11932, NA11933, NA11992, NA11994, NA11995, NA12003, NA12004, NA12005, NA12006, NA12043, NA12044, NA12045, NA12046, NA12058, NA12144, NA12154, NA12155, NA12156, NA12234, NA12249, NA12272, NA12273, NA12275, NA12282, NA12283, NA12286, NA12287, NA12340, NA12341, NA12342, NA12347, NA12348, NA12383, NA12399, NA12400, NA12413,, NA12414, NA12489, NA12546, NA12716, NA12717, NA12718, NA12748, NA12749, NA12750, NA12751, NA12760, NA12761, NA12762, NA12763, NA12775, NA12776, NA12777, NA12778, NA12812, NA12813, NA12814, NA12815, NA12827, NA12828, NA12829, NA12830, NA12842, NA12843, NA12872, NA12873, NA12874, NA12878, NA12889, NA12890]. These data were generated at the New York Genome Center with funds provided by NHGRI Grant 3UM1HG008901-03S1.

1000 Genomes Acknowledgement for deep coverage of the extended 3202 genomes (or subset thereof):
 
The following cell lines/DNA samples were obtained from the NIGMS Human Genetic Cell Repository at the Coriell Institute for Medical Research: [NA06984, NA06985, NA06986, NA06989, NA06991, NA06993, NA06994, NA06995, NA06997, NA07000, NA07014, NA07019, NA07022, NA07029, NA07031, NA07034, NA07037, NA07045, NA07048, NA07051, NA07055, NA07056, NA07340, NA07345, NA07346, NA07347, NA07348, NA07349, NA07357, NA07435, NA10830, NA10831, NA10835, NA10836, NA10837, NA10838, NA10839, NA10840, NA10842, NA10843, NA10845, NA10846, NA10847, NA10850, NA10851, NA10852, NA10853, NA10854, NA10855, NA10856, NA10857, NA10859, NA10860, NA10861, NA10863, NA10864, NA10865, NA11829, NA11830, NA11831, NA11832, NA11839, NA11840, NA11843, NA11881, NA11882, NA11891, NA11892, NA11893, NA11894, NA11917, NA11918, NA11919, NA11920, NA11930, NA11931, NA11932, NA11933, NA11992, NA11993, NA11994, NA11995, NA12003, NA12004, NA12005, NA12006, NA12043, NA12044, NA12045, NA12046, NA12056, NA12057, NA12058, NA12144, NA12145, NA12146, NA12154, NA12155, NA12156, NA12234, NA12239, NA12248, NA12249, NA12264, NA12272, NA12273, NA12274, NA12275, NA12282, NA12283, NA12286, NA12287, NA12329, NA12335, NA12336, NA12340, NA12341, NA12342, NA12343, NA12344, NA12347, NA12348, NA12375, NA12376, NA12383, NA12386, NA12399, NA12400, NA12413, NA12414, NA12485, NA12489, NA12546, NA12707, NA12708, NA12716, NA12717, NA12718, NA12739, NA12740, NA12748, NA12749, NA12750, NA12751, NA12752, NA12753, NA12760, NA12761, NA12762, NA12763, NA12766, NA12767, NA12775, NA12776, NA12777, NA12778, NA12801, NA12802, NA12812, NA12813, NA12814, NA12815, NA12817, NA12818, NA12827, NA12828, NA12829, NA12830, NA12832, NA12842, NA12843, NA12864, NA12865, NA12872, NA12873, NA12874, NA12875, NA12877, NA12878, NA12889, NA12890, NA12891, NA12892]. These data were generated at the New York Genome Center with funds provided by NHGRI Grants 3UM1HG008901-03S1 and 3UM1HG008901-04S2.

Pending publication of our manuscript, please cite our biorxiv preprint (Byrska-Bishop et al.) as the marker paper for these data: https://www.biorxiv.org/content/10.1101/2021.02.06.430068v1 or doi: https://doi.org/10.1101/2021.02.06.430068.
