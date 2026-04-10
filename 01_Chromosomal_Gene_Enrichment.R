# =========================================================================
# MODULE 1: Chromosomal Gene Enrichment & Spatial Distribution
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: Genomic coordinates and feature annotations.
# Description: Protein-coding genes are not distributed uniformly across 
#              chromosomes. Mapping their density helps identify 
#              transcriptionally active euchromatic regions versus dense, 
#              gene-poor heterochromatic/centromeric zones.
# 
# 🔍 REAL WORLD APPLICATION:
# Creating sliding-window density maps (e.g., across Chromosome 4) to 
# visualize regions of high genetic activity, which are often hotspots 
# for structural variants or chromosomal translocations in cancer.
# =========================================================================

library(dplyr)

cat("\n--- Analyzing Chromosomal Spatial Distribution ---\n")

# Mock dataset representing protein-coding gene counts across 20 windows on Chromosome 4
# (Reflecting findings from HW_08)
chr4_windows <- data.frame(
  Window = 1:20,
  Gene_Count = c(45, 50, 60, 13, 22, 35, 40, 55, 65, 70, 
                 80, 85, 298, 271, 175, 150, 90, 80, 60, 50),
  Region_Type = c(rep("Standard", 3), "Centromeric", "Standard", 
                  rep("Standard", 6), "Telomeric", "Telomeric", "Telomeric", 
                  rep("Standard", 6))
)

cat("\nGene Density Across Chromosome 4 (Subset):\n")
print(head(chr4_windows))

# Identify the window with the lowest gene count (likely centromere)
min_window <- chr4_windows %>% filter(Gene_Count == min(Gene_Count))
cat(sprintf("\nLowest density at Window %d (Count: %d) - Indicative of Heterochromatin/Centromere.\n", 
            min_window$Window, min_window$Gene_Count))

# Identify windows with unusually high gene counts (transcriptionally active regions)
high_density <- chr4_windows %>% filter(Gene_Count > 150)
cat("\nHigh Density Windows (Transcriptionally Active / Euchromatic):\n")
print(high_density)

# Basic Visualization of Gene Distribution
# barplot(chr4_windows$Gene_Count, names.arg = chr4_windows$Window,
#         main = "Protein Coding Gene Distribution (Chromosome 4)",
#         xlab = "Sliding Window", ylab = "Number of Genes",
#         col = ifelse(chr4_windows$Gene_Count > 150, "red", "steelblue"))
