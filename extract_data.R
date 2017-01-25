library(dplyr)
source("merge_source.R")
extract_data <- function () {
  # Get The Merged Data Set
  merged_data <- merge_source(5)
  
  #Deduplicate Columns
  names <- colnames(merged_data)
  duplicate <- duplicated(colnames(merged_data))
  dedup <- merged_data[,!duplicate]
  
  #Extract Target Data Columns (Mean (mean) and Standard Dev (std))
  target_data <- select(dedup, matches("mean|std|activity_label"))
  print(str(target_data[1:5,]))
}