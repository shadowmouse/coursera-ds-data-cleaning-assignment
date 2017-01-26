## get_features_key.R
## Author : Elliot Francis
## Created : 2017-01-25
## Build Features Column Map
## Inputs
##
## Output
##  features_key - Features Column Map
get_features_key <- function () {
  print("Creating Features Key...")
  #Read Source Data
  feature_key <- read.delim(file.path("Dataset","features.txt"), sep=" ", header=FALSE, col.names=c("feature_column_number", "feature_label"))
  #Convert ID to Number
  feature_key[,1] <- as.numeric(feature_key[,1])
  #Trim Whitespace
  feature_key[,2] <- trimws(feature_key[,2], c("both"))
  print("Features Key Created")
  feature_key

}
