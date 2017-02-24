## Gettjing and Cleaning Data Course Project

## Create directory

if(!file.exists("./data")){dir.create("./data")}
setwd("./data")

## Get data for project
## File url

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download data

download.file(url, "Project.zip")

## Unzip the file

unzip(zipfile = "Project.zip")

## Get datasets

## Get three training datasets: subject, X, and y, which correspond to subject,
## features dataset, and activity labels, respectively

subjectTrain <- read.table(file.path("UCI HAR Dataset", "train","subject_train.txt"), header = FALSE)
featuresTrain <- read.table(file.path("UCI HAR Dataset", "train","X_train.txt"), header = FALSE)
activityTrain <- read.table(file.path("UCI HAR Dataset", "train","y_train.txt"), header = FALSE)

## Get three testing dataset: subject, X, and y

subjectTest <- read.table(file.path("UCI HAR Dataset", "test","subject_test.txt"), header = FALSE)
featuresTest <- read.table(file.path("UCI HAR Dataset", "test","X_test.txt"), header = FALSE)
activityTest <- read.table(file.path("UCI HAR Dataset", "test","y_test.txt"), header = FALSE)

## Examine the datasets

str(subjectTrain)
str(subjectTest)
str(featuresTrain)
str(featuresTest)
str(activityTrain)
str(activityTest)

## Step 1: Merge test and train datasets to create one dataset

## Combine train and test datasets for subject, features, and activity

subject <- rbind(subjectTrain, subjectTest)
features <- rbind(featuresTrain, featuresTest)
activity <- rbind(activityTrain, activityTest)

## Give variables names, either set manually or use relevent text files from the
## downloaded zip file

names(subject) <- "subject"
names(activity) <- "activity"

## Name of features is in the features.txt file.  Read this in first and select
## the second column to be the names of the data frame.

featuresnames <- read.table(file.path("UCI HAR Dataset", "features.txt"), header = FALSE)
names(features) <- featuresnames[,2]

## Re-examine data frames to ensure have the correct titles and check for errors

str(subject)
str(features)
str(activity)

## Merge datasets together to create single dataset using cbind

data <- cbind(features, subject, activity)

## Check data

str(data)

## Step 2: Extract only the measurements on the mean and standard deviation for
## each measurement

## Select names of features using featurenames that have mean() or std() in name

selectnames <- featuresnames$V2[grep("mean\\(\\)|std\\(\\)",featuresnames$V2)]

## Subset data using selectnames, ensuring have activity and subject names added

allnames <- c(as.character(selectnames), "subject", "activity")
data <- subset(data, select = allnames)

## Re-examine data to check for errors

str(data)

## Step 3: Use descriptive activity names to name the activities in the data set

## Get activity labels from file

activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"), header = FALSE)

## Name activities in data

data <- merge(data, activityLabels, by.x = "activity", by.y = "V1", all.x = TRUE)

## Rename column with activity labels in data

colnames(data)[69] <- "activity_names"

## Look at data to check for errors

str(data)

## Step 4: Appropriately label the data set with descriptive variable names

## Replacements:
    ## t replaced by time
    ## Acc replaced by Accelerometer
    ## Gyro replaced by Gyroscope
    ## Mag repalced by Magnitude
    ## f replaced by frequency
    ## BodyBody replaced by Body

names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("f", "frequency", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))

## Check data for errors

names(data)

## Step 5: From the data in steop 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject.

## Add average for each variable for activity and subject

library(plyr)

finalData <- aggregate(. ~subject + activity_names, data, mean)
finalData <- finalData[order(finalData$subject, finalData$activity_names),]

## Examine finalData before writing file

str(finalData)

## Write tidy data set

write.table(finalData, file = "tidydataset.txt", row.names = FALSE)