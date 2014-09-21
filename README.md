The script
"run_analysis.R"
automatically downloads the data from
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
unzips it, and performs the following steps.
The final analysis is output to a file called
"dataTidy.txt"

For all 7352 training observations,
I extended the set "train/X_train.txt" with 561 variables
with the activity labels from "train/y_train.txt"
and the subject ID from "train/subject_train.txt"
For all 2947 test observations,
I extended the set "test/X_test.txt" with 561 variables
with the activity labels from "test/y_test.txt"
and the subject ID from "train/subject_test.txt"
I then merged the training and the test sets to create one data set.

I extracted only the measurements on the mean and standard deviation for each measurement.
For each measurement, these consist of all features in "features.txt"
that contain the words "mean" or "sd",
EXCEPT for
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)
since those are angles based on mean values, but they are not mean values themselves.

I used the descriptive activity names in "activity_labels.txt" to name the activities in the data set:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

I appropriately labelled the data set with the descriptive variable names taken from
UCI HAR Dataset/features.txt

I created a second, independent tidy data set with the average of each variable for each activity and each subject

---
This dataset is described in

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For more information about this dataset contact: activityrecognition@smartlab.ws