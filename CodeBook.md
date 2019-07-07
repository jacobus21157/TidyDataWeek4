# CodeBook for the Tidy Data Set for Week 4 Project

## Final Output
To obtain the final output, tidyData.txt, several steps are needed:
1. Download the original data set for the course and unzip it into the data directory specified in the ReadMe file.
2. Run the R script contained in the run_analysis.R file.

## Original data
The original data set, Human Activity Recognition Using Smartphones Data Set, is hosted at the University of California, Irvine. It contains Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. Additional details are available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data repository for this project is: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data set consists of several data files:
* Main
  * activity_labels: Six labels for the activities
    * Walking
    * Walking_Upstairs
    * Walking_downstairs
    * Sitting
    * Standing
    * Laying
  * features: The names of the variables observed (561 labels)
  * features_info: Descriptive file of the data

* Test
  * subject_test: for each observation, the ID number of the subject (1-30)
  * X_test: main data set 2947 observations of 561 variables
  * y_test: The activity number for each of the observations

* Training
  * subject_test: for each observation, the ID number of the subject (1-30)
  * X_test: main data set 7352 observations of 561 variables
  * y_test: The activity number for each of the observations

## Processing the Data
### Tasks for the Project
Per the directions given for the Project, the tasks are:
1. Merge the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Reading in the Data
1. The feature names are read into: feature_name
2. The training data are read into: training_data, training_subject, training_activity
3. The test data are read into: test_data, test_subject, test_activity
4. The activity labels are read into: activity_labels

## Labelling the Data
1. The training and test data columns are named using the features in feature_name
2. The training and test subject columns are named "subjectID"
3. The training and test activity columns are named "activityID"
4. The activity_labels columns are named "activityID" and "activitySubject"

## Merging the data sets
1. Training: The three data sets (training_activity, training_subject, training_data) are bound using cbind
2. Test: The three data sets (test_activity, test_subject, test_data) are bound using cbind
3. The bound training and test data sets are bound using rbind into the merge_train_test table.

## Extracting mean and std deviation data
The merge_train_test data table is reduced using grepl to only contain the mean and std deviation columns for each measurement. The activityID and subjectID columns are also retained.

## Labeling the activities
The activitySubject for each observation is added using a merge between the meanAndStd and activity_labels tables into meansAndStdActivities

## Creating tidyData
The new tidy data set (tidyData) is created by aggrigating the meansAndStdActivities table by subjectID and activitiySubject and collapsing the variables into a mean value for each subject and activity. The tidyData table is then written to the tidyData.txt file.
