library(reshape2)

unzip("UCI_HAR_DATASET.zip")

test.data <- read.table("./UCI HAR Dataset/test/X_test.txt")
train.data <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Combine test and train data into one set
combined.data <- rbind(train.data, test.data)
rm(test.data, train.data)

# Get the mean and std variables
features <- read.table("./UCI HAR Dataset/features.txt", colClasses=c("integer", "character"))
mean.or.std <- grepl("(mean\\(|std\\()", features$V2)
combined.data <- combined.data[,mean.or.std]

# Add column names, obtained from the features data
clean.features <- gsub("\\-", ".", features$V2)
clean.features <- gsub("\\(\\)", "", clean.features)
colnames(combined.data) <- clean.features[mean.or.std]

# Get the activity data, convert it to it's more readable descriptions
test.activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
train.activity <- read.table("./UCI HAR Dataset/train/y_train.txt")

activity <- rbind(train.activity, test.activity)

activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses=c("integer", "character"))
activity <- factor(activity.labels[activity$V1, "V2"], activity.labels$V2)
combined.data <- cbind(activity, combined.data)

# Get the test subjects
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(train.subject, test.subject)
colnames(subject) <- "subject"

combined.data <- cbind(combined.data, subject)

# Summarize our data into means for each variable, activity, and subject
melted.data <- melt(combined.data, id.vars=c("activity", "subject"))
means <- dcast(melted.data, activity + subject ~ variable, mean)

write.table(means, "ActivityData.txt")