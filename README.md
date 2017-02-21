---
title: "README"
output: html_document
---

# Getting and Cleaning Data: Course Project  
  
## Files in this repo  
  
* README.md -- This document
* CodeBook.md -- codebook with variables and summaries calculated with units and other information
* run_analysis.R -- R code for course project

## Description of Project  

### Data Collection

The purpose of this program is to collect the data from the UCI Machine Learning Repository for the [Human Activity Recognition Using Smartphones Data Set experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The original data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  It was gathered from experiments composed of 30 volunteers aged 19-48. This data was collected with a Samsung Galaxy S II smartphone on subjects wrist using the embedded accelerometer and gyroscope.  It captured three axial linear acceleration and three axial angular velocity at 50 Hz.  The researchers recorded the experiments on video and entered the labels by hand.  The data is made up of 70% in the training data and 30% in the test.

Further information about the data, how it was gathered, and what it includes can be found in the README.txt file found in the downloaded data.

## Requirements

The requirements for this project for the Getting and Cleaning Data course by John Hopkins University on Coursera are to create a tidy data set, codebook, and README file (this document).  

The tidy dataset is completed at the end of the run_analysis.R code provided in this repo as tidydata.txt.  The resulting file can be read back into RStudio using read.table("tidydataset.txt", header = TRUE), provided the user keeps the data stored in the directory created in the code.  Before running the script, the user should start in a working directory where they want a new directory to be created by the script.  The script then creates a new directory, downloads the data, and locates the files required.

The codebook provides a review of the project and variables used in run_analysis.R.

## Explanation of run_analysis.R

The script does the following:

1. Creates data directory if it does not exists
2. Sets working directory to data directory
3. Set url to link to data
4. Download the files
    + This is saved to the data directory
5. Unzip the files so the data can be accessed (in data directory)
6. Collect raw data from files
    + Includes the X, y, and subject files from train and test data
7. Create single data.frame from 6 data.frames
    + Name variables in this step
8. Select only variables with mean and standard deviation
    + Store results in same data.frame
9. Label the activities using the activity_labels.txt in the downloaded data
10. Make the variable names more descriptive by substituting more appropriate names
11. Calculate the mean for each variable for each activity and each subject
12. Write output file as tidydataset.txt