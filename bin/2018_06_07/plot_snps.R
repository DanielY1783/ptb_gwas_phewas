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
  
  # Create a plot of phewas_strings vs p_values
  png_file_name <- paste("../../results/2018_06_07/", i, ".png", sep = "")
  png(filename=png_file_name)
  print(ggplot(cur_snp_df, aes(x = phewas_string, y = p)) + geom_point())
  dev.off()
}

