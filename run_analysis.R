# Data should be extracted to a directory called 'data'
# setwd("~/Desktop/data_science/GettingData/course_project")

# read in data common to both train/test
features <- read.table('./data/features.txt')              # contains labels for the features in the data
activityTypes <- read.table('./data/activity_labels.txt')  # contains a mapping of an activity code to activity text

# Relabel the features and activity type dataframes
activityTypeLabels <- c('activityId', 'activityLabel')
featureLabels <- c('featureID', 'featureLabel')
colnames(activityTypes) <- activityTypeLabels
colnames(features) <- featureLabels

# read in training data
training_data <- read.table("./data/train/X_train.txt",header=FALSE)
training_subjectIDs <- read.table('./data/train/subject_train.txt') # contains the id of the subject who performed the activity 
training_activity <- read.table('./data/train/y_train.txt')
# read in test data
test_data <- read.table("./data/test/X_test.txt")
test_subjectIDs <- read.table('./data/test/subject_test.txt')
test_activity <- read.table('./data/test/y_test.txt')

# relabel the test and training dataframes
subjectIDLabels <- c('subjectID')
colnames(training_subjectIDs) <- subjectIDLabels
colnames(test_subjectIDs) <- subjectIDLabels
colnames(training_activity) <- "activityID"
colnames(test_activity) <- "activityID"
colnames(training_data) <- features[,2] 
colnames(test_data) <- features[,2]

# filter for mean and std
lv <- grepl("-mean\\(\\)|-std\\(\\)",features$featureLabel) # logical vector of matches
test_data <- test_data[lv==TRUE]
training_data <- training_data[lv==TRUE]

# construct the test/training data -- subject_id, features, test_activity code
test_data_complete <- cbind(test_subjectIDs, test_data, test_activity)
training_data_complete <- cbind(training_subjectIDs, training_data, training_activity)

# concatenate the training and test dataframes
final_data <- rbind(training_data_complete, test_data_complete)

# replace activity code with activity label text
final_data$activityID = factor(final_data$activityID, levels=c(1:6), labels=activityTypes$activityLabel)

# aggregate means for each feature by subject and activity type
tidy_dataset <- aggregate(final_data[,names(test_data)], by=list(subjectID=final_data$subjectID,activityID=final_data$activityID), FUN=mean)

# write the final tidy dataset to file
write.csv(tidy_dataset, file="tidy_data.csv", row.names=FALSE)
