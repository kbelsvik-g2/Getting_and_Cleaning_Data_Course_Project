test.data <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Examine size of test data
dim(test.data)

train.data <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Examine size of train data
dim(train.data)

# Combine test and train data into one set
combined.data <- rbind(train.data, test.data)


# Examine the size of the combined data
dim(combined.data)

# Delete the separate test and train data.frames
rm(test.data, train.data)

# Read in the column names
features <- read.table("./UCI HAR Dataset/features.txt", colClasses=c("integer", "character"))

# Examine the features table
dim(features)
head(features, 10)

# Find the ones that measure either mean or standard deviation
mean.or.std <- grepl("(mean\\(|std\\()", features$V2)

# Examine selected features
head(features$V2[mean.or.std])

# Keep only that columns that measure the mean or standard deviation
combined.data <- combined.data[,mean.or.std]

# Check size of new data
dim(combined.data)

# Add column names, obtained from the features data
colnames(combined.data) <- features$V2[mean.or.std]

test.activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
train.activity <- read.table("./UCI HAR Dataset/train/y_train.txt")

activity <- rbind(train.activity, test.activity)

activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses=c("integer", "character"))
activity <- factor(activity.labels[activity$V1, "V2"], activity.labels$V2)
combined.data <- cbind(activity, combined.data)

test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(train.subject, test.subject)
colnames(subject) <- "subject"

combined.data <- cbind(combined.data, subject)

colnames(combined.data)


melted.data <- melt(combined.data, id.vars=c("activity", "subject"))

means <- dcast(melted.data, activity + subject ~ variable, mean)