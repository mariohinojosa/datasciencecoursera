
##Step 1: load required data which consists of: 
## a. test and train set (subject, activity reference and signal)
## b. features.txt file
## c. activity labels
## NOTE: R script assumes that the folder containing all the information
## was unzipped and stored in the working directory
wd <- getwd()
testSubData <- read.table(paste(wd,"/","UCI HAR Dataset/test/subject_test.txt",sep=""))
testActData <- read.table(paste(wd,"/","UCI HAR Dataset/test/y_test.txt",sep=""))
testSignalData <- read.table(paste(wd,"/","UCI HAR Dataset/test/X_test.txt",sep="")) 
trainSubData <- read.table(paste(wd,"/","UCI HAR Dataset/train/subject_train.txt",sep=""))
trainActData <- read.table(paste(wd,"/","UCI HAR Dataset/train/y_train.txt",sep=""))
trainSignalData <- read.table(paste(wd,"/","UCI HAR Dataset/train/X_train.txt",sep=""))
featData <- read.table(paste(wd,"/","UCI HAR Dataset/features.txt",sep=""))
actLabelData <- read.table(paste(wd,"/","UCI HAR Dataset/activity_labels.txt",sep=""))

##Step 2: combine data frames, first by same type (e.g. test subject data with train subject data)
## and then binding them by column
allSubData <- c(testSubData, trainSubData)
allSubData <- as.vector(unlist(allSubData))
allTestData <- c(testActData, trainActData)
allTestData <- as.vector(unlist(allTestData))
allSignalData <- rbind(testSignalData, trainSignalData)
newDataSet <- cbind(allSubData, allTestData, allSignalData)

##Step 3: add names to the new data set
featData2 <- as.character(featData[,2])
nameFeat <- c("subject", "activity", featData2)
names(newDataSet) <- nameFeat

##Step 4: select only those variables which measured mean() and std() [no meanFreq() or similar]
goodVars <- sort(c(grep("mean()", nameFeat, fixed=TRUE), grep("std()", nameFeat, fixed=TRUE)))
newDataSet <- newDataSet[, c(1:2,goodVars)]

##Step 5: replace number description in activity variable for words
newDataSet$activity <- factor(newDataSet$activity, levels=1:6, labels=c("walk","walkUp","walkDown","sit","stand","lay"))

##Step 6: Create a second, independent tidy data set which
## calculates the average values for each variable in the newDataSet by subject by activity
tidyDataSet <- aggregate(newDataSet[,-(1:2)],list(subject=newDataSet$subject,activity=newDataSet$activity),mean)
tidyDataSet <- tidyDataSet[order(tidyDataSet$subject,tidyDataSet$activity),]

##Step 7: export data frame to csv file
write.table(tidyDataSet, "tidyDataSet.txt", row.names=FALSE)
