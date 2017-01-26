get_dataset <- function (path, activity_key, feature_key, limit=NULL) {
  print("Getting Dataset...")
  #Get Target Filenames
  files <- dir(path);
  data_filename <- files[grep("^X_", files)]
  label_filename <- files[grep("^y_", files)]
  subject_filename <- files[grep("^subject_", files)]
  
  #Read Source Data
  if(is.null(limit)) {
    source_data <- read.fwf(file.path(path, data_filename), rep(16, nrow(feature_key)))  
    source_label <- read.fwf(file.path(path, label_filename), c(1))
    source_subject <- read.csv(file.path(path, subject_filename), header=FALSE)
  } else {
    source_data <- read.fwf(file.path(path, data_filename), rep(16, nrow(feature_key)), n=limit)
    source_label <- read.fwf(file.path(path, label_filename), c(1), n=limit)
    source_subject <- read.csv(file.path(path, subject_filename), header=FALSE, nrows=limit)
  }
  print("Dataset Loaded")
  print("Merging Labels into Dataset...")
  data_key <- feature_key$feature_label;
  
  colnames(source_data) <- data_key;
  colnames(source_label) <- c("activity_id");
  colnames(source_subject) <- c("subject_id");
  source_label <- merge(source_label, activity_key, by.x="activity_id", by.y="activity_id")
  if(nrow(source_data) != nrow(source_label)) { 
    print(nrow(source_data))
    print(nrow(source_label))
    stop("Label File Row Count Doesn't Match Data File Row Count"); 
  }
  
  merged <- cbind(source_label, source_data);
  merged <- cbind(source_subject, merged);
  print("Labels Merged")
  return(merged)
  
}