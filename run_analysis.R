if (!require("data.table")) {
        install.packages("data.table")
}

library(data.table)

## Before making the analysis the files need to be loaded, unzipped and be ready for reading.
getUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(getUrl, destfile = "Dataset.zip", method = "curl") ## For running on Windows machines the method parameter
##  should be skipped. So the command looks like: download.file(getUrl, destfile = "Dataset.zip")
unzip("Dataset.zip")
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt",header=F)
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=F)
Subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=F)
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header=F)
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header=F)
Subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=F)
Activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=F,colClasses="character")
Features <- read.table("./UCI HAR Dataset/features.txt",header=F,colClasses="character")

## 1. Merging test and training sets into one data set
Mergetest<-cbind(Xtest,Ytest)
Mergetests<-cbind(Mergetest,Subtest)
Mergetrain<-cbind(Xtrain,Ytrain)
Mergetrains<-cbind(Mergetrain,Subtrain)
AllMerge<-rbind(Mergetests,Mergetrains)

## 2. Extracting only the measurements on the mean and standard deviation for each measurement
selCols<-grep(".*-mean.*|.*-std.*", Features[,2])
Features2<-Features[selCols,]
selCols<-c(selCols,562,563)
AllMerge<-AllMerge[,selCols]

## 3. Using descriptive activity names to name the activities in the data set
AllMerge$V1.1<-factor(AllMerge$V1.1,levels=Activities$V1,labels=Activities$V2)

## 4. Labelling the data set with descriptive activity names appropriately
colnames(AllMerge)<-c(Features2$V2,"Activity","Subject")

## 5. Creating a second, independent tidy data set with the average of each variable for each
## activity and each subject from the data set in the point 4.
DT <- data.table(AllMerge)
tidyDS<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidyDS,file="tidyDS.txt",sep=",",row.names = F)
