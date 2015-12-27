## Coursera: Getting and Cleaning Data Course Project
## R script to perform the analysis specified in the assignment
## Please note the assignment data should be in the working directory

DataTestX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = TRUE)
DataTestY <- read.table("./UCI HAR Dataset/test/Y_test.txt", header = TRUE)
SubTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = TRUE)
## Import Data from test folder
DataTrainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header = TRUE)
DataTrainY <- read.table("./UCI HAR Dataset/train/Y_train.txt", header = TRUE)
SubTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = TRUE)
## Import Data from trial folder
VarNamesTemp <- read.table("./UCI HAR Dataset/features.txt", header = TRUE)
ActLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = TRUE)
## Import Data in common, i.e. variable names and activity labels

library(plyr, dplyr, data.table)

VarNames <- make.names(VarNamesTemp[,2], unique = TRUE, allow_ = FALSE)
## Transform variable names into syntactically valid names
names(DataTestX) <- VarNames
names(DataTrainX) <- VarNames
## Substitute non-descript variable names in main data sets with descriptive variable names

DataTestX <- mutate(DataTestX, Subject = SubTest[,1], TestLabels = DataTestY[,1])
DataTrainX <- mutate(DataTrainX, Subject = SubTrain[,1], TestLabels = DataTrainY[,1])
## Add columns with subjects info and test labels in main data sets

AllDataX <- rbind(DataTestX,DataTrainX)
## Merge the two main data sets -- append the Train data to the Test data set

AllDataX2 <- select(AllDataX, Subject, TestLabels, contains("mean"), contains("std"))
## Keep only the measurements on the mean and standard deviation

AllDataX2 <- mutate(AllDataX2, Activity = ActLabels$V2[match(AllDataX2$TestLabel, ActLabels$V1)])
## Create a new variable "Activity" in the main data set then populate by using the match
## function and attach the descriptive activity names in ActLabels to the records

ProvDT <- setDT(AllDataX2) [, lapply(.SD, mean), by=.(Activity, Subject), .SDcols=!"TestLabels"]
SummData <- setDF(ProvDT)
## Create new tidy data set with the average of each variable for each activity
## and each subject -- Use data.table package to aggregate main data set
## by Activity and Subject

SummData <- arrange(SummData, Activity, Subject)
## Sort data by Activity and Subject
write.table(SummData, file = "SummaryData.txt", row.name=FALSE)
## Save tidy data set as txt file


