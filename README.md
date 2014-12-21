The run_analysis.R script processes the "Human Activity Recognition Using Smartphones Data Set" from this web site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

This data set has two analogous components: "test" and "train".  Each of the two components have the following sub-directory structure and files:

features.txt
activity_labels.txt
<test or train>/subject_<test or train>.txt
<test or train>/X_<test or train>.txt
<test or train>/y_<test or train>.txt
<test or train>/Inertial Signals/body_acc_x_<test or train>.txt
<test or train>/Inertial Signals/body_gyro_z_<test or train>.txt
<test or train>/Inertial Signals/total_acc_z_<test or train>.txt
<test or train>/Inertial Signals/total_acc_x_<test or train>.txt
<test or train>/Inertial Signals/body_acc_y_<test or train>.txt
<test or train>/Inertial Signals/body_gyro_x_<test or train>.txt
<test or train>/Inertial Signals/total_acc_y_<test or train>.txt
<test or train>/Inertial Signals/body_gyro_y_<test or train>.txt
<test or train>/Inertial Signals/body_acc_z_<test or train>.txt

The two meta-data files: features.txt and activity_labels.txt.  features.txt maps the column number in X_<test or train>.txt to a feature.  activity_labels.txt maps an activity number in y_<test or train>.txt to an activity label.

There are three data files: subject_<test or train>.txt, X_<test or train>.txt and y_<test or train>.txt.  Each of the three data files contains the same number of rows, each set of three rows from each of the three files collectively make up a single data record.  X_<test or train>.txt are the features.  y_<test or train>.txt are the activities and subject_<test or train>.txt are the subjects.

The subjects numbers in the test and train data sets correspond to the same subject.

See the web site for additional explanation about the data.

The run_analysis.R script:
1.  Reads the mean and standard deviation features (per fetaures.txt) from X_<test or train>.txt into a data.frame.
2.  Reads the activity number data from y_<test or train>.txt and adds the activity label column (per mapping in activity_labels.txt) to the above data.frame.
3.  Reads the subject numbers data from y_<test or train>.txt and adds the subject number column to the above data.frame (called the_data).
4.  Calculaties summary averages per subject/activity into a data.frame called summary_of_the_data.
5.  Writes the summarized data to a file called "summary_of_the_data.txt".  The file is written to the working directory (UCI HAR Dataset).


Code Book

subject_number : Subject number from the subject_<test or train>.txt file.

activity : Activity labels (SITTING, STANDING, etc.)  from the activity_labels.txt file.  The activity_labels.txt file has a mapping from the integers 1 through 6 to the labels.  The  y_<test or train>.txt file contains the activity integers 1 through 6 for each row of the data. 

features : The average (mean) of the original features for the subject/activity.  All features with names containing the substrings "mean" (for example "tBodyAcc-mean()-X") or "std" (for example "tBodyAcc-std()-X") were take from the orignal data.  The averaged feature names are the original feature name with "special characters" replaced with a period, "." (for example "tBodyAcc-mean()-X" to "tBodyAcc.mean...X".

A mapping of each feature name to its source feature name in the form "(feature name) : (source feature name)":
tBodyAcc.mean...X : tBodyAcc-mean()-X
tBodyAcc.mean...Y : tBodyAcc-mean()-Y
tBodyAcc.mean...Z : tBodyAcc-mean()-Z
tBodyAcc.std...X : tBodyAcc-std()-X
tBodyAcc.std...Y : tBodyAcc-std()-Y
tBodyAcc.std...Z : tBodyAcc-std()-Z
tGravityAcc.mean...X : tGravityAcc-mean()-X
tGravityAcc.mean...Y : tGravityAcc-mean()-Y
tGravityAcc.mean...Z : tGravityAcc-mean()-Z
tGravityAcc.std...X : tGravityAcc-std()-X
tGravityAcc.std...Y : tGravityAcc-std()-Y
tGravityAcc.std...Z : tGravityAcc-std()-Z
tBodyAccJerk.mean...X : tBodyAccJerk-mean()-X
tBodyAccJerk.mean...Y : tBodyAccJerk-mean()-Y
tBodyAccJerk.mean...Z : tBodyAccJerk-mean()-Z
tBodyAccJerk.std...X : tBodyAccJerk-std()-X
tBodyAccJerk.std...Y : tBodyAccJerk-std()-Y
tBodyAccJerk.std...Z : tBodyAccJerk-std()-Z
tBodyGyro.mean...X : tBodyGyro-mean()-X
tBodyGyro.mean...Y : tBodyGyro-mean()-Y
tBodyGyro.mean...Z : tBodyGyro-mean()-Z
tBodyGyro.std...X : tBodyGyro-std()-X
tBodyGyro.std...Y : tBodyGyro-std()-Y
tBodyGyro.std...Z : tBodyGyro-std()-Z
tBodyGyroJerk.mean...X : tBodyGyroJerk-mean()-X
tBodyGyroJerk.mean...Y : tBodyGyroJerk-mean()-Y
tBodyGyroJerk.mean...Z : tBodyGyroJerk-mean()-Z
tBodyGyroJerk.std...X : tBodyGyroJerk-std()-X
tBodyGyroJerk.std...Y : tBodyGyroJerk-std()-Y
tBodyGyroJerk.std...Z : tBodyGyroJerk-std()-Z
tBodyAccMag.mean.. : tBodyAccMag-mean()
tBodyAccMag.std.. : tBodyAccMag-std()
tGravityAccMag.mean.. : tGravityAccMag-mean()
tGravityAccMag.std.. : tGravityAccMag-std()
tBodyAccJerkMag.mean.. : tBodyAccJerkMag-mean()
tBodyAccJerkMag.std.. : tBodyAccJerkMag-std()
tBodyGyroMag.mean.. : tBodyGyroMag-mean()
tBodyGyroMag.std.. : tBodyGyroMag-std()
tBodyGyroJerkMag.mean.. : tBodyGyroJerkMag-mean()
tBodyGyroJerkMag.std.. : tBodyGyroJerkMag-std()
fBodyAcc.mean...X : fBodyAcc-mean()-X
fBodyAcc.mean...Y : fBodyAcc-mean()-Y
fBodyAcc.mean...Z : fBodyAcc-mean()-Z
fBodyAcc.std...X : fBodyAcc-std()-X
fBodyAcc.std...Y : fBodyAcc-std()-Y
fBodyAcc.std...Z : fBodyAcc-std()-Z
fBodyAcc.meanFreq...X : fBodyAcc-meanFreq()-X
fBodyAcc.meanFreq...Y : fBodyAcc-meanFreq()-Y
fBodyAcc.meanFreq...Z : fBodyAcc-meanFreq()-Z
fBodyAccJerk.mean...X : fBodyAccJerk-mean()-X
fBodyAccJerk.mean...Y : fBodyAccJerk-mean()-Y
fBodyAccJerk.mean...Z : fBodyAccJerk-mean()-Z
fBodyAccJerk.std...X : fBodyAccJerk-std()-X
fBodyAccJerk.std...Y : fBodyAccJerk-std()-Y
fBodyAccJerk.std...Z : fBodyAccJerk-std()-Z
fBodyAccJerk.meanFreq...X : fBodyAccJerk-meanFreq()-X
fBodyAccJerk.meanFreq...Y : fBodyAccJerk-meanFreq()-Y
fBodyAccJerk.meanFreq...Z : fBodyAccJerk-meanFreq()-Z
fBodyGyro.mean...X : fBodyGyro-mean()-X
fBodyGyro.mean...Y : fBodyGyro-mean()-Y
fBodyGyro.mean...Z : fBodyGyro-mean()-Z
fBodyGyro.std...X : fBodyGyro-std()-X
fBodyGyro.std...Y : fBodyGyro-std()-Y
fBodyGyro.std...Z : fBodyGyro-std()-Z
fBodyGyro.meanFreq...X : fBodyGyro-meanFreq()-X
fBodyGyro.meanFreq...Y : fBodyGyro-meanFreq()-Y
fBodyGyro.meanFreq...Z : fBodyGyro-meanFreq()-Z
fBodyAccMag.mean.. : fBodyAccMag-mean()
fBodyAccMag.std.. : fBodyAccMag-std()
fBodyAccMag.meanFreq.. : fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag.mean.. : fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag.std.. : fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag.meanFreq.. : fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag.mean.. : fBodyBodyGyroMag-mean()
fBodyBodyGyroMag.std.. : fBodyBodyGyroMag-std()
fBodyBodyGyroMag.meanFreq.. : fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag.mean.. : fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag.std.. : fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag.meanFreq.. : fBodyBodyGyroJerkMag-meanFreq()

