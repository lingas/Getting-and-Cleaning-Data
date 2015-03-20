
# Part 1.You should create one R script called run_analysis.R that does the following :
# Part 2.Merges the training and the test sets to create one data set.
# Part 3.Extracts only the measurements on the mean and standard deviation for each measurement. 
# Part 4.Uses descriptive activity names to name the activities in the data set.
# Part 5.Appropriately labels the data set with descriptive variable names. 
# Part 6.From the data set in step 4, creates a second, independent tidy data set with the average 
#        variable for each activity and each subject.

library(plyr);

# Change this to set your working directory to the folder containing the UCI HAR Dataset folder
setwd("C:\\Users\\Class 3")

# Read all relevant files

features = read.table("./UCI HAR Dataset/features.txt", header=FALSE)

activity_labels = read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)

# Read subject data
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test  = read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Read test data
x_test  = read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test  = read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)

# Read train(training) data
x_train = read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train = read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)

# Label the columns
names(activities) = c ("activity_ID" , "activity_description")

names(x_test) = features[,2]
names(x_train) = features[,2]

names(y_test) ="activity"
names(y_train) = "activity"

names(subject_train)="subject_id"
names(subject_test)="subject_id"

merged_test_data = cbind(subject_test,y_test,x_test);
merged_train_data = cbind(subject_train,y_train,x_train);

# Part 2.Merges the training and the test sets to create one data set.
# One single dataset with columns name : subject_id , activity , followed by accelerometer and gyroscope data columns
final_dataset = rbind(merged_test_data,merged_train_data);

#####################################################################

# Get columns description
dataset_columns = names(final_dataset)

# Perform pattern matching to find data with field of interest (mean and standard deviation) and to keep activity and subject columns
interested_features = grep("activity|subject_id|mean\\(\\)|std\\(\\)", dataset_columns)

# Part 3.Extracts only the measurements on the mean and standard deviation for each measurement. 
# Extract columns with mean() and std() description 
data_of_interest = final_dataset[,interested_features]

#####################################################################

# Part 4.Uses descriptive activity names to name the activities in the data set.
# Column name for subject and activity have been reanamed when file is first read

# Replace activity id with activity description
data_of_interest[, 2] <- activity_labels[data_of_interest[, 2], 2]

#####################################################################

# Part 5.Appropriately labels the data set with descriptive variable names. 

# Replace abbreviation with descriptive text
names(data_of_interest)<-gsub("^t", "time", names(data_of_interest))
names(data_of_interest)<-gsub("^f", "frequency", names(data_of_interest))
names(data_of_interest)<-gsub("Acc", "Accelerometer", names(data_of_interest))
names(data_of_interest)<-gsub("Gyro", "Gyroscope", names(data_of_interest))
names(data_of_interest)<-gsub("Mag", "Magnitude", names(data_of_interest))
names(data_of_interest)<-gsub("BodyBody", "Body", names(data_of_interest))
names(data_of_interest)<-gsub("-mean", "Mean", names(data_of_interest))
names(data_of_interest)<-gsub("-std", "StandardDeviation", names(data_of_interest))

#####################################################################

# Part 6.From the data set in step 4, creates a second, independent tidy data set with the average 
#        variable for each activity and each subject.
averaged_data = aggregate(. ~subject_id + activity, data_of_interest, mean)
write.table(averaged_data, file = "tidied_data.txt",row.name=FALSE)
