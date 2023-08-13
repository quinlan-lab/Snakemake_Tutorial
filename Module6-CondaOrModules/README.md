# Module 
Joshua L. Major-Mincer  
Last Updated: 08/11/23

## Run Command
```
# For conda...
snakemake --cores 32 --use-conda --snakefile Snakefile_Conda

# For modules...
snakemake --cores 32 --snakefile Snakefile_Modules
```
## Description
When running Snakemake rules, you'll usually need some kind of installed software. Generally, Snakemake will look for the software that is loaded into your own environment, but a better practice is to explicitly define the software that is required by each rule. To do this, there are two main options: 
* Defining a conda environment with the software needed. 
* Defining modules present on a High Performance Computing environment. 

This module will cover both of these approaches, and each of these can be tested using the different Snakefiles.  
**For the proceeding modules, we will be using the conda approach, since this is more portable**. 

## Workflow
![DAG](dag.png)

## Concepts
### Conda Environments
To specify a conda environment which a rule should use, use the `conda: "path/to/environment.yaml"` workflow decorator. To see an example, see `rule fastp`.  
When defining this `conda` decoratory, you'll point to a path to a `.yaml` configuration file that defines: 
* `name`: the name of the conda environment. 
* `channels`: the channels to download the software from. 
* `dependencies`: a list of the packages that are needed in the environment. It is also good practice to **include the version of the software required by the rule**.  

In our `envs/bioinformatics.yaml` file, we require the `bwa`, `fastp`, `fastqc`, and `samtools` software to operate.  

When running a Snakemake workflow using the conda directive, you need to include the `--use-conda` command line argument to specify that you wish to... use conda. Upon running the pipeline, if the environment does not already exist, Snakemake will go through and download the required software into a conda environment stored in the `.snakemake/` hidden directory. **This strategy can be particularly useful when you need separate computing environments that depend on different software versions, such as requiring two environments dependent on different versions of Python or R!**

### HPC Modules
If you instead are running your workflow on a HPC environment and wish to use the included modules, then all you have to do to load the software using a typical `ml software` or `module load software` command within the `shell` portion of the Snakemake rule. 