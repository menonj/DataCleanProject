library('dplyr')
run_analysis<-function() {
  ## STEP 1: Combine training and test data into one data set
  ##
  ## Step 1a: read training x axis data into a data frame
  data_train_xdata<-read.table('./UCI HAR Dataset/train/X_train.txt')
  ## Step 1b: read test x axis data into a data frame
  data_test_xdata<-read.table('./UCI HAR Dataset/test/X_test.txt')
  ## Step 1c: Merge all x axis data into a single data frame using row binding
  mergedXData<-rbind(data_test_xdata, data_train_xdata)
  ## Step 1d: read training y axis data into a data frame
  data_train_ydata<-read.table('./UCI HAR Dataset/train/y_train.txt')
  ## Step 1e: read test y axis data into a data frame
  data_test_ydata<-read.table('./UCI HAR Dataset/test/y_test.txt')
  ## Step 1c: Merge all y axis data into a single data frame using row binding
  mergedYData<-rbind(data_test_ydata, data_train_ydata)
  
  ## STEP 2: Convert Y Axis data into descriptive activity names by converting activity numbers to names
  activityNames<-convertActivity(mergedYData)
  ## STEP 3: Convert all subjects in the Y axis to descriptive names
  #
  # Step 3a: read subject training data into a data frame
  data_train_subjects<-read.table('./UCI HAR Dataset/train/subject_train.txt')
  # Step 3b: read subject test data into a data frame
  data_test_subjects<-read.table('./UCI HAR Dataset/test/subject_test.txt')
  # Step 3c: rMerge all subject axis data into a single data frame using row binding
  data_subjects<-rbind(data_train_subjects, data_test_subjects)
  # Step 3d: Convert subject data into descriptive activity names by converting subject numbers to names
  subjects<-convertSubjects(data_subjects)

  # Merge all subjects and activities into the Y axis of the final data frame.
  finalDf<-data.frame(subjects, activityNames)
  
  # Give descriptive names to the columns of the final data frame.
  colnames(finalDf)<-c('Subject','Activity')

  # read all features of the activies into a DF  
  data_features<-read.table('./UCI HAR Dataset/features.txt')

  i = 0
  ii = 2
  # Iterate through all data features and extract those that pertain to MEAN and STD 
  for(ft in data_features[,2]) {
    i = i + 1
    # If the feature name contains 'MEAN' or 'STD' then append the column to the final data frame
    if((grepl('mean',tolower(ft))==TRUE) | (grepl('std',tolower(ft))==TRUE)){
      ii = ii + 1
      # use column binding to add the feature column
      finalDf<-cbind(finalDf, mergedXData[,i])
      # give the column the descriptive name of the feature.
      names(finalDf)[ii] <- ft
    }
  }

  # Group the data by subject and activity and calculate the mean of each column for each subject/activity  
  tidyData<-finalDf %>% group_by(Subject, Activity) %>% summarize_all(funs(mean))
  
  #return final data set. 180 observations (Subject/Activity combinations-5 activities * 30 subjects) of 88 mean and std features
  tidyData
}
convertActivity<-function(acts){
  inVect = acts[,1]
  outVect <- vector()
  i = 0
  for(n in inVect) {
    if(n == 1) {
      outVect<- c(outVect, 'WALKING')
    }
    else if(n == 2) {
      outVect<- c(outVect, 'WALKING_UPSTAIRS')
    }
    else if(n == 3) {
      outVect<- c(outVect, 'WALKING_DOWNSTAIRS')
    }
    else if(n == 4){
      outVect<- c(outVect, 'SITTING')
    }
    else if(n == 5){
      outVect<- c(outVect, 'STANDING')
    }
    else if(n == 6){
      outVect<- c(outVect, 'LAYING')
    }
    else {
      outVect <- c(outVect, 'INVALID')
    }
  }
  
  outVect
}
convertSubjects<-function(acts){
  
  inVect = acts[,1]
  outVect <- vector()
  i = 0
  for(n in inVect) {
    s<-paste('SUBJECT', n, sep='') 
    outVect<-c(outVect, s)
  }
  outVect
}