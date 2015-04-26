setwd('Dokumente//Studium//MOOC//Coursera//Data Science//2 - Getting and Cleaning//Course Project/')
#Project purpose: to demonstrate ability to collect, work with, and clean a data set. 
#Project goal: to prepare tidy data that can be used for later analysis. 
#Grading: by your peers on a series of yes/no questions.
#Required to submit: 
#     1) a tidy data set as described below, 
#     2) a link to a Github repository with your script for performing the analysis, and
#     3) a code book called CodeBook.md that describes variables, data, and
#           any transformations etc. performed to clean up the data.
#     You should also include a README.md in the repo with your scripts. 
#     This repo explains how all of the scripts work and how they are connected. 
#Project Description: One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
#Project Data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#Project format: one R script called run_analysis.R that does the following. 
#     1.Merges the training and the test sets to create one data set.
#     2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#     3.Uses descriptive activity names to name the activities in the data set
#     4.Appropriately labels the data set with descriptive variable names. 
#     5.From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.

##Preparation
library('plyr')

##Get both sets, and all necessary columns (data, activity type, subject, set type) before merging
train             <- read.table(file='UCI HAR Dataset//train//X_train.txt', header = FALSE, dec =".")
y_train           <- read.table(file='UCI HAR Dataset//train//y_train.txt', header = FALSE)
train_subject     <- read.table(file='UCI HAR Dataset//train//subject_train.txt', header = FALSE) 
train             <- cbind(train,y_train,train_subject,rep(1,nrow(train)))
names(train)  <- 1:ncol(train)

test              <- read.table(file='UCI HAR Dataset//test//X_test.txt', header = FALSE, dec =".")
y_test            <- read.table(file='UCI HAR Dataset//test//y_test.txt', header = FALSE)
test_subject     <- read.table(file='UCI HAR Dataset//test//subject_test.txt', header = FALSE) 
test              <- cbind(test,y_test,test_subject,rep(2,nrow(test)))
names(test)  <- 1:ncol(test)

##Merging and labeling
traintest         <- rbind(train,test)
colnames          <- read.table(file='UCI HAR Dataset//features.txt', header = FALSE, colClasse=(c("numeric","character")))
colnames          <- colnames[,2]
activity_names    <- read.table(file='UCI HAR Dataset//activity_labels.txt')
names(traintest)  <- c(colnames,"activity","subject","set")
names(traintest) <- gsub("\\(\\)","",names(traintest))
traintest$"activity"  <- factor(traintest$"activity", levels=activity_names[,1], labels=activity_names[,2])
traintest$"set"  <- factor(traintest$"set", levels=1:2, labels=c("train","test"))

##Keeping only variables that have either "-mean" or "-std" in their variables names
traintest.mean.std  <- traintest[,c(grep("-mean",names(traintest)),grep("-std",names(traintest)))]
traintest.mean.std  <- cbind(traintest[,c('set','subject','activity')],traintest.mean.std)

## Average of each variable for each activity and each subject.
###Interpretation 1, see README.md
activity_aggr           <- ddply(traintest.mean.std, .(activity), numcolwise(mean))
activity_aggr           <- activity_aggr[,c(1,3:ncol(activity_aggr))]   #remove useless average of subject IDs
colnames(activity_aggr)[colnames(activity_aggr)=="activity"] <- "aggregation.level"
activity_aggr$'aggregation.level' <-paste(rep("activity ",6),activity_aggr$'aggregation.level')

subject_aggr            <- ddply(traintest.mean.std, .(subject), numcolwise(mean))
colnames(subject_aggr)[colnames(subject_aggr)=="subject"] <- "aggregation.level"
subject_aggr$'aggregation.level' <-paste(rep("subject ",30),subject_aggr$'aggregation.level')

aggregation  <- rbind(activity_aggr,subject_aggr)
write.table(aggregation,"tidy_data1.txt",row.name=FALSE)

###Interpretaion 2, see README.md
activity.subject_aggr   <- ddply(traintest.mean.std, .(activity, subject), numcolwise(mean))
write.table(activity.subject_aggr,"tidy_data2.txt",row.name=FALSE)