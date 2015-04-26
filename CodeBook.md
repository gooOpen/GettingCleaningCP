---
output: html_document
---
CodeBook
------------------------------------------
###Dataset
This codebook applies to the tidy dataset in tidy_data2.txt

###Variables   
   * **activity**: The activity performed by the participant denominated by the "subject" variable.
   * **subject**: The participant who performs the activity denominated by the "activity" variable.
   * **tBodyAcc-mean-X****: The average of the mean values of the body acceleration along the smartphones X axis, taken across the observations accrued by the performance of the participant identified by the "subject" variable when doing the activity denominated by the "activity" variable.
   
The same logic applies to all of the following variables which hold the respective averages of the denominated variable found in the original dataset, by activity and performing subject:

   * **tBodyAcc-mean-Z** 
   * **tGravityAcc-mean-Y**
   * **tBodyAccJerk-mean-X**
   * **tBodyAccJerk-mean-Z**
   * **tBodyGyro-mean-Y**
   * **tBodyGyroJerk-mean-X**
   * **tBodyGyroJerk-mean-Z**
   * **tGravityAccMag-mean**
   * **tBodyGyroMag-mean**
   * **fBodyAcc-mean-X**
   * **fBodyAcc-mean-Z**
   * **fBodyAcc-meanFreq-Y**
   * **fBodyAccJerk-mean-X**
   * **fBodyAccJerk-mean-Z**
   * **fBodyAccJerk-meanFreq-Y**
   * **fBodyGyro-mean-X**
   * **fBodyGyro-mean-Z**
   * **fBodyGyro-meanFreq-Y**
   * **fBodyAccMag-mean**
   * **fBodyBodyAccJerkMag-mean**
   * **fBodyBodyGyroMag-mean**
   * **fBodyBodyGyroJerkMag-mean**
   * **tBodyAcc-std-X**
   * **tBodyAcc-std-Z**
   * **tGravityAcc-std-Y**
   * **tBodyAccJerk-std-X**
   * **tBodyAccJerk-std-Z**
   * **tBodyGyro-std-Y**
   * **tBodyGyroJerk-std-X**
   * **tBodyGyroJerk-std-Z**
   * **tGravityAccMag-std**
   * **tBodyGyroMag-std**
   * **fBodyAcc-std-X**
   * **fBodyAcc-std-Z**
   * **fBodyAccJerk-std-Y**
   * **fBodyGyro-std-X**
   * **fBodyGyro-std-Z**
   * **fBodyBodyAccJerkMag-std**
   * **fBodyBodyGyroJerkMag-std**
   * **tBodyAcc-mean-Y**
   * **tGravityAcc-mean-X**
   * **tGravityAcc-mean-Z**
   * **tBodyAccJerk-mean-Y**
   * **tBodyGyro-mean-X**
   * **tBodyGyro-mean-Z**
   * **tBodyGyroJerk-mean-Y**
   * **tBodyAccMag-mean**
   * **tBodyAccJerkMag-mean**
   * **tBodyGyroJerkMag-mean**
   * **fBodyAcc-mean-Y**
   * **fBodyAcc-meanFreq-X**
   * **fBodyAcc-meanFreq-Z**
   * **fBodyAccJerk-mean-Y**
   * **fBodyAccJerk-meanFreq-X**
   * **fBodyAccJerk-meanFreq-Z**
   * **fBodyGyro-mean-Y**
   * **fBodyGyro-meanFreq-X**
   * **fBodyGyro-meanFreq-Z**
   * **fBodyAccMag-meanFreq**
   * **fBodyBodyAccJerkMag-meanFreq**
   * **fBodyBodyGyroMag-meanFreq**
   * **fBodyBodyGyroJerkMag-meanFreq**
   * **tBodyAcc-std-Y**
   * **tGravityAcc-std-X**
   * **tGravityAcc-std-Z**
   * **tBodyAccJerk-std-Y**
   * **tBodyGyro-std-X**
   * **tBodyGyro-std-Z**
   * **tBodyGyroJerk-std-Y**
   * **tBodyAccMag-std**
   * **tBodyAccJerkMag-std**
   * **tBodyGyroJerkMag-std**
   * **fBodyAcc-std-Y**
   * **fBodyAccJerk-std-X**
   * **fBodyAccJerk-std-Z**
   * **fBodyGyro-std-Y**
   * **fBodyAccMag-std**
   * **fBodyBodyGyroMag-std**
   
The relevant information is to be found in the features_info.txt file, provided with the original data.