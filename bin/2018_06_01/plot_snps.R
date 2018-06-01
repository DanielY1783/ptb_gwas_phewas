# Import ggplot2 for graphs and dplyr for dataframes.
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)

# Read in all the SNPs
snps_df <- read.table("../../data/2018_06_01_snps_for_R/set_output.csv", sep = '\t')

# Iterate over all the SNPs and open each csv file.
for (i in 1:ncol(snps_df)){
  cur_snp_str <- toString(snps_df[i])
  #cur_snp_df <- read.table(paste("../../data/2018_06_01_snps_for_R/snps/", cur_snp_str, ".csv"))
  print(snps_df[i])
}

