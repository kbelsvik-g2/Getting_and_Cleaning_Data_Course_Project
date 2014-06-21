Getting_and_Cleaning_Data_Course_Project
========================================

Course project for the Getting and Cleaning Data Coursera course

### Included files:

- ActivityData.txt
- CodeBook.md
- README.md
- run_analysis.R
- UCI_HAR_DATASET.zip


- **ActivityData.txt** - This file contains the finished clean dataset for this project.  It can be read into R using read.table().  A in depth description of this data and how it was obtained can be found below or in **CodeBook.md**.

- **CodeBook.md** - This file contains the description of the data and how it was obtained.

- **UCI_HAR_DATASET.zip** - A zip file containing the raw data used to computed the finished clean data for this project.

- **run_analysis.R** - The script that can be used to process the raw data contained in **UCI_HAR_DATASET.zip** and produce **ActivityData.txt**.  **UCI_HAR_DATASET.zip** must be found in the working diectory for this R script to run.

### How to run:
Ensure that the data **UCI_HAR_DATASET.zip** is in the working directory and run **run_analysis.R** which will produce **ActivityData.txt**.

### Explaination of analysis:
The data is imported from **X_train.txt** and **X_test.txt** files in the train and test folders respectively and then combined together using rbind().

Mean and standard deviation variables are extracted from the combined data by examining the variable names imported from the **features.txt** file.  Columns correspoding to variable names containing either mean() or std() are found using grep().  Using the logical vector returned by grep() these columns are extracted to be used as our data.

Once the desired variables have been extracted the variable names from **features.txt** are cleansed by having any of the characters "-", "(", and ")" removed using gsub(). The cleansed names of the variables extracted before are then assigned as the column names of the of our data.

The activity data **y_train.txt** and **y_test.txt** from the train and test folders is imported and combined using rbind().  This data represents the activity performed for each observation in our data set.  To convert the activity data from integer codes into more descriptive character strings, the data from **activity_labels.txt** is imported.  All activity codes are replaced with the corresponding text description according to the activity labels.  Activity data is then combined into our data using cbind().

Test subject data is imported from **subject_train.txt** and **subject_test.txt** in the train and test folders, combined using rbind(), and added to our data using cbind().

Our data is condensed on the means corresponding to each subject, activity, and variable using melt() then dcast().