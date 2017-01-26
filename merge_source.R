## merge_source.R
## Author : Elliot Francis
## Created : 2017-01-25
## Merge test and train Dataset Information from target path into one table
## Inputs
##  limit - number of rows to read if not reading all
## Output
##  merged_data - Merged DataSet

# Load Support Functions
source("get_activity_key.R")
source("get_features_key.R")
source("get_dataset.R")

merge_source <- function (limit=NULL) {

  # Build Reference Keys
  activity_key <- get_activity_key()
  feature_key <- get_features_key()

  #Fetch Datasets
  if(is.null(limit)) {
    test_dataset <- get_dataset(file.path("Dataset","test"), activity_key, feature_key)
    train_dataset <- get_dataset(file.path("Dataset","train"), activity_key, feature_key)
  } else {
    test_dataset <- get_dataset(file.path("Dataset","test"), activity_key, feature_key, 5)
    train_dataset <- get_dataset(file.path("Dataset","train"), activity_key, feature_key, 5)
  }
  print("Merging Target Datasets...")

  #Row Bind Datasets into one table
  merged_data = rbind(test_dataset, train_dataset)
  print("Datasets Merged")

  #Return Master Data Table
  return(merged_data)
}
