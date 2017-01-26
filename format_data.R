library(dplyr)
source("extract_data.R")
format_data <- function () {
  unformatted_data <- extract_data()
  formatted_data <- rename(unformatted_data, Subject = subject_id, Activity = activity_label)
  column_names <- colnames(formatted_data)
  index = 1
  for( name in column_names) {
    components <- strsplit(name, "-")[[1]]
    if(length(grep("^f", components[1])) > 0) {
      components[1] <- substr(components[1], 2, nchar(components[1]))  
      components[1] <- paste(components[1],"Frequecy",sep = ".",collapse = ".")
    }
    if(length(grep("^t", components[1])) > 0) {
      components[1] <- substr(components[1], 2, nchar(components[1]))  
      #components[1] <- paste(components[1],"Time",sep = ".",collapse = ".")
    }
    if(length(grep("^(mean)|^(std)", components[2])) > 0) {
      slice_end <-nchar(components[2]) - 2
      components[2] <- substr(components[2], 1, slice_end)  
    }
    if(length(grep("^(meanFreq)", components[2])) > 0) {
      components[2] <- "MeanFrequency" 
    }
    if(length(grep("^(mean)", components[2])) > 0) {
      components[2] <- "Mean" 
    }
    if(length(grep("^(std)", components[2])) > 0) {
      components[2] <- "StandardDeviation" 
    }
    column_names[index] <- paste(components, collapse = ".")
    index <- index + 1
  }
  colnames(formatted_data) <- column_names
  
  return(formatted_data)
  
  
}