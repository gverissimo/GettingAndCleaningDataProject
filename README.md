# GettingAndCleaningDataProject

## Overview
Class Project for JSU/Coursera "Getting and Cleaning Data"

The stated objective for the project is to:

_...create one R script called run_analysis.R that does the following:_

1. _Merges the training and the test sets to create one data set._
1. _Extracts only the measurements on the mean and standard deviation for each measurement._
1. _Uses descriptive activity names to name the activities in the data set_
1. _Appropriately labels the data set with descriptive variable names._
1. _From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject._

In the repository are the following:

1. Readme.md (this document)
1. Codebook.md for the resulting tidy dataset
1. The actual tidy.txt output dataset in tab-separated format
1. A data folder containing  source files from UCI.edu including 
    * readme
    * activity and feature lists & descriptions
    * test and training datasets.


## Running the program

### Download Source Dataset
Manually download the source dataset onto your computer from _"Human Activity Recognition Using Smartphones Data Set"_ located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) at the Machine Learning Repository at UC Irvine. Unzip the dataset into the data folder in the project repository.

### Required Libraries

Ensure the following R libraries are installed on your system:

* dplyr
* reshape2

### Run the program 

Run the program _run_analysis.R_


## Description of script

### (Step 1) Load Activities and Labels
Use _read.table_ to load the source file _activity_labels.txt_ into dataframe _activity_labels_ and subset just the actual activity labels (column 2) and convert to lower case.

Similarly load source file _features.txt_ into dataframe _feature_variables_ and subset just the feature labels (column 2) -- DO NOT convert to lower case lest you lose CamelCase formatting.

### (Step 2) Identify the Target Features and Clean up Feature Labels
From the full list of source feature variables (561 items total), filter out just the mean and standard deviation (aka std) items. Do this using _grep_ to key on strings "mean()" or "std()".

Note there are some other features that include the string "mean" but without  "()", specifically: *meanFreq* and *gravityMean*. Since these "means" aren't associated with a corresponding standard deviation statistic, I opted to leave  them out of the target dataset.

Then clean up the labels for the columns by using _gsub_ to:

* remove problematic characters, e.g. - '(', '-' etc. 
* maintain CamelFormat by replacing \*mean\* and \*std\* as \*Mean\* and \*Std\*.
* replace prefixes 't' & 'f' with "Time" & "Freq"


### (Step 3) Load Test Dataset

Use _read.table_ to load:

* subject numbers contained in test source file _subject_test.txt_ into dataframe _test_subjects_ 
* activity numbers contained in source file _y_test.txt_ into dataframe _test_activities_ 
* measurement data contained in source file _X_test.txt_ into dataframe _test_measurements_

Then subset the target columns from the test measurements into a new dataframe _target_test_measurements_ and add the column labels from step 2.  

Finally, using cbind, merge the subject, activity and measurement dataframes into dataframe _test_df_ and -- add a column to indicate _test_ source dataset (just for bookkeeping)


Also optionally to free up space and since they are no longer needed, delete dataframes:

*  _test_subjects_
* _test_activities_
* _test_measurements_
* _target_test_measurements_


### (Step 4) Load Training Dataset

Similar to Step 3, use _read.table_ to load:

* subject numbers from _subject_train.txt_ into dataframe _train_subjects_ 
* activity numbers from _ytrain.txt_ into dataframe _train_activities_ 
* measurement data from _X_train.txt_ into dataframe _train_measurements_

-- subset  target columns into _target_train_measurements_
-- merge subject, activity and measurement dataframes into  _train_df_
-- add a column to indicate _train_  source dataset (just for bookkeeping)
-- and optionally delete dataframes (again, just to save space):

*  _train_subjects_
* _train_activities_
* _train_measurements_
* _target_train_measurements_


### (Step 5) Merge Test & Trial Datasets & Summarize

After all of the data manipulation above, it is now time to get down to the actual data processing:

First using _rbind_ combine _test_df_ and _train_df_ into one dataframe _fullDataset_ and sort by (subjectNumber > activityNumber > dataset)

Next using _melt_, reshape the dataset into long format around _subjectNumber_ and _activityName_ into a new dataset _meltedDataSet_.

Then using _dcast_, reshape the data back into a wide summary format in a new datafram _meanDataset_ (again around _subjectNumber_ and _activityName_) with the addition of "mean" to:

* replace all of the individual measurements for each subject and activity
* with a single entry average of the measurements for each subject and activity


### (Step 6) Write the tidy file

Using _write.table_ write the summary dataset _meanDataset_ in tab-delimited format (via escape character '\\t')



