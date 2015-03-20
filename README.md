# Getting-and-Cleaning-Data

This repo contains the following file :

  1. CODEBOOK.md    : Contains information of the dataset and the procedure taken to cleanup the data
  2. run_analysis.R : The script to excuted to clean the data. This script output a text file "tidied_data.txt"
  3. tided_data.txt : Output of the data cleanup process. This file can be reproduce by excuting run_analysis.R
  
# Changing the dataset path directory
In line 12 of run_analysis.R . Change the directory to the folder which contains the folder UCI HAR Dataset

Current default 
  > setwd("C:\\\Users\\\Class 3")

UCI HAR Dataset folder is obtained by unzipping the file downloaded from 
  > https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Project Objective

You should create one R script called run_analysis.R that does the following. 
  1. Merges the training and the test sets to create one data set. 
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set 
  4. Appropriately labels the data set with descriptive activity names. 
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Additional Information

Information on the variable description and the step take to cleanup the data can be obtained from CODEBOOK.md
