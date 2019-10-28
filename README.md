# DataCleanProject
Coursera Getting and Cleaning Data Project

Main Script: run_analysis.R


Subjects: 30
Activities: 5 (STANDING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, LAYING)
How to Run Script: run_analysis() at prompt
Returns: Data Frame 180 observations (5 * 30) with 86 features.

## STEP 1: Combine training and test data into one data set
##
## Step 1a: read training x axis data into a data frame
## Step 1b: read test x axis data into a data frame
## Step 1c: Merge all x axis data into a single data frame using row binding
## Step 1d: read training y axis data into a data frame
## Step 1e: read test y axis data into a data frame
## Step 1c: Merge all y axis data into a single data frame using row binding
#
## STEP 2: Convert Y Axis data into descriptive activity names by converting activity numbers to names
#
## STEP 3: Convert all subjects in the Y axis to descriptive names
#
# Step 3a: read subject training data into a data frame
# Step 3b: read subject test data into a data frame
# Step 3c: rMerge all subject axis data into a single data frame using row binding
# Step 3d: Convert subject data into descriptive activity names by converting subject numbers to names
#
# Merge all subjects and activities into the Y axis of the final data frame.
# Give descriptive names to the columns of the final data frame.
# Iterate through all data features and extract those that pertain to MEAN and STD 
# Group the data by subject and activity and calculate the mean of each column for each subject/activity  
#return final data set. 180 observations (Subject/Activity combinations-5 activities * 30 subjects) of 86 mean #and std features
