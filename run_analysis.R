dateDownloadedStart <- Sys.time()
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = fileUrl, destfile = "UCI HAR Dataset.zip")
# used Sys.time() instead of date() to include local timezone;
dateDownloadedFinish <- Sys.time()
unzip(zipfile = "UCI HAR Dataset.zip") #in right directory

# 4. Appropriately label the data set with descriptive variable names. 
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[[2]]

# 561-feature vector with time and frequency domain variables
# for each of the 7352 training observations
# (Without setting numerals, the data does lose some precision.)
train_X <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features)
# activity label for each of the 7352 training observations
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
# identifier of the subject who carried out the experiment
# for each of the 7352 training observations
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
train <- cbind(train_X, train_y, train_subject)

# 561-feature vector with time and frequency domain variables
# for each of the 2947 test observations
test_X <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features)
# Activity label for each of the 2947 test observations
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
# Identifier of the subject who carried out the experiment
# for each of the 2947 test observations
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
test <- cbind(test_X, test_y, test_subject)

# 1. Merge the training and the test sets to create one data set.
data <- rbind(train, test)

# 3. Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)[[2]]
data$Activity <- factor(data$Activity, labels = activity_labels)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# data <- data[["mean", exact = FALSE]]
dataExtract <- data[c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 294, 295, 296, 345, 346, 347, 348, 349, 350, 373, 374, 375, 424, 425, 426, 427, 428, 429, 452, 453, 454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552, 562, 563)]

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
dataMelt <- melt(data_extract, id.vars = c("Activity", "Subject"))
dataTidy <- dcast(dataMelt, Activity + Subject ~ variable, mean)

write.table(dataTidy, "dataTidy.txt", row.names = FALSE)