# *Getting and Cleaning Data* Course Week 4 Project

This repo is for the Coursera Course _Getting and Cleaning Data_ Week #4 project.  It contains the CodeBook for the data, the R script, and the tidy data set that is the final output for this project.

## Data:
The data for this project are downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For the script to run properly, the data needs to be unzipped to a subfolder named "UCI HAR Dataset".


## Files:
CodeBook.md describes the variables, the data, and transformations or other work that performed to clean up the data.

run_analysis.R contains the R code needed to process the data to acheive the five tasks required for this project:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyData.txt is the second, independent data set with the average (mean) of each variable, ordered by activity and subject.
