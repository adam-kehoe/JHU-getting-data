Codebook
=========================

## The Data

The (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)[source data] comes from the UCI Machine Learning Repository.

Here is the UCI Machine Learning Repository data summary:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables

Each row in the dataset contains a subject ID and an activity ID. The subject ID is a unique identifier for each study participant. The activityID is a text string that identifies the type of activity (ex: walking). The remaining columns indicate the means for each measurement type.

## Run_analysis.R

The steps taken in the data handling script are described in the readme file, and repeated here.

### Step 1: Read common data

The first step loads data common to both the training and test datasets, and then relabels them with more meaning labels.

### Step 2: Read the test and training data

The second step loads the raw data, subject IDs, and activity IDs for the test and training data.

Then, using the common data, the primary data is relabeled using the more meaningful feature labels.

### Step 3: Filter for just mean and median columns

The next step is to use a regular expression to capture just the columns containing mean and standard deviation data. I create a logical vector
identifying which columns contain this data, and use it to filter the test and training data.

### Step 4: Assemble and concatenate the test and training data

The fourth step concatenates the subject IDs, the primary data, and the activity IDs by column for both the training and test data. Finally, the training and test datasets are concatenated by row. Additionally, the activity IDs are replaced with the actual activity label text for readability.

### Step 5: Aggregate features and write to file

The fifth step aggregates each column to its mean, grouped by subject ID and the activity type. The very last step is writing the final tidy dataset to a CSV file. Additionally, row names are suppressed to avoid inserting unneeded row numbers.





