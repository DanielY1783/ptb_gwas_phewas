# Import pandas for data combining
import pandas as pd

# Open the GWAS catalog as a dataframe.
GWAS = pd.read_table("../../data/2018_05_29_PheWAS_and_GWAS/Zhang et al PTB 10000/pre_top10000.tab")
# Get column of GWAS containing only the SNPs and convert to dataframe
GWAS_SNPS = pd.DataFrame(GWAS['snp'])

# Open the PheWAS catalog as a dataframe.
PheWAS = pd.read_csv('../../data/2018_05_29_PheWAS_and_GWAS/PheWAS Catalog/phewas-catalog.csv',)

# Use inner join to combine the GWAS file with PheWAS file
combined = pd.merge(GWAS_SNPS, PheWAS, how='inner', on='snp')

# Write the result to a csv file
combined.to_csv("../../results/2018_05_30/Combined_GWAS_PheWAS.csv", index = False)