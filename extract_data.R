library(dplyr)
source("merge_source.R")
extract_data <- function (limit=NULL) {
  # Get The Merged Data Set
  if(is.null(limit)) {
    merged_data <- merge_source()
  } else {
    merged_data <- merge_source(limit)    
  }
  
  #Deduplicate Columns
  print("De-duping Columns...")
  names <- colnames(merged_data)
  duplicate <- duplicated(colnames(merged_data))
  dedup <- merged_data[,!duplicate]
  print("De-duping Completed")
  #Extract Target Data Columns (Mean (mean), Standard Dev (std), Activity Category, Subject ID)
  print("Subsetting Target Columns...")
  target_data <- select(dedup, matches("mean|std|activity_label|subject_id"))
  target_data <- select(target_data, -matches("^angle"))
  target_data <- select(target_data, -matches("meanFreq"))
  print("Subsetting Complete")
  
  #Return Target Data
  return(target_data)
}