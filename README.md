# 🧬 Genomic Variant Mapping & Chromosomal Enrichment

### 📌 About This Repository
Understanding genetic disease requires mapping where protein-coding genes and sequence variations (SNPs) physically reside on the genome. Genomic architecture is non-uniform; certain chromosomal regions (euchromatin) are highly transcriptionally active, while others (heterochromatin/centromeres) are gene deserts. 

This repository provides R-based workflows to analyze spatial gene enrichment, retrieve specific Single Nucleotide Polymorphisms (SNPs) for target proteins, and evaluate the critical balance between sensitivity and specificity when calling variants.

### 🎯 Objective
To demonstrate spatial genomic analysis techniques, including chromosomal mapping, sliding-window gene distribution, and variant read-count filtering.

### 🛠️ Core Technologies & Libraries
* **Data Retrieval:** `biomaRt` (Ensembl database querying)
* **Data Wrangling:** `dplyr`, `GenomicRanges`
* **Visualization:** Base R graphics

### 📂 Modules Included
1. **Chromosomal Gene Enrichment:** Mapping the non-uniform distribution of protein-coding genes across specific chromosomes (e.g., analyzing telomeric vs. centromeric regions on Chromosome 4 using sliding windows).
2. **Targeted SNP Retrieval:** Querying the Ensembl database via `biomaRt` to extract all documented SNPs associated with a specific UniProt ID (e.g., Q6ZVT0).
3. **Variant Calling Thresholds:** Evaluating how sequencing read-count thresholds (e.g., 10x vs. 30x coverage) impact the sensitivity (finding rare variants) and specificity (reducing false positives) of clinical variant calling.
