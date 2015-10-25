createSet <- function() {
  subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")  
  subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  #Uses descriptive activity names to name the activities in the data set
  activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  colnames(activityLabels) <- c("activity","activityName")
    
  dataTrain <- read.table("./UCI HAR Dataset/train/x_train.txt")  
  dataTest <- read.table("./UCI HAR Dataset/test/x_test.txt")
  
  dataActivityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")  
  dataActivityTest<- read.table("./UCI HAR Dataset/test/y_test.txt")
  
  #Appropriately labels the data set with descriptive variable names
  variableNames <- read.table("./UCI HAR Dataset/features.txt")
  
  subject <- c("subject")
  colnames(subjectTrain) <- subject
  colnames(subjectTest) <- subject
  
  colnames(dataTrain) <- variableNames[,2]
  colnames(dataTest) <- variableNames[,2]
  
  dataTrain <- cbind(subjectTrain, dataTrain)
  dataTest <- cbind(subjectTest, dataTest)

  #Uses descriptive activity names to name the activities in the data set
  activity <- c("activity")
  colnames(dataActivityTrain) <- activity
  colnames(dataActivityTest) <- activity
  
  dataTrain <- cbind(dataActivityTrain, dataTrain)
  dataTest <- cbind(dataActivityTest, dataTest)
  
  phase <- rep("TRAIN",nrow(dataTrain))
  dataTrain <- cbind(phase, dataTrain)
  
  phase <- rep("TEST", nrow(dataTest))
  dataTest <- cbind(phase, dataTest)
  #Merges the training and the test sets to create one data set
  dataTestTrain <- rbind(dataTest, dataTrain)
  
  dataTestTrainComplete <- merge(dataTestTrain,activityLabels, all = TRUE)
  
  #Extracts only the measurements on the mean and standard deviation for each measurement
  dataTestTrainComplete <- dataTestTrainComplete[,colnames(dataTestTrainComplete)[grep("phase|subject|activityName|std()|mean()",colnames(dataTestTrainComplete))]]
  
  #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  dataTestTrainTrans <- melt(dataTestTrainComplete, id.vars = c("phase","subject","activityName"))
  dataTestTrainSummary <- ddply(dataTestTrainTrans, .(phase,subject,activityName,variable), summarize , mean=mean(value))
  
  write.table(dataTestTrainSummary, file="./output.txt", row.names = FALSE)
}