---
title: "CodeBook"
output: html_document
---

## Project Description

Gather data spread across multiple datasets into single file and output result as a tidy data set.  More information can be found in README.

## Creating Tidy Data Set

Steps as described in Assignment Requirements on Coursera:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps usded by the script are located in the README file.

Tidy data is organized so all columns are variables, all rows are observations, and each column contains a single variable.  The variable names are descriptive.

## Variables for run_analysis.R

The following represent the variables found in run_analysis.R script.

Duplicates of train data.frames exist for data from the test files
* sujectTrain: unedited data from subject_train.txt, contians IDs for volunteers
* featuresTrain: unedited data from X_train.txt, contines the values of the measurements (see below)
* activityTrain: uedited data from y_train.txt, contains activity codes

Combined data.frames, bound by rows
* subject: all subject IDs from train and test data
* features: all feature values from train and test data
* activity: all activity ids from train and test data

Name variables:
* featurenames: contains names for features dafa.frame (variable names for output)
* selectnames: selection of featurenames that contian mean or standard deviation
* allnames: concatinated selectnames with "subject" and "activity" for output data
* activitLabels: values of activity codes (1:6): Laying, Sitting, Standing, Walking, Walking_downstairs, Walking_upstairs; describes the activity the subject was doing at time of measurement

Version one of combined data:
* data: single data.frame with subject, features, and activity combined by columns to be cleaned
* finalData: cleaned data.frame with mean for subject and activity variables


## Variables tidydataset.txt

* subject: integer; id of volunteer measurments are taken for (1:30)
* activity_names: Factor, 6 levels: Laying, Sitting, Standing, Walking, Walking_downstairs, Walking_upstairs; describes the activity the subject was doing at time of measurement
* activity: integer (1:6); code value correspond to activity label found in activity_names
    + 1: Walking
    + 2: Walking_Upstairs
    + 3: Walking_Downstairs
    + 4: Sitting
    + 5: Standing
    + 6: Laying

### Mearuements:

Described from the features_info of downloaded data with edits included to reflect changes made by run_analysis.R.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* timeBodyAccelerometer-XYZ
* timeGravityAccelerometer-XYZ
* timeBodyAccJerkelerometer-XYZ
* timeBodyGyroscope-XYZ
* timeBodyGyroscopeJerk-XYZ
* timeBodyAccelerometerMagnitude
* timeGravityAccelerometerMagnitude
* timeBodyAccelerometerJerkMagnitude
* timeBodyGyroscopeMagnitude
* timeBodyGyroscopeJerkMagnitude
* frequencyBodyAccelerometer-XYZ
* frequencyBodyAccelerometerJerk-XYZ
* frequencyBodyGyroscope-XYZ
* frequencyBodyAccelerometerMagnitude
* frequencyBodyAccelerometerJerkMagnitude
* frequencyBodyGyroscopeMagnitude
* frequencyBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* timeBodyAccelerometerMean
* timeBodyAccelerometerJerkMean
* timeBodyGyroscopeMean
* timeBodyGyroscopeJerkMean