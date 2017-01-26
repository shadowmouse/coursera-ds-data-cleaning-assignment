# coursera-ds-data-cleaning-assignment
## Week 4 Assignment - Class Project

### Script List

* run_analysis.R - Groups and summarizes the cleaned Data
* format_data.R - Renames columns based on grep pattern matching
* extract_data.R - Extracts data columns matching target criteria
* merge_source.R - Joins test and training datasets into single datasets
* get_dataset.R - Reads the source dataset and maps the activity and user id onto the source
* get_activity_key.R - Reads and retrieves the activity id map
* get_features_key.R - Reads and retrieves the features column name map

### Script Dependency Tree

* run_analysis.R
  * dplyr Library
  * format_data.R
    * dplyr Library
    * extract_data.R
      * dplyr Library
      * merge_source.R
        * get_dataset.R
          * readr Library
        * get_features_key.R
        * get_activity_key.R

### Methodology

Major functionality in this analysis script is broken down into separate named files containing their function.
The first step is to retrieve and load the reference data files (activity and features) into their respective maps.
These maps are passed to the data load function where the source data is loaded and the reference data is mapped onto the joined source files.
The resulting data is subset by the specified criteria and formatted before being summarized. The resulting summary is output to a CSV for futher use.
