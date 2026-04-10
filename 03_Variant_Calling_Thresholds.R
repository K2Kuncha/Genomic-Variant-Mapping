# =========================================================================
# MODULE 3: Variant Calling Thresholds (Sensitivity vs Specificity)
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: Simulated Variant Call Table
# Description: Sequencing inherently produces errors. When calling a variant, 
#              we must decide how many independent reads (read depth/count) 
#              must show the mutation before we believe it is real.
# 
# 🔍 REAL WORLD APPLICATION:
# Setting a low read-count threshold (e.g., 10x) increases sensitivity 
# (finding rare tumor sub-clones) but introduces false positives. A high 
# threshold (e.g., 30x) increases specificity (highly reliable calls) but 
# risks missing true, low-frequency mutations.
# =========================================================================

library(dplyr)

cat("\n--- Evaluating Variant Calling Thresholds ---\n")

# Simulated output from a variant caller (e.g., GATK or FreeBayes)
variant_calls <- data.frame(
  Variant_ID = paste0("VAR_", 1:10),
  True_Mutation = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE),
  Read_Depth = c(45, 12, 8, 105, 14, 32, 9, 28, 55, 11)
)

cat("\nRaw Variant Candidates:\n")
print(variant_calls)

# Scenario A: High Sensitivity (Low Threshold)
# Captures rare variants, but includes sequencing noise (false positives)
threshold_10 <- variant_calls %>% filter(Read_Depth >= 10)

cat("\nScenario A: Threshold = 10x (High Sensitivity)\n")
cat("Total variants called:", nrow(threshold_10), "\n")
cat("False Positives included:", sum(threshold_10$True_Mutation == FALSE), "\n")

# Scenario B: High Specificity (High Threshold)
# Highly reliable calls, but misses low-frequency true variants
threshold_30 <- variant_calls %>% filter(Read_Depth >= 30)

cat("\nScenario B: Threshold = 30x (High Specificity)\n")
cat("Total variants called:", nrow(threshold_30), "\n")
cat("False Positives included:", sum(threshold_30$True_Mutation == FALSE), "\n")
cat("True Positives missed:", sum(variant_calls$True_Mutation == TRUE & variant_calls$Read_Depth < 30), "\n")
