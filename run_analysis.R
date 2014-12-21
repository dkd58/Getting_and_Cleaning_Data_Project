################################################################################
#
# Script that creates a data.frame by merging the test and train data after
# doing the following for the test and train data:
# 1.  Selectively loading mean and standard deviations columns
# 2.  Adding subject numbers
# 3.  Adding activity labels
# 4.  Summarize the data set, calculating means for all features
#     per subject/activity.
#
# This script contains 3 functions to accomplish the above tasks.
#
# The resulting data.frame is called "the_data".
#
################################################################################


library(dplyr)


################################################################################
#
# Read X_<test or train>.txt data:
# 1.  Read column positions and names from features.txt.
# 2.  Get column names with "mean" and "std" (standard deviation) substrings.
# 3.  Read data from X_<test or train>.txt into a data.frame limiting to desired
#     columns.
#
################################################################################
read_data <- function(test_or_train, number_of_rows)
{

   # Read in the column positions and names of the X_<test or train>.txt file.
   features <- read.table(file = "features.txt", as.is = TRUE, col.names = c("column_number","feature_name"))

   column_numbers <- features$column_number
   column_names <- features$feature_name


   # Construct a vector to be used by read.table on X_<test or train>.txt to
   # only read in desired mean and standard deviation columsn.
   mean_and_std_col_names <- features[grep("mean|std", features$feature_name), ]

   column_names_T_mean_and_std_or_F <- features$feature_name %in% mean_and_std_col_names$feature_name

   column_names_T_to_NA <- replace(column_names_T_mean_and_std_or_F, column_names_T_mean_and_std_or_F == TRUE, NA)

   mean_and_std_col_NA_NULLs <- replace(column_names_T_to_NA, column_names_T_to_NA == FALSE, "NULL")

 
   # col.names and colClasses must be the same length as the number of 
   # columns in the data file.
   #
   # colClasses has NA for columns to keep and the string "NULL" for columns to NOT load.
   the_data <- read.table(file = paste(test_or_train, "/X_", test_or_train, ".txt", sep = ""), as.is = TRUE, col.names = column_names, colClasses = mean_and_std_col_NA_NULLs, nrows = number_of_rows)

   return (the_data)
}


################################################################################
#
# Add activity labels into data.frame by:
# 1.  Read activity number to label mapping from "activity_labels.txt" file.
# 2.  Read activity data from the "y_<test or train>.txt" file.
# 3.  Generate an activity label column using mapping from 1. above to lookup 
#     the activity label.
# 4.  Add activity label column to the data set by lining up rows.
#
################################################################################
add_activities <- function(data_set, test_or_train, number_of_rows)
{
   activities <- read.table(file = "activity_labels.txt", as.is = TRUE, col.names = c("activity_number","activity"))

   activity_data <- read.table(file = paste(test_or_train, "/y_", test_or_train, ".txt", sep = ""), as.is = TRUE, col.names = c("activity_number"), nrows = number_of_rows)

   add_activity <- function(x) activities[(activities$activity_number == x), 2]
   activity_data$activity <-sapply(activity_data$activity_number, add_activity)

   the_data <- mutate(activity = activity_data$activity, data_set)

   return (the_data)
}


################################################################################
#
# Add subject data into the data.frame by:
# 1.  Read subject data from "subject_<test or train>.txt" file.
# 2.  Add subject number column to the data set by lining up rows.
#
################################################################################
add_subjects <- function(data_set, test_or_train, number_of_rows)
{
   subject_data <- read.table(file = paste(test_or_train, "/subject_", test_or_train, ".txt", sep = ""), as.is = TRUE, col.names = c("subject_number"), nrows = number_of_rows)

   the_data <- mutate(subject_number = subject_data$subject_number, data_set)

   return (the_data)
}


################################################################################
#
# read test data and then train data and combine with rbind into
# a data.frame named "the_data"
#
################################################################################

# Limit number of rows for testing.  -1 means all.
no_of_rows = -1

# Read and process test data.
test_data <- read_data("test", no_of_rows)
test_data <- add_activities(test_data, "test", no_of_rows)
test_data <- add_subjects(test_data, "test", no_of_rows)

# Read and process train data.
train_data <- read_data("train", no_of_rows)
train_data <- add_activities(train_data, "train", no_of_rows)
train_data <- add_subjects(train_data, "train", no_of_rows)

# Combine test and train data which have exactly the columns
the_data <- rbind(test_data, train_data)

# Grouping by subject_number and activity, get the mean of all the mean and standard
# deviation features.
summary_of_the_data <- group_by(the_data, subject_number, activity) %>% summarise_each(funs(mean))

# Write summarized data to a file per assignment instructions.
write.table(summary_of_the_data, "summary_of_the_data.txt", row.names=FALSE)

