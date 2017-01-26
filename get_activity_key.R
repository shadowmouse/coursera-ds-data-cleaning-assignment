## get_activity_key.R
## Author : Elliot Francis
## Created : 2017-01-25
## Build Activity Key Map
## Inputs
##
## Output
##  activity_key - Activity Key Map
get_activity_key <- function () {
  print("Creating Activity Key...")
  #Read Source Data
  activity_key <- read.delim(file.path("Dataset","activity_labels.txt"), sep=" ", header=FALSE, col.names=c("activity_id", "activity_label"))
  #Convert ID to Number
  activity_key[,1] <- as.numeric(activity_key[,1])
  #Trim Whitespace
  activity_key[,2] <- trimws(activity_key[,2], c("both"))
  print("Activity Key Created")
  activity_key

}
