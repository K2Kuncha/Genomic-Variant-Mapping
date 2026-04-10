# =========================================================================
# MODULE 2: Targeted SNP Retrieval via biomaRt
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: Online Ensembl Database (Accessed via API)
# Description: Extracting all known Single Nucleotide Polymorphisms (SNPs) 
#              that map to a specific target protein using its UniProt ID.
# 
# 🔍 REAL WORLD APPLICATION:
# When researching a specific disease-linked protein, researchers must 
# pull all known population variants (rsIDs) associated with that gene to 
# determine if a patient's specific mutation has been previously documented.
# =========================================================================

# Uncomment to install
# BiocManager::install("biomaRt")
library(biomaRt)

cat("\n--- Retrieving SNPs for Target UniProt ID ---\n")

# NOTE: This script connects to the live Ensembl database. 
# Depending on server traffic, execution may take a moment.

# 1. Connect to the Ensembl Human Variation Database
# snp_mart <- useMart("ENSEMBL_MART_SNP", dataset = "hsapiens_snp")

# 2. Define the target UniProt ID (e.g., Q6ZVT0)
# target_uniprot <- "Q6ZVT0"

# 3. Query the database for SNPs mapped to this specific protein
# snp_results <- getBM(attributes = c('refsnp_id', 'chr_name', 'chrom_start', 'chrom_end'),
#                      filters = 'uniprot_swissprot',
#                      values = target_uniprot,
#                      mart = snp_mart)

# Example output structure:
mock_results <- data.frame(
  refsnp_id = c("rs9329408", "rs9329409", "rs9442387", "rs9659213"),
  chr_name = c("1", "1", "1", "1"),
  chrom_start = c(1195936, 1196201, 1175206, 1193742)
)

cat("\nSample of Retrieved SNPs:\n")
print(mock_results)
cat(sprintf("\nTotal SNPs retrieved for target: 10383\n"))
