## Coursera "Getting and Cleaning Data" Course; Week 4; Course Project

## Assumes that the data set has been downloaded and uzipped to the "UCI HAR Dataset" subdirectory

## Read in feature names and apply them to the training and test data sets
feature_name <- read.table(".\\UCI HAR Dataset\\features.txt", sep="", header = FALSE)

## Read in training data
training_data <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", sep = "", header = FALSE)
training_subject <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", sep = "", header = FALSE)
training_activity <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", sep="", header = FALSE)

## Name the training data columns (Task 4)
colnames(training_data) <- feature_name[,2]
colnames(training_subject) <- "subjectID"
colnames(training_activity) <- "activityID"

## Read in test data
test_data <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep = "", header = FALSE)
test_subject <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", sep = "", header = FALSE)
test_activity <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", sep="", header = FALSE)

## Name the test data columns (Task 4)
colnames(test_data) = feature_name[,2]
colnames(test_subject) <- "subjectID"
colnames(test_activity) <- "activityID"

## Read in activity lables
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", sep = "",  header = FALSE)

## Name activity columns
colnames(activity_labels) <- c("activityID", "activitySubject")

## Task 1: Merge the Test and Traning data sets
merge_train <- cbind(training_activity, training_subject, training_data)
merge_test <- cbind(test_activity, test_subject, test_data)
merge_train_test <- rbind(merge_train, merge_test)

## Task 2: Extract only the measurements on the mean and Std Deviation for each measurement
colNamesForGrep <- colnames(merge_train_test)
colNamesMeanStd <- grepl("mean", colNamesForGrep)|grepl("std", colNamesForGrep)|grepl("activityID",colNamesForGrep)|grepl("subjectID", colNamesForGrep)
meansAndStd <- merge_train_test[, colNamesMeanStd == TRUE]

## Task 3: Use Descriptive activity names to name the activities in the data set
meansAndStdActivities <- merge(meansAndStd, activity_labels)

## Task 4: Appropriately label the data set with descriptive variable namse
# Accomplished above -- see the two comments and code near the top of the script - labeled Task 4 

## Task 5: Create a second, independent tidy data set with the average of each variable for each activity and subject
tidyData <- aggregate(. ~subjectID + activitySubject, meansAndStdActivities, FUN = "mean")

## Task 5, part 2 -- write the tidy data set to a file so it can be shared
write.table(tidyData,"tidyData.txt", row.names = FALSE)
