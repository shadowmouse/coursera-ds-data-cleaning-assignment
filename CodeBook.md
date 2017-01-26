# Analysis Method

The source data was processed with the following steps :

1. Data From train and test sets was composited into a single table including subject and activity ID numbers
2. Activity Description mapped to Activity ID on composite table
3. Composite Table was subset by column title containing "mean" and "std" terms (see extract_data.R)
4. Composite Table was further subset by column title to drop angle calculation and meanFrequency results
5. Composite Table was renamed by algorithm for readability (see format_data.R)
6. Formatted Results were grouped by subject ID and activity description
7. Grouped Results were summarized by taking the mean of non-grouping variables

# Data Variable Descriptions

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ in the source dataset. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Values for the tidydata.csv summary output were derived from the mean of the mean values from the source dataset. (See Analysis Method section)

* Any measurments with Acc in the column name are in standard gravity units 'g'.
* Any measurments with Gryo in the column name are in radians/second
* Subject IDs have a range of 1 to 30
* Activity is a plaintext descriptor of the performed activity
