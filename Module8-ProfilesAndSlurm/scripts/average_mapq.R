#############
### SETUP ###
#############
# https://stackoverflow.com/questions/64101921/snakemake-how-to-log-python-scripts-executed-by-script-directive
log <- file(snakemake@log[[1]], open = "wt")
sink(log)

sam_file <- snakemake@input$sam
out_file <- snakemake@output$avg_mapq

#########################
### FIND AVERAGE MAPQ ###
#########################
# There can be variable field numbers in SAM files. Find the maximum. 
# https://sites.psu.edu/biomonika/2017/09/08/reading-text-files-with-variable-number-of-columns-in-r/
max_cols <- max(count.fields(sam_file, sep="\t", comment.char="", quote=''))

# Read in SAM file. 
data <- read.csv(
    sam_file, 
    sep = "\t", 
    header = FALSE, 
    comment.char = "", 
    quote = '', 
    skip = 4,
    col.names = c(1:max_cols))

data <- data[data[["X3"]] != "*", ]
mapq <- data[[5]]
avg_mapq <- sum(as.integer(mapq)) / length(mapq)

# Write this to our out_file. 
out_conn <- file(out_file, open = "wt")
write(avg_mapq, out_conn)

close(out_conn)