# Module 
Joshua L. Major-Mincer  
Last Updated: 08/11/23

## Run Command
```
snakemake --cores 32 --use-conda
```
## Description
You may need to write custom Python or R code to use in a Snakemake workflow. This module illustrates how to incorporate Python and R scripts into rules, as well as how to leverage Object Oriented Programming (OOP) nature of Python to access attributes of Snakemake objects to make the workflow more legible.  

## Workflow
![DAG](dag.png)

## Concepts
### OOP 
Snakemake's rules are Python objects, and each field in these is an attribute. Taking `rule bwa_mem` as an example, the input `r1_clean` has been changed to: 
```
input:
    r1_clean = rules.fastp.output.r1_clean
```

Let's break down what this means. 
* `rules`: This is the Python object containing all of our Snakemake rules. 
* `rules.fastp`: We reference the attributes of the `rule fastp`. 
* `rules.fastp.output`: We reference the output variables of `rule fastp`. 
* `rules.fastp.output.r1_clean`: We grab the value of the `r1_clean` output of `rule fastp`. In this case, this would be `"{out_dir}/data/{sample}_R1.clean.fastq"`.  

So, why is this useful? As we add more and more rules, it may get complicated to keep the order and linking of rules in track. **By referencing the expected input as the output of another rule using object attributes, we avoid the need to trace the input paths and output paths and can directly see which rules are linked to which.** Instead of trying to determine which other rules use `{out_dir}/data/{sample}_R1.clean.fastq`, we can instead directly see that `rule bwa_mem` uses the output of `rule fastp`. 

### Python Script
A toy rule is added, `rule full_cigar`, which calls a Python script to take find the amount of mapped reads that have 100% of bases matching to the reference genome.  
In `rule full_cigar`, our `shell` block has been replaced with a `script` block, which points to a path of either a Python or an R script. In this rule, we reference `scripts/full_match_cigar.py`.  
Taking a look at this file, we can see that we are able to directly reference `snakemake` objects. With the Snakemake API, we don't directly reference the rule; rather, when the script is called from a rule, the contents and attributes of that rule are passed directly to the script. For example, with wildcard `{sample}` equal to `Sample1`, `snakemake.input.sam` is equal to `output/data/Sample1-aligned.sam`. The path for the `output` file works the same. Aside from this, the rest of the Python script is just a normal Python script; no other special considerations are required. 

### R Script
Another toy rule, `rule average_mapq`, calculates the average mapping quality of the aligned `.sam` file using an R script. Like the Python scripts, the R script functions essentially the same; the `snakemake` object is an S4 object that contains the same fields as the rule, including `snakemake@log`, `snakemake@input`, and `snakemake@avg_mapq`. **The use of these scripts are highly useful for writing custom code and keeping the base workflow legible.**