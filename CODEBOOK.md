Project: Coursera Getting and Cleaning Data by JHU

Introduction:
The purpose of this code is to take normalized and separted data and aggregate it all into a tidy data set ready for analysis.

Data Condition:
The data was presented as data separated into multiple files for use as training and testing data for machine learning. The data are separated into:
  1. X axis files (X axis file for test data (X_test.txt) and X axis file for training data (X_train.txt)) 
  2. Y axis files (Y axis file for test data (Y_test.txt) and Y axis file for training data (Y_train.txt))

The X axis files shows 561 columns of data
The Y axis files shows a number that indicates the activity, by number, that the subject was conducting. there is a related file subject_test.txt and subject_train.txt, which is an additonal Y axis file that shows the subject that engaged in the activity. 

Data Prep:
1. The X axis files are combined by rows to to create a dataset of 10299 rows and 561 columns.
2. The Y axis filea are combined to determine subject and activity of each of the 10299 rows.
3. Activities are translated using the activity_label.txt file which maps the activity number to activity label.
4. Using the features.txt file, the 561 columns are translated into descriptive column names.
5. Using the column names, only the MEAN and STANDARD DEVIATION values are included in the final data frame.
6. The final result summarizes the 10299 rows into mean values by subject and activity.  The final result is 180 rows (30 subjects doing 5 activites) showing the mean values for 86 mean and standard deviation features.

How to run:
1. set the working directory using setwd() and pass in the directory containing the run_analysis.r script and the unzipped data file (UCI HAR Dataset).
2. ensure to install the dplyr library using install.packages('dplyr')
3. run script run_analysis() with no arguements and assign it to a variable:
    finalDf<-run_analysis()
4. The returned data frame will contian the following result in head:

   Subject Activity `tBodyAcc-mean(… `tBodyAcc-mean(… `tBodyAcc-mean(… `tBodyAcc-std()… `tBodyAcc-std()…
   <fct>   <fct>               <dbl>            <dbl>            <dbl>            <dbl>            <dbl>
 1 SUBJEC… LAYING              0.281         -0.0182           -0.107           -0.974           -0.980 
 2 SUBJEC… SITTING             0.276         -0.0131           -0.110           -0.987           -0.949 
 3 SUBJEC… STANDING            0.278         -0.0173           -0.104           -0.985           -0.936 
 4 SUBJEC… WALKING             0.276         -0.0186           -0.106           -0.424           -0.0781
 5 SUBJEC… WALKING…            0.278         -0.0227           -0.117            0.0464           0.263 
 6 SUBJEC… WALKING…            0.247         -0.0214           -0.153           -0.304            0.108 
 7 SUBJEC… LAYING              0.253         -0.0170           -0.105           -0.943           -0.874 
 8 SUBJEC… SITTING             0.257         -0.00664          -0.0952          -0.983           -0.956 
 9 SUBJEC… STANDING            0.280         -0.0162           -0.111           -0.994           -0.952 
10 SUBJEC… WALKING             0.276         -0.0172           -0.104           -0.530           -0.155 

5. The dimensions of the final data frame:
>dim(df)
[1] 188 88
