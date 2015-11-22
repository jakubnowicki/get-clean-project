library(dplyr)
X_train <- read.table("X_train.txt", quote="\"", comment.char="")
y_train <- read.table("y_train.txt", quote="\"", comment.char="")
X_test <- read.table("X_test.txt", quote="\"", comment.char="")
y_test <- read.table("y_test.txt", quote="\"", comment.char="")
features <- read.table("features.txt", quote="\"", comment.char="")
activity_labels <- read.table("activity_labels.txt", quote="\"", comment.char="")
subject_train <- read.table("subject_train.txt", quote="\"", comment.char="")
subject_test <- read.table("subject_test.txt", quote="\"", comment.char="")
features$V2 <- as.character(features$V2)
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2
colnames(y_test) <- 'activityID'
colnames(y_train) <- 'activityID'
colnames(subject_test) <- 'subjectID'
colnames(subject_train) <- 'subjectID'
test <- cbind(y_test,subject_test,X_test)
train <- cbind(y_train,subject_train,X_train)
average.variables <- grep(features$V2,pattern = 'mean')
std.variables <- grep(features$V2,pattern = 'std')
tidy.data <- rbind(train,test)
slct <- sort(c(average.variables,std.variables))
tidy.data <- tidy.data[,c(1,2,slct+2)]
freq <- grep('Freq',names(tidy.data))
tidy.data <- tidy.data[,-(freq+2)]
for (i in 1:length(activity_labels$V1)) {
    tidy.data$activityID <- gsub(pattern = activity_labels$V1[i],replacement = activity_labels$V2[i],
                             x = tidy.data$activityID) }
tidy.data$activityID <- as.factor(tidy.data$activityID)
tidy.data$subjectID <- as.factor(tidy.data$subjectID)
group_by(tidy.data,subjectID,activityID) %>% summarise_each('mean') -> grouped.data
write.table(x = grouped.data,file = 'grouped_data.txt',row.names = F)
