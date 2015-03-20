# Getting and Cleaning Data Course Project

Data Source: 
==
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of Data : 
==
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Description of Relevant Files Used
==
>File path :  ./UCI HAR Dataset
>- 'features.txt': List of all features.
>- 'activity_labels.txt': Links the class labels with their activity name.

>File path :  ./UCI HAR Dataset/train or ./UCI HAR Dataset/test
>- 'subject_train.txt': Each row identifies the subject who performed the activity for  each window sample. Its range is from 1 to 30. 
>- 'X_train.txt': Training set.
>- 'y_train.txt': Training labels.
>- 'X_test.txt': Test set.
>- 'y_test.txt': Test labels.

#Data Cleanup Description

The following section contains the variable description and the procedure excuted to cleanup the dataset.

Part 1. Merging training data and test data to create a single dataset
==
Data in all files are read and stored into the following variable
  1. features - Stores the data in features.txt
  2. activity_labels - Stores the activiy data in activity_labels.txt
      a. Column Names : "activity_ID" , "activity_description"
  3. subject_train - Stores the data in subject_train.txt
      Column Names : "subject_id"
  4. subject_test  - Stores the data in subject_test.txt
      Column Names : "subject_id"
  5. x_test  = Stores the data in X_test.txt
      Column Names : Descriptive data in variable features
  6. y_test  = Stores the data in  y_test.txt
      Columns Name : "activity"
  7. x_train = Stores the data in  X_train.txt
      Columns Name : Descriptive data in variable features
  8. y_train = Stores the data in  y_train.txt
      Column Names : "activity"
  9. merged_test_data - Column bind the all test data in the following sequence (subject_test,y_test,x_test)
  10.merged_train_data - Column bind the all train data in the following sequence (subject_train,y_train,x_train)
  11.final_dataset - Row bind merged_test_data and merged_train_data

Part 2. Extracts only the measurements on the mean and standard deviation for each measurement
==
    
    1. dataset_columns - Extract all column name in the final_dataset
    2. interested_features - Extract column with name containing -mean() and -std() , column for activity & subject_id is retained
    3. data_of_interest - Stores a data subset of final dataset which matches interested_features
Part 3. Uses descriptive activity names to name the activities in the data set.
==
    1. "activity_id" column in data_on_interest is replaced with their descriptive content in activity_labels.txt
    
Part 4. Appropriately labels the data set with descriptive variable names. 
==
    1. Replacement of abbreviation in column names
    
Part 5.From the data set in part 3, creates a second, independent tidy data set with the average 
==
    1. averaged_data : Stores e average measurement for each activity and each subject.
    2. averaged_data is written into a file tidied_data.txt
	

#Additional information can be found in the commented script run_analysis.R
#Information for executing run_analysis.R can be found in README.md


    
    






