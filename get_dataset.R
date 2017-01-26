## get_dataset.R
## Author : Elliot Francis
## Created : 2017-01-25
## Fetch And Merge Dataset Information from target path into one table
## Inputs
##  path - target path
##  activity_key - Activity Key Mapping
##  feature_key - Feature Column Mapping
##  limit - number of rows to read if not reading all
## Output
##  merged - Merged DataSet

#Load Support Library and Code
library(readr)

get_dataset <- function (path, activity_key, feature_key, limit=NULL) {
  print("Getting Dataset...")
  #Get Target Filenames
  files <- dir(path);
  data_filename <- files[grep("^X_", files)]
  label_filename <- files[grep("^y_", files)]
  subject_filename <- files[grep("^subject_", files)]

  #Read Source Data
  data_file_positions <- fwf_widths(rep(16, nrow(feature_key)))

  #Read Files
  if(is.null(limit)) {
    source_data <- read_fwf(file.path(path, data_filename), data_file_positions)
    source_label <- read_table(file.path(path, label_filename), col_names = FALSE)
    source_subject <- read_csv(file.path(path, subject_filename), col_names = FALSE)
  } else {
    source_data <- read_fwf(file.path(path, data_filename), data_file_positions, n_max=limit)
    source_label <- read_table(file.path(path, label_filename), col_names = FALSE, n_max=limit)
    source_subject <- read_csv(file.path(path, subject_filename), n_max= limit, col_names = FALSE)
  }
  print("Dataset Loaded")
  print("Merging Labels into Dataset...")

  #Prep Subject and Activity Data for Dataset Merge
  data_key <- feature_key$feature_label;
  colnames(source_data) <- data_key;
  colnames(source_label) <- c("activity_id");
  colnames(source_subject) <- c("subject_id");
  source_label <- merge(source_label, activity_key, by.x="activity_id", by.y="activity_id")

  #Pre-Merge Validation
  if(nrow(source_data) != nrow(source_label)) {
    print(nrow(source_data))
    print(nrow(source_label))
    stop("Label File Row Count Doesn't Match Data File Row Count");
  }

  #Bind Activity Label and Subject ID into Dataset Columns
  merged <- cbind(source_label, source_data);
  merged <- cbind(source_subject, merged);
  print("Labels Merged")

  # Return Output
  return(merged)

}
