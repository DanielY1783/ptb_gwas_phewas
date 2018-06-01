# Import ggplot2 for graphs, dplyr for dataframes, and stringr for string manipulation.
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)
library(stringr)

# Read in all the SNPs
snps_df <- read.table("../../data/2018_06_01_snps_for_R/set_output.csv", sep = '\t')

# Convert to vector for iteration
snps_vec <- as.vector(t(snps_df))

# Iterate over all the SNPs in both the GWAS and PheWAS
for (i in snps_vec){
  # Open the files for each SNP.
  cur_snp_str <- paste("../../data/2018_06_01_snps_for_R/snps/", i, ".csv", sep = "")
  cur_snp_df <- read.csv(cur_snp_str, sep = '\t')
  
  # Get column of the phewas_string as vector
  phewas_strings_df <- cur_snp_df[,c("phewas_string")]
  phewas_strings_vec <- as.vector(t(phewas_strings_df))
  print(length(phewas_strings_vec))
  
  # Get column of the p_values as a vector
  p_values_df <- cur_snp_df[,c("p")]
  p_values_vec <- as.vector(t(p_values_df))
  
  # Create a plot of phewas_strings vs p_values
  qplot(phewas_strings_df, p_values_df)
  pdf_file_name <- paste(i, ".pdf", sep = "")
  dev.copy2pdf(file = pdf_file_name)
}

