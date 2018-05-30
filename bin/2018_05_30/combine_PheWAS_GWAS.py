# Import pandas for data combining
import pandas as pd
import csv # For processing csv file

# Open the GWAS catalog as a dataframe.
GWASFile = pd.read_table("../../data/2018_05_29/Zhang et al PTB 10000/pre_top10000.tab")

# Open the PheWAS catalog as a dataframe.
PheWASFile = pd.read_csv('../../data/2018_05_29/PheWAS Catalog/phewas-catalog.csv',)

# Use inner join to combine the GWAS file with PheWAS file
output = pd.merge(GWASFile, PheWASFile, how='inner', on='snp')

# Write the result to a csv file
output.to_csv("Combined.csv")

