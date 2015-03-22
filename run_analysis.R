## read features and activity labels
features <- read.table("UCI HAR Dataset/features.txt");
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt");

##
## reading test data
y_test <- read.table("UCI HAR Dataset/test/y_test.txt");
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt");
x_test <- read.table("UCI HAR Dataset/test/X_test.txt");

####### Reading training data
y_train <- read.table("UCI HAR Dataset/train/y_train.txt");
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt");
x_train <- read.table("UCI HAR Dataset/train/X_train.txt");

## Merges the training and the test sets
overall_X <- rbind(x_train, x_test);
overall_subject <- rbind(train_subject, test_subject);
overall_Y <- rbind(y_train, y_test);

## Looking up the name of activity for test data
overall_Y[,2] <- activity_labels[match(overall_Y$V1, activity_labels$V1), 2, drop=F];

## labeling the data set name
## Assign column names to test set using feature data
colnames(overall_X) <- features$V2

## Assign column name to subject
colnames(overall_subject) <- "subject";

## Assign column name to activity
colnames(overall_Y) <-  c("activity_id", "activity");

## extract only the measurements on the mean and std deviation for each measurement.
std_mean_features <- grep("mean|std", features$V2, ignore_case=TRUE);

std_meanOnly_overall_X <- overall_X[, std_mean_features];

## Making column names more readable
improved_labels <- sapply(std_mean_feature, function(x) {gsub('[-(),]+','_', x)});
colnames(std_meanOnly_overall_X) <- improved_labels;

## combine data
overall_records <- cbind(overall_Y, oveall_subject);
overall_records <- cbind(overall_records, std_meanOnly_overall_X);

## Create a second, independent tidy data set with the average of each variables for each activity and each subject
tidy <- aggregate(. ~ subject+activity, data=overall_records, FUN=mean);
write.table(tidy, "tidy.txt", row.names=FALSE);
