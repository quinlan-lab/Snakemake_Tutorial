###############
### IMPORTS ### 
###############
import os 
import sys
from typing import TextIO


#############
### SETUP ###
#############
# Using OOP, we can directly reference attributes from the current
# Snakemake rule. 
sys.stdout = sys.stderr = open(snakemake.log[0], "w")

sam_file: str = snakemake.input.sam
out_file: str = snakemake.output.cigar_counts

##############################
### FIND FULL MATCH CIGARS ###
##############################
with open(sam_file, "r") as in_conn: 
    matching: int = 0
    for _ in range(0, 4):
        line = in_conn.readline()

    for line in in_conn:
        fields: list[str] = line.split("\t")
        cigar: str = fields[5]
        sequence: str = fields[9]
        if cigar == f"{len(sequence)}M":
            matching += 1

    out_conn: TextIO = open(out_file, "w")
    out_conn.write(str(matching))
    out_conn.close()
