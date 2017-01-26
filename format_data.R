## format_data.R
## Author : Elliot Francis
## Created : 2017-01-25
## Format extracted data into appropriate column names to enhance readability
## Inputs
##  limit - number of rows to read if not reading all
## Output
##  formatted_data - Formatted Data Set

#Load Support Library and Code
library(dplyr)
source("extract_data.R")

format_data <- function (limit=NULL) {

  # Get Target Data
  if(is.null(limit)) {
    unformatted_data <- extract_data()
  } else {
    unformatted_data <- extract_data(limit)
  }

  print("Formatting Columns...")
  # Copy Data
  formatted_data <- rename(unformatted_data, Subject = subject_id, Activity = activity_label)

  # Get Column Names
  column_names <- colnames(formatted_data)

  # Process Column Names
  index = 1
  for( name in column_names) {

    # Get Column Name Components
    components <- strsplit(name, "-")[[1]]

    #Check For Frequency Domain Variables
    if(length(grep("^f", components[1])) > 0) {
      components[1] <- substr(components[1], 2, nchar(components[1]))
      components[1] <- paste(components[1],"Frequecy",sep = ".",collapse = ".")
    }
    #Check For Time Domain Variables
    if(length(grep("^t", components[1])) > 0) {
      components[1] <- substr(components[1], 2, nchar(components[1]))
      #components[1] <- paste(components[1],"Time",sep = ".",collapse = ".")
    }

    #Remove Function ()
    if(length(grep("^(mean)|^(std)", components[2])) > 0) {
      slice_end <-nchar(components[2]) - 2
      components[2] <- substr(components[2], 1, slice_end)
    }

    #Set Title
    if(length(grep("^(meanFreq)", components[2])) > 0) {
      components[2] <- "MeanFrequency"
    }

    #Set Title
    if(length(grep("^(mean)", components[2])) > 0) {
      components[2] <- "Mean"
    }

    #Set Title
    if(length(grep("^(std)", components[2])) > 0) {
      components[2] <- "StandardDeviation"
    }

    #Update Column Name
    column_names[index] <- paste(components, collapse = ".")

    #Increment Processing Index
    index <- index + 1
  }

  # Update Column Names
  colnames(formatted_data) <- column_names
  print("Columns Formatted.")

  # Return Data
  return(formatted_data)


}
