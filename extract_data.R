library(dplyr)
source("merge_source.R")
extract_data <- function () {
  # Get The Merged Data Set
  merged_data <- merge_source(5)
  
  #Deduplicate Columns
  names <- colnames(merged_data)
  duplicate <- duplicated(colnames(merged_data))
  dedup <- merged_data[,!duplicate]
  
  #Extract Target Data Columns (Mean (mean), Standard Dev (std), Activity Category, Subject ID)
  target_data <- select(dedup, matches("mean|std|activity_label|subject_id"))
  target_data <- select(target_data, -matches("^angle"))
  target_data <- select(target_data, -matches("meanFreq"))
  
  #Return Target Data
  return(target_data)
}