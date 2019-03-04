# CodeBook for tidy.txt file

________
from [*"Human Activity Recognition Using Smartphones Data Set"" by D.Anguita, et al.*](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

> _The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data._
> 
> _The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain._

________
Each record in the dataset provides 

* An identifier for each subject
* An identifier for each activity performed (laying | sitting | standing, walking | walking_downstairs | walking_upstairs)
* An identifier indicating the original dataset (training | test). 
* Along with and for each subject & activity a numerical value of the average of the statistics (both mean and standard deviation) for each of the 67 variables listed below.

________ 

| Feature        | Description           | Type  |
| :------------- | :-------------------- | :-----:|
| `TimeBodyAccMeanX`| Average of mean of time measurement BodyAcc in X axis | numeric | 
| `TimeBodyAccMeanY`| Average of mean of time measurement BodyAcc in X axis | numeric | 
| `TimeBodyAccMeanZ`| Average of mean of time measurement BodyAcc in Z axis | numeric | 
| `TimeBodyAccStdX`| Average of standard deviation of time measurement of BodyAcc in X axis | numeric | 
| `TimeBodyAccStdY`| Average of standard deviation of time measurement of BodyAcc in Y axis | numeric | 
| `TimeBodyAccStdZ`| Average of standard deviation of time measurement of BodyAcc in Z axis | numeric | 
| `TimeGravityAccMeanX`| Average of mean of time measurement GravityAcc in X axis | numeric | 
| `TimeGravityAccMeanY`|  Average of mean of time measurement GravityAcc in Y axis | numeric | 
| `TimeGravityAccMeanZ`|  Average of mean of time measurement GravityAcc in Z axis | numeric | 
| `TimeGravityAccStdX`| Average of standard deviation of time measurement of GravityAcc in X axis | numeric | 
| `TimeGravityAccStdY`| Average of standard deviation of time measurement of GravityAcc in Y axis | numeric | 
| `TimeGravityAccStdZ`| Average of standard deviation of time measurement of GravityAcc in Z axis | numeric | 
| `TimeBodyAccJerkMeanX`| Average of mean of time measurement BodyAccJerk in X axis | numeric | 
| `TimeBodyAccJerkMeanY`| Average of mean of time measurement BodyAccJerk in Y axis | numeric | 
| `TimeBodyAccJerkMeanZ`| Average of mean of time measurement BodyAccJerk in Z axis | numeric | 
| `TimeBodyAccJerkStdX`| Average of standard deviation of time measurement of BodyAccJerk in X axis | numeric | 
| `TimeBodyAccJerkStdY`| Average of standard deviation of time measurement of BodyAccJerk in Y axis | numeric | 
| `TimeBodyAccJerkStdZ`| Average of standard deviation of time measurement of BodyAccJerk in Z axis | numeric | 
| `TimeBodyGyroMeanX`| Average of mean of time measurement BodyGyro in X axis | numeric | 
| `TimeBodyGyroMeanY`| Average of mean of time measurement BodyGyro in Y axis | numeric | 
| `TimeBodyGyroMeanZ`| Average of mean of time measurement BodyGyro in Z axis | numeric | 
| `TimeBodyGyroStdX`| Average of standard deviation of time measurement of BodyGyro in X axis | numeric |
| `TimeBodyGyroStdY`| Average of standard deviation of time measurement of BodyGyro in Y axis | numeric |
| `TimeBodyGyroStdZ`| Average of standard deviation of time measurement of BodyGyro in Z axis | numeric |
| `TimeBodyGyroJerkMeanX`| Average of mean of time measurement BodyGyroJerk in X axis | numeric |  
| `TimeBodyGyroJerkMeanY`| Average of mean of time measurement BodyGyroJerk in Y axis | numeric |  
| `TimeBodyGyroJerkMeanZ`| Average of mean of time measurement BodyGyroJerk in Z axis | numeric |  
| `TimeBodyGyroJerkStdX`| Average of standard deviation of time measurement of BodyGyroJerk in X axis | numeric |
| `TimeBodyGyroJerkStdY`| Average of standard deviation of time measurement of BodyGyroJerk in Y axis | numeric |
| `TimeBodyGyroJerkStdZ`| Average of standard deviation of time measurement of BodyGyroJerk in Z axis | numeric |
| `TimeBodyAccMagMean`| Average of mean of time measurement of BodyAccMag | numeric | 
| `TimeBodyAccMagStd`| Average of standard deviation of time measurement of BodyAccMag | numeric | 
| `TimeGravityAccMagMean`| Average of mean of time measurement of GravityAccMag | numeric | 
| `TimeGravityAccMagStd`| Average of standard deviation of time measurement of GravityAccMag | numeric | 
| `TimeBodyAccJerkMagMean`| Average of mean of time measurement of BodyAccJerkMag | numeric | 
| `TimeBodyAccJerkMagStd`| Average of standard deviation of time measurement of BodyAccJerkMag | numeric | 
| `TimeBodyGyroMagMean`| Average of mean of time measurement of BodyGyroMag | numeric | 
| `TimeBodyGyroMagStd`| Average of standard deviation of time measurement of BodyGyroMag | numeric | 
| `TimeBodyGyroJerkMagMean`| Average of mean of time measurement of BodyGyroJerkMag | numeric | 
| `TimeBodyGyroJerkMagStd`| Average of standard deviation of time measurement of BodyGyroJerkMag | numeric | 
| `FreqBodyAccMeanX`| Average of mean of frequency measurement of BodyAcc in X axis | numeric | 
| `FreqBodyAccMeanY`| Average of mean of frequency measurement of BodyAcc in Y axis | numeric | 
| `FreqBodyAccMeanZ`| Average of mean of frequency measurement of BodyAcc in Z axis | numeric | 
| `FreqBodyAccStdX`| Average of standard deviation of frequency measurement of BodyAcc in X axis | numeric | 
| `FreqBodyAccStdY`| Average of standard deviation of frequency measurement of BodyAcc in Y axis | numeric |
| `FreqBodyAccStdZ`| Average of standard deviation of frequency measurement of BodyAcc in Z axis | numeric |
| `FreqBodyAccJerkMeanX`| Average of mean of frequency measurement of BodyAccJerk in X axis | numeric | 
| `FreqBodyAccJerkMeanY`| Average of mean of frequency measurement of BodyAccJerk in Y axis | numeric |
| `FreqBodyAccJerkMeanZ`| Average of mean of frequency measurement of BodyAccJerk in Z axis | numeric |
| `FreqBodyAccJerkStdX`| Average of standard deviation of frequency measurement of BodyAccJerk in X axis | numeric | 
| `FreqBodyAccJerkStdY`| Average of standard deviation of frequency measurement of BodyAccJerk in Y axis | numeric | 
| `FreqBodyAccJerkStdZ`| Average of standard deviation of frequency measurement of BodyAccJerk in Z axis | numeric | 
| `FreqBodyGyroMeanX`| Average of mean of frequency measurement of BodyGyro in X axis | numeric | 
| `FreqBodyGyroMeanY`| Average of mean of frequency measurement of BodyGyro in X axis | numeric | 
| `FreqBodyGyroMeanZ`| Average of mean of frequency measurement of BodyGyro in X axis | numeric | 
| `FreqBodyGyroStdX`| Average of standard deviation of frequency measurement of BodyGyro in X axis | numeric | 
| `FreqBodyGyroStdY`| Average of standard deviation of frequency measurement of BodyGyro in X axis | numeric | 
| `FreqBodyGyroStdZ`| Average of standard deviation of frequency measurement of BodyGyro in X axis | numeric | 
| `FreqBodyAccMagMean`| Average of mean of frequency measurement of BodyAccMag | numeric | 
| `FreqBodyAccMagStd`| Average of standard deviation of frequency measurement of BodyAccMag | numeric | 
| `FreqBodyBodyAccJerkMagMean`| Average of mean of frequency measurement of BodyBodyAccJerkMag | numeric | 
| `FreqBodyBodyAccJerkMagStd`| Average of standard deviation of frequency measurement of BodyBodyAccJerkMag | numeric | 
| `FreqBodyBodyGyroMagMean`| Average of mean of frequency measurement of odyBodyGyroMag | numeric | 
| `FreqBodyBodyGyroMagStd`| Average of standard deviation of frequency measurement of odyBodyGyroMag | numeric | 
| `FreqBodyBodyGyroJerkMagMean`| Average of mean of frequency measurement of BodyGyroJerkMag | numeric | 
| `FreqBodyBodyGyroJerkMagStd`| Average of standard deviation of frequency measurement of BodyGyroJerkMag | numeric | 




