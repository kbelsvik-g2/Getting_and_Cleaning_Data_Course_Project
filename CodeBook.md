# Code Book for ActivityData.txt
**ActivityData.txt** contains data for 180 observations of 68 variables

This data is compiled using run_analysis.R using data which can be obtained from:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Description of data
The data contains the mean for all mean a standard deviation varaiables sampled for each test subject and activity performed.  The activity column identifies which activity was performed and the subject column identifies the id of which subject performed the activity.  The remaining 66 columns are for each of the mean and standard deviation variables we are interested in.

A description of how the raw data was obtained from **features_info.txt**, which is included with the data set:

      The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
      
      Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
      
      Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
      
      These signals were used to estimate variables of the feature vector for each pattern:  
      '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
      
      tBodyAcc-XYZ
      tGravityAcc-XYZ
      tBodyAccJerk-XYZ
      tBodyGyro-XYZ
      tBodyGyroJerk-XYZ
      tBodyAccMag
      tGravityAccMag
      tBodyAccJerkMag
      tBodyGyroMag
      tBodyGyroJerkMag
      fBodyAcc-XYZ
      fBodyAccJerk-XYZ
      fBodyGyro-XYZ
      fBodyAccMag
      fBodyAccJerkMag
      fBodyGyroMag
      fBodyGyroJerkMag
      
      The set of variables that were estimated from these signals are: 
      
      mean(): Mean value
      std(): Standard deviation
      mad(): Median absolute deviation 
      max(): Largest value in array
      min(): Smallest value in array
      sma(): Signal magnitude area
      energy(): Energy measure. Sum of the squares divided by the number of values. 
      iqr(): Interquartile range 
      entropy(): Signal entropy
      arCoeff(): Autorregresion coefficients with Burg order equal to 4
      correlation(): correlation coefficient between two signals
      maxInds(): index of the frequency component with largest magnitude
      meanFreq(): Weighted average of the frequency components to obtain a mean frequency
      skewness(): skewness of the frequency domain signal 
      kurtosis(): kurtosis of the frequency domain signal 
      bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
      angle(): Angle between to vectors.
      
      Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
      
      gravityMean
      tBodyAccMean
      tBodyAccJerkMean
      tBodyGyroMean
      tBodyGyroJerkMean
      
As stated above, for the purposes of this assignment, of the variables described in the featues_info.txt, the variables we are interested in for each of the signals are mean(), and std().


## Transformation of data
Data transformation was done using the run_analysys.R script

### Explaination of process
The data is imported from **X_train.txt** and **X_test.txt** files in the train and test folders respectively and then combined together using rbind().

Mean and standard deviation variables are extracted from the combined data by examining the variable names imported from the **features.txt** file.  Columns correspoding to variable names containing either mean() or std() are found using grep().  Using the logical vector returned by grep() these columns are extracted to be used as our data.

Once the desired variables have been extracted the variable names from **features.txt** are cleansed by having any of the characters "-", "(", and ")" removed using gsub(). The cleansed names of the variables extracted before are then assigned as the column names of the of our data.

The activity data **y_train.txt** and **y_test.txt** from the train and test folders is imported and combined using rbind().  This data represents the activity performed for each observation in our data set.  To convert the activity data from integer codes into more descriptive character strings, the data from **activity_labels.txt** is imported.  All activity codes are replaced with the corresponding text description according to the activity labels.  Activity data is then combined into our data using cbind().

Test subject data is imported from **subject_train.txt** and **subject_test.txt** in the train and test folders, combined using rbind(), and added to our data using cbind().

Our data is condensed on the means corresponding to each subject, activity, and variable using melt() then dcast().

## Data Dictionary

A breif description of each of variables in **ActivityData.txt**

### activity
      Type of activity being preformed by the test subject:
      Possible Values:
            WALKING
            WALKING_UPSTAIRS
            WALKING_DOWNSTAIRS
            SITTING
            STANDING
            LAYING

### subject
      Identifier of the test subject performing the activity
      Possible Values: integers 1 to 30

### All following variables contain means of the data for each activity and subject, for a more in depth descrption of the meaning of these variables please read features_info.txt found with the raw data set, or see the excerpt included above in this document:

### tBodyAcc.mean.X
      X component of the tBodyAcc.mean vector

### tBodyAcc.mean.Y
      Y component of the tBodyAcc.mean vector

### tBodyAcc.mean.Z
      Z component of the tBodyAcc.mean vector

### tBodyAcc.std.X
      X component of the tBodyAcc.std vector

### tBodyAcc.std.Y
      Y component of the tBodyAcc.std vector

### tBodyAcc.std.Z
      Z component of the tBodyAcc.std vector

### tGravityAcc.mean.X
      X component of the tGravityAcc.mean vector

### tGravityAcc.mean.Y
      Y component of the tGravityAcc.mean vector

### tGravityAcc.mean.Z
      Z component of the tGravityAcc.mean vector

### tGravityAcc.std.X
      X component of the tGravityAcc.std vector

### tGravityAcc.std.Y
      Y component of the tGravityAcc.std vector

### tGravityAcc.std.Z
      Z component of the tGravityAcc.std vector

### tBodyAccJerk.mean.X
      X component of the tBodyAccJerk.mean vector

### tBodyAccJerk.mean.Y
      Y component of the tBodyAccJerk.mean vector

### tBodyAccJerk.mean.Z
      Z component of the tBodyAccJerk.mean vector

### tBodyAccJerk.std.X
      X component of the tBodyAccJerk.std vector

### tBodyAccJerk.std.Y
      Y component of the tBodyAccJerk.std vector

### tBodyAccJerk.std.Z
      Z component of the tBodyAccJerk.std vector

### tBodyGyro.mean.X
      X component of the tBodyGyro.mean vector

### tBodyGyro.mean.Y
      Y component of the tBodyGyro.mean vector

### tBodyGyro.mean.Z
      Z component of the tBodyGyro.mean vector

### tBodyGyro.std.X
      X component of the tBodyGyro.std vector

### tBodyGyro.std.Y
      Y component of the tBodyGyro.std vector

### tBodyGyro.std.Z
      Z component of the tBodyGyro.std vector

### tBodyAccMag.mean
      The tBodyAccMag.mean magnitude

### tBodyAccMag.std
      The tBodyAccMag.std magnitude

### tGravityAccMag.mean
      The tGravityAccMag.mean magnitude

### tGravityAccMag.std
      The tGravityAccMag.std magnitude

### tBodyAccJerkMag.mean
      The tBodyAccJerkMag.mean magnitude

### tBodyAccJerkMag.std
      The tBodyAccJerkMag.std magnitude

### tBodyGyroMag.mean
      The tBodyGyroMag.mean magnitude

### tBodyGyroMag.std
      The tBodyGyroMag.std magnitude

### tBodyGyroJerkMag.mean
      The tBodyGyroJerkMag.mean magnitude

### tBodyGyroJerkMag.std
      The tBodyGyroJerkMag.std magnitude

### fBodyAcc.mean.X
      X component of the fBodyAcc.mean vector

### fBodyAcc.mean.Y
      Y component of the fBodyAcc.mean vector

### fBodyAcc.mean.Z
      Z component of the fBodyAcc.mean vector

### fBodyAcc.std.X
      X component of the fBodyAcc.std vector

### fBodyAcc.std.Y
      Y component of the fBodyAcc.std vector

### fBodyAcc.std.Z
      Z component of the fBodyAcc.std vector

### fBodyAccJerk.mean.X
      X component of the fBodyAccJerk.mean vector

### fBodyAccJerk.mean.Y
      Y component of the fBodyAccJerk.mean vector

### fBodyAccJerk.mean.Z
      Z component of the fBodyAccJerk.mean vector

### fBodyAccJerk.std.X
      X component of the fBodyAccJerk.std vector

### fBodyAccJerk.std.Y
      Y component of the fBodyAccJerk.std vector

### fBodyAccJerk.std.Z
      Z component of the fBodyAccJerk.std vector

### fBodyGyro.mean.X
      X component of the fBodyGyro.mean vector

### fBodyGyro.mean.Y
      Y component of the fBodyGyro.mean vector

### fBodyGyro.mean.Z
      Z component of the fBodyGyro.mean vector

### fBodyGyro.std.X
      X component of the fBodyGyro.std vector

### fBodyGyro.std.Y
      Y component of the fBodyGyro.std vector

### fBodyGyro.std.Z
      Z component of the fBodyGyro.std vector

### fBodyAccMag.mean
      The fBodyAccMag.mean magnitude

### fBodyAccMag.std
      The fBodyAccMag.std magnitude

### fBodyBodyAccJerkMag.mean
      The fBodyBodyAccJerkMag.mean magnitude

### fBodyBodyAccJerkMag.std
      The fBodyBodyAccJerkMag.std magnitude

### fBodyBodyGyroMag.mean
      The fBodyBodyGyroMag.mean magnitude

### fBodyBodyGyroMag.std
      The fBodyBodyGyroMag.std magnitude

### fBodyBodyGyroJerkMag.mean
      The fBodyBodyGyroJerkMag.mean magnitude

### fBodyBodyGyroJerkMag.std
      The fBodyBodyGyroJerkMag.std magnitude