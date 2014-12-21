<b>run_analysis.R</b>

The run_analysis.R script processes the "Human Activity Recognition Using Smartphones Data Set" from this web site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

run_analysis.R should be run in the "UCI HAR Dataset" sub-directory of the dataset.  run_analyis.R creates a data.frame named "summary_of_the_data" and a file "summary_of_the_data.txt".

This data set has two analogous components: "test" and "train".  Each of the two components have the following sub-directory structure and files:

features.txt<br>
activity_labels.txt<br>
&lt;test or train>/subject_&lt;test or train>.txt<br>
&lt;test or train>/X_&lt;test or train>.txt<br>
&lt;test or train>/y_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/body_acc_x_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/body_gyro_z_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/total_acc_z_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/total_acc_x_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/body_acc_y_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/body_gyro_x_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/total_acc_y_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/body_gyro_y_&lt;test or train>.txt<br>
&lt;test or train>/Inertial Signals/body_acc_z_&lt;test or train>.txt<br>

There are two meta-data files: "features.txt" and "activity_labels.txt".  features.txt maps the column number in X_&lt;test or train>.txt to a feature.  activity_labels.txt maps an activity number in y_&lt;test or train>.txt to an activity label.

There are three data files: subject_&lt;test or train>.txt, X_&lt;test or train>.txt and y_&lt;test or train>.txt.  Each of the three data files contains the same number of rows, each set of three rows from each of the three files collectively make up a single data record.  X_&lt;test or train>.txt are the features.  y_&lt;test or train>.txt are the activities and subject_&lt;test or train>.txt are the subjects.

The subject numbers in the test and train data sets correspond to the same subject (that is to say, subject 1 in the test data set corresponds to subject 1 in the train data set).

See the web site for additional explanation about the data.

The run_analysis.R script:<br>
1.  Reads the mean and standard deviation features (per fetaures.txt) from X_&lt;test or train>.txt into a data.frame.<br>
2.  Reads the activity number data from y_&lt;test or train>.txt and adds the activity label column (per mapping in activity_labels.txt) to the above data.frame.<br>
3.  Reads the subject numbers data from y_&lt;test or train>.txt and adds the subject number column to the above data.frame (called the_data).<br>
4.  Calculates summary averages per subject/activity into a data.frame called summary_of_the_data.<br>
5.  Writes the summarized data to a file called "summary_of_the_data.txt".  The file is written to the working directory (UCI HAR Dataset).<br>


<b>Code Book</b>

subject_number : Subject number from the subject_&lt;test or train>.txt file.

activity : Activity labels (SITTING, STANDING, etc.)  from the activity_labels.txt file.  The activity_labels.txt file has a mapping from the integers 1 through 6 to the labels.  The  y_&lt;test or train>.txt file contains the activity integers 1 through 6 for each row of the data. 

features : The average (mean) of the original features for the subject/activity.  All features with names containing the substrings "mean" (for example "tBodyAcc-mean()-X") or "std" (for example "tBodyAcc-std()-X") were taken from the orignal data.  The averaged feature names are the original feature names with "special characters" replaced with a period, "." (for example "tBodyAcc.mean...X" is the column name for the averages per subject/activity of the "tBodyAcc-mean()-X" feature).

This is a mapping of each feature name to its source feature name in the form "feature name : source feature name":<br>
tBodyAcc.mean...X : tBodyAcc-mean()-X<br>
tBodyAcc.mean...Y : tBodyAcc-mean()-Y<br>
tBodyAcc.mean...Z : tBodyAcc-mean()-Z<br>
tBodyAcc.std...X : tBodyAcc-std()-X<br>
tBodyAcc.std...Y : tBodyAcc-std()-Y<br>
tBodyAcc.std...Z : tBodyAcc-std()-Z<br>
tGravityAcc.mean...X : tGravityAcc-mean()-X<br>
tGravityAcc.mean...Y : tGravityAcc-mean()-Y<br>
tGravityAcc.mean...Z : tGravityAcc-mean()-Z<br>
tGravityAcc.std...X : tGravityAcc-std()-X<br>
tGravityAcc.std...Y : tGravityAcc-std()-Y<br>
tGravityAcc.std...Z : tGravityAcc-std()-Z<br>
tBodyAccJerk.mean...X : tBodyAccJerk-mean()-X<br>
tBodyAccJerk.mean...Y : tBodyAccJerk-mean()-Y<br>
tBodyAccJerk.mean...Z : tBodyAccJerk-mean()-Z<br>
tBodyAccJerk.std...X : tBodyAccJerk-std()-X<br>
tBodyAccJerk.std...Y : tBodyAccJerk-std()-Y<br>
tBodyAccJerk.std...Z : tBodyAccJerk-std()-Z<br>
tBodyGyro.mean...X : tBodyGyro-mean()-X<br>
tBodyGyro.mean...Y : tBodyGyro-mean()-Y<br>
tBodyGyro.mean...Z : tBodyGyro-mean()-Z<br>
tBodyGyro.std...X : tBodyGyro-std()-X<br>
tBodyGyro.std...Y : tBodyGyro-std()-Y<br>
tBodyGyro.std...Z : tBodyGyro-std()-Z<br>
tBodyGyroJerk.mean...X : tBodyGyroJerk-mean()-X<br>
tBodyGyroJerk.mean...Y : tBodyGyroJerk-mean()-Y<br>
tBodyGyroJerk.mean...Z : tBodyGyroJerk-mean()-Z<br>
tBodyGyroJerk.std...X : tBodyGyroJerk-std()-X<br>
tBodyGyroJerk.std...Y : tBodyGyroJerk-std()-Y<br>
tBodyGyroJerk.std...Z : tBodyGyroJerk-std()-Z<br>
tBodyAccMag.mean.. : tBodyAccMag-mean()<br>
tBodyAccMag.std.. : tBodyAccMag-std()<br>
tGravityAccMag.mean.. : tGravityAccMag-mean()<br>
tGravityAccMag.std.. : tGravityAccMag-std()<br>
tBodyAccJerkMag.mean.. : tBodyAccJerkMag-mean()<br>
tBodyAccJerkMag.std.. : tBodyAccJerkMag-std()<br>
tBodyGyroMag.mean.. : tBodyGyroMag-mean()<br>
tBodyGyroMag.std.. : tBodyGyroMag-std()<br>
tBodyGyroJerkMag.mean.. : tBodyGyroJerkMag-mean()<br>
tBodyGyroJerkMag.std.. : tBodyGyroJerkMag-std()<br>
fBodyAcc.mean...X : fBodyAcc-mean()-X<br>
fBodyAcc.mean...Y : fBodyAcc-mean()-Y<br>
fBodyAcc.mean...Z : fBodyAcc-mean()-Z<br>
fBodyAcc.std...X : fBodyAcc-std()-X<br>
fBodyAcc.std...Y : fBodyAcc-std()-Y<br>
fBodyAcc.std...Z : fBodyAcc-std()-Z<br>
fBodyAcc.meanFreq...X : fBodyAcc-meanFreq()-X<br>
fBodyAcc.meanFreq...Y : fBodyAcc-meanFreq()-Y<br>
fBodyAcc.meanFreq...Z : fBodyAcc-meanFreq()-Z<br>
fBodyAccJerk.mean...X : fBodyAccJerk-mean()-X<br>
fBodyAccJerk.mean...Y : fBodyAccJerk-mean()-Y<br>
fBodyAccJerk.mean...Z : fBodyAccJerk-mean()-Z<br>
fBodyAccJerk.std...X : fBodyAccJerk-std()-X<br>
fBodyAccJerk.std...Y : fBodyAccJerk-std()-Y<br>
fBodyAccJerk.std...Z : fBodyAccJerk-std()-Z<br>
fBodyAccJerk.meanFreq...X : fBodyAccJerk-meanFreq()-X<br>
fBodyAccJerk.meanFreq...Y : fBodyAccJerk-meanFreq()-Y<br>
fBodyAccJerk.meanFreq...Z : fBodyAccJerk-meanFreq()-Z<br>
fBodyGyro.mean...X : fBodyGyro-mean()-X<br>
fBodyGyro.mean...Y : fBodyGyro-mean()-Y<br>
fBodyGyro.mean...Z : fBodyGyro-mean()-Z<br>
fBodyGyro.std...X : fBodyGyro-std()-X<br>
fBodyGyro.std...Y : fBodyGyro-std()-Y<br>
fBodyGyro.std...Z : fBodyGyro-std()-Z<br>
fBodyGyro.meanFreq...X : fBodyGyro-meanFreq()-X<br>
fBodyGyro.meanFreq...Y : fBodyGyro-meanFreq()-Y<br>
fBodyGyro.meanFreq...Z : fBodyGyro-meanFreq()-Z<br>
fBodyAccMag.mean.. : fBodyAccMag-mean()<br>
fBodyAccMag.std.. : fBodyAccMag-std()<br>
fBodyAccMag.meanFreq.. : fBodyAccMag-meanFreq()<br>
fBodyBodyAccJerkMag.mean.. : fBodyBodyAccJerkMag-mean()<br>
fBodyBodyAccJerkMag.std.. : fBodyBodyAccJerkMag-std()<br>
fBodyBodyAccJerkMag.meanFreq.. : fBodyBodyAccJerkMag-meanFreq()<br>
fBodyBodyGyroMag.mean.. : fBodyBodyGyroMag-mean()<br>
fBodyBodyGyroMag.std.. : fBodyBodyGyroMag-std()<br>
fBodyBodyGyroMag.meanFreq.. : fBodyBodyGyroMag-meanFreq()<br>
fBodyBodyGyroJerkMag.mean.. : fBodyBodyGyroJerkMag-mean()<br>
fBodyBodyGyroJerkMag.std.. : fBodyBodyGyroJerkMag-std()<br>
fBodyBodyGyroJerkMag.meanFreq.. : fBodyBodyGyroJerkMag-meanFreq()<br>

