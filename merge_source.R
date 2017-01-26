source("get_activity_key.R")
source("get_features_key.R")
source("get_dataset.R")
merge_source <- function (limit=NULL) {
  activity_key <- get_activity_key()
  feature_key <- get_features_key()
  if(is.null(limit)) {
    test_dataset <- get_dataset(file.path("Dataset","test"), activity_key, feature_key)
    train_dataset <- get_dataset(file.path("Dataset","train"), activity_key, feature_key)  
  } else {
    test_dataset <- get_dataset(file.path("Dataset","test"), activity_key, feature_key, 5)
    train_dataset <- get_dataset(file.path("Dataset","train"), activity_key, feature_key, 5)
  }
  print("Merging Target Datasets...")
  merged_data = rbind(test_dataset, train_dataset)
  print("Datasets Merged")
  return(merged_data)
}