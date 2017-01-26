## run_analysis.R
## Author : Elliot Francis
## Created : 2017-01-26
## Run Data Analysis of Target Files (specified in merge_source.R)
## This analysis outputs 2 files.
## tidydata.csv - Summary Statistics containing independent tidy data set with the average of each variable for each activity and each subject
##              - Includes Column Names as first row and row number as first column
## proto-codebook.csv - List of All Columns in tidydata.csv (Convenience Output)

# Load dplyr library (for group_by function)
library(dplyr)

# Load Data Formatter
source("format_data.R")

# Fetch the Formatted Source Data
source_data <- format_data()

# Group Data by Activity and Subject
print("Grouping Data...")
by_subject <- group_by(source_data, Activity, Subject)
print("Data Grouped")

# Summarize Each Column with mean function
print("Summarizing Data...")
data_summary <- summarize_each(by_subject, funs(mean))

# Create Proto Codebook Output
column_names <- colnames(data_summary)
print("Data Summarized -- Saving File...")

# Write Results Files
write.csv(data_summary, file="tidydata.csv")
write.csv(column_names, file="proto-codebook.csv")
print("File Saved -- Analysis Complete")
