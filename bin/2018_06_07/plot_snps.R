# Import ggplot2 for graphs, dplyr for dataframes, and stringr for string manipulation.
library(ggplot2)
library(utils)
library(ggrepel)
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
  
  # Make a copy to take the -log base 10 of the p-values.
  new_df <- cur_snp_df
  new_df[,c("p")] = -log(new_df[,c("p")], 10) 
  
  # Create a plot of phewas_strings vs p_values
  png_file_name <- paste("../../results/2018_06_07/", i, ".png", sep = "")
  png(filename=png_file_name)
  # Print plot, with points with a -log(p) > 2 labeled with phewas string.
  print(ggplot(new_df, aes(x = phewas_string, y = p)) + 
          geom_point() + 
          labs(y = expression('-log'[10]*' (p)'), title = i) +
          scale_x_discrete(expand = c(0.2,0.2))+
          geom_text_repel(
            aes(label = ifelse(p > 2, as.character(phewas_string), '')), 
            size = 2.5,
            hjust = 0.5, 
            vjust = 1,
            force = 1,
            max.iter = 1000))
  dev.off()
}

