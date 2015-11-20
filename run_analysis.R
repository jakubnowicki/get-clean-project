X_train <- read.table("X_train.txt", quote="\"", comment.char="")
y_train <- read.table("y_train.txt", quote="\"", comment.char="")
X_test <- read.table("X_test.txt", quote="\"", comment.char="")
y_test <- read.table("y_test.txt", quote="\"", comment.char="")
features <- read.table("features.txt", quote="\"", comment.char="")
features$V2 <- as.character(features$V2)
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2
colnames(y_test) <- 'activityID'
colnames(y_train) <- 'activityID'
test <- cbind(y_test,X_test)
train <- cbind(y_train,X_train)
