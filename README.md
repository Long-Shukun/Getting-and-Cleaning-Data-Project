#Getting and Cleaning Data Project
This file shows how all of the scripts work.  
* Set your working directory.
* Create a directory './data' in your working directory.
* Download the original data from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' and then unzip it. Save the data in the directory './data' which you've just created.  

*You can do the above with the code in the 'run_analysis.R' or you can do it mannually.*  

* Create an R script and save it in your working directory(the same directory with the directory './data').
* Load these data into Rstdio: 'X_train.txt', 'y_train.txt', 'subject_train.txt', 'X_test.txt', 'y_test.txt', 'subject_test.txt'.
* Install the package 'dplyr'.
* Run the R code. Then you can  
 + merge these data sets，
 + extract measurements on mean and std，
 + replace activity labels with activity names，
 + appropriately name the columns，
 + create a second tidy data.
* Finnaly, write the tidy data you've just got into your working directory.  

The steps in details are listed bellow:
* Download and unzip the original data using functions 'download.file' and 'unzip'.
* Load the following data sets into Rstdio using function 'read.table': 'X_train.txt', 'y_train.txt', 'subject_train.txt', 'X_test.txt', 'y_test.txt', 'subject_test.txt'.
* Merge these data sets using functions 'cbind' and 'rbind'.
* Read 'feature.txt' into Rstdio, which contains the feature names.
* Using function 'grep' to extract the columns of the measurements on mean and std.
* Read 'activity_labels.txt' into Rstdio, which contains the activity names.
* Replace the activity labels(1-6) with the activity names using the function 'factor'.
* Name the columns in the data set and then refine some of the names. For instance, change '^t'(or '^f') into 'TimeDomain-'(or 'FrequencyDomain-') and change 'mean()'(or 'std()') into 'Mean'(or 'Std').
* Create the second tidy data set using functions 'group_by' and 'summarise' in the package 'dplyr'.
* Write the new tidy data.
