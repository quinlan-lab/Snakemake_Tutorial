# Set pipefail so that the first error exits the script. 
set -eou pipefail

SAM=${snakemake_input[sam]}
BAM=${snakemake_output[bam]}

LOG=${snakemake_log[stderr]}
samtools view --bam $SAM -o $BAM 2> $LOG
