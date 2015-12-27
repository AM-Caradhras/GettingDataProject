#Project Code Book
##Details on variables, data, and any transformations or work performed to clean up the data


**List of Variables**

1.	Activity
2.	Subject
3.	tBodyAcc.mean...X
4.	tBodyAcc.mean...Y
5.	tBodyAcc.mean...Z
6.	tGravityAcc.mean...X
7.	tGravityAcc.mean...Y
8.	tGravityAcc.mean...Z
9.	tBodyAccJerk.mean...X
10.	tBodyAccJerk.mean...Y
11.	tBodyAccJerk.mean...Z
12.	tBodyGyro.mean...X
13.	tBodyGyro.mean...Y
14.	tBodyGyro.mean...Z
15.	tBodyGyroJerk.mean...X
16.	tBodyGyroJerk.mean...Y
17.	tBodyGyroJerk.mean...Z
18.	tBodyAccMag.mean..
19.	tGravityAccMag.mean..
20.	tBodyAccJerkMag.mean..
21.	tBodyGyroMag.mean..
22.	tBodyGyroJerkMag.mean..
23.	fBodyAcc.mean...X
24.	fBodyAcc.mean...Y
25.	fBodyAcc.mean...Z
26.	fBodyAcc.meanFreq...X
27.	fBodyAcc.meanFreq...Y
28.	fBodyAcc.meanFreq...Z
29.	fBodyAccJerk.mean...X
30.	fBodyAccJerk.mean...Y
31.	fBodyAccJerk.mean...Z
32.	fBodyAccJerk.meanFreq...X
33.	fBodyAccJerk.meanFreq...Y
34.	fBodyAccJerk.meanFreq...Z
35.	fBodyGyro.mean...X
36.	fBodyGyro.mean...Y
37.	fBodyGyro.mean...Z
38.	fBodyGyro.meanFreq...X
39.	fBodyGyro.meanFreq...Y
40.	fBodyGyro.meanFreq...Z
41.	fBodyAccMag.mean..
42.	fBodyAccMag.meanFreq..
43.	fBodyBodyAccJerkMag.mean..
44.	fBodyBodyAccJerkMag.meanFreq..
45.	fBodyBodyGyroMag.mean..
46.	fBodyBodyGyroMag.meanFreq..
47.	fBodyBodyGyroJerkMag.mean..
48.	fBodyBodyGyroJerkMag.meanFreq..
49.	angle.tBodyAccMean.gravity.
50.	angle.tBodyAccJerkMean..gravityMean.
51.	angle.tBodyGyroMean.gravityMean.
52.	angle.tBodyGyroJerkMean.gravityMean.
53.	angle.X.gravityMean.
54.	angle.Y.gravityMean.
55.	angle.Z.gravityMean.
56.	tBodyAcc.std...X
57.	tBodyAcc.std...Y
58.	tBodyAcc.std...Z
59.	tGravityAcc.std...X
60.	tGravityAcc.std...Y
61.	tGravityAcc.std...Z
62.	tBodyAccJerk.std...X
63.	tBodyAccJerk.std...Y
64.	tBodyAccJerk.std...Z
65.	tBodyGyro.std...X
66.	tBodyGyro.std...Y
67.	tBodyGyro.std...Z
68.	tBodyGyroJerk.std...X
69.	tBodyGyroJerk.std...Y
70.	tBodyGyroJerk.std...Z
71.	tBodyAccMag.std..
72.	tGravityAccMag.std..
73.	tBodyAccJerkMag.std..
74.	tBodyGyroMag.std..
75.	tBodyGyroJerkMag.std..
76.	fBodyAcc.std...X
77.	fBodyAcc.std...Y
78.	fBodyAcc.std...Z
79.	fBodyAccJerk.std...X
80.	fBodyAccJerk.std...Y
81.	fBodyAccJerk.std...Z
82.	fBodyGyro.std...X
83.	fBodyGyro.std...Y
84.	fBodyGyro.std...Z
85.	fBodyAccMag.std..
86.	fBodyBodyAccJerkMag.std..
87.	fBodyBodyGyroMag.std..
88.	fBodyBodyGyroJerkMag.std..


**Work to clean and transform the data

Step 1: Load the following data sets in R
  
  * X_test.txt
  * Y_test.txt
  * subject_test.txt
  * X_train.txt
  * Y_train.txt
  * subject_train.txt
  * features.txt
  * activity_labels.txt
  
Step 2: Transform variable names into syntactically valid names using make.names()

Step 3: Substitute the non-descript variable names in main data sets with descriptive variable names originally specified in features.txt and adjusted in step 2

Step 4: Add two variables in main data sets containing subjects info and test labels -- using mutate() 

Step 5: Merge the two main data sets by appending the Train data to the Test data set with rbind()

Step 6: Keep only the measurements on the mean and standard deviation, i.e. keep only the variables which names contain "mean" or "std", along with the variables "Subject" and "TestLabels" -- This is done by combining select() with contains()

Step 7: Create a new variable "Activity" in the main data set that will contain the descriptive activity names. Populate the column by using the match function and attach the names originally contained in activity_labels.txt to the records based on the id numbers in "TestLabels"

Step 8: Create new tidy data set with the average of each variable for each activity and each subject -- Use data.table package to aggregate the main data set by Activity and Subject

Step 9: Sort the data in the new data set by Activity and Subject

Step 10: Save the new tidy data set as txt file






