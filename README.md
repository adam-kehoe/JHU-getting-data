Getting and Cleaning Data: Final Project
===================

# Overview

The run_analysis.R script works based on a few assumptions:

1. The data has been downloaded into a directory called 'data' in the same location as the script.
2. The current working directory has been set to the location of the script.

Sourcing the script will then run and output a file called 'tidy_data.csv'. This file will contain a tidy dataset containing the mean values for each feature, aggregated by the subject participant and the activity type.

The code book contains additional details.

## Step 1: Read common data

The first step loads data common to both the training and test datasets, and then relabels them for easier access.

## Step 2: Read the test and training data

The second step loads the raw data, subject IDs, and activity IDs for the test and training data.

Then, using the data from step 1, the primary data is relabeled using the more meaningful feature labels.

## Step 3: Filter for just mean and median columns

The next step is to use a regular expression to capture just the columns containing mean and standard deviation data. I create a logical vector
identifying which columns contain this data, and use it to filter the test and training data.

## Step 4: Assemble and concatenate the test and training data

The fourth step concatenates the subject IDs, the primary data, and the activity IDs by column for both the training and test data. Finally, the training and test datasets are concatenated by row. Additionally, the activity IDs are replaced with the actual activity label text for readability.

## Step 5: Aggregate features and write to file

The fifth step aggregates each column to its mean, grouped by subject ID and the activity type. The very last step is writing the final tidy dataset to a CSV file. Additionally, row names are suppressed to avoid inserting unneeded row numbers.



