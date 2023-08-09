# Snakemake Tutorial
Joshua L. Major-Mincer 
Last updated: 08/08/23

## Environment
```
conda create --name snakemake_env -c bioconda -c conda-forge snakemake=7.30.2
```

## Quickstart
```
# Get snakemake tutorial. 
git clone git@github.com:quinlan-lab/Snakemake_Tutorial.git
cd Snakemake_Tutorial 

# Downloaded necessary files. 
wget https://drive.google.com/file/d/1QD5PYepbIEMZqwDwZ0WUkbTgyNh4YavH/view?usp=drive_link -O data.tar.gz

wget https://drive.google.com/file/d/1i5E7qnbywRsPXxjM3TG9VVWhl1579QOr/view?usp=drive_link -O reference.tar.gz

# Uncompress files. 
tar -zxvf data.tar.gz
tar -zxvf reference.tar.gz
```

## Description
This repository serves as an introduction to Snakemake for the members of the Quinlan lab. Each subdirectory is a module meant to provide information and practice with concepts that can help with the development and portability of Snakemake workflows. 