
#1.Merges the training and the test sets to create one data set

##download and unzip the data
if(!file.exists("./data"))
{
  dir.create("./data");
}
fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
download.file(fileUrl, destfile = "./data/ProjectData.zip");
unzip("./data/ProjectData.zip",exdir="./data");

##read the data
trainx=read.table("./data/UCI HAR Dataset/train/X_train.txt");
trainy=read.table("./data/UCI HAR Dataset/train/y_train.txt");
trainsub=read.table("./data/UCI HAR Dataset/train/subject_train.txt");
testx=read.table("./data/UCI HAR Dataset/test/X_test.txt");
testy=read.table("./data/UCI HAR Dataset/test/y_test.txt");
testsub=read.table("./data/UCI HAR Dataset/test/subject_test.txt");

##merge the data sets
traindata=cbind(trainsub,trainy,trainx);
testdata=cbind(testsub,testy,testx);
alldata=rbind(traindata,testdata);


#2.Extracts only the measurements on the mean and standard deviation for each measurement

##read the features
features=read.table("./data/UCI HAR Dataset/features.txt",stringsAsFactors=F);
features=features[,2];

##extract mean and std
meanstdindex=grep("mean\\(\\)|std\\(\\)",features);
newdata=alldata[,c(1,2,meanstdindex+2)];


#3.Uses descriptive activity names to name the activities in the data set

##read the activities
activities=read.table("./data/UCI HAR Dataset/activity_labels.txt");

##replace 1-6 with activity names
newdata[,2]=factor(newdata[,2],levels=activities[,1],labels=activities[,2]);


#4.Appropriately labels the data set with descriptive variable names

##name the data set
colnames(newdata)=c("subject","activity",features[meanstdindex])

##refine the names of the data set
names(newdata)=gsub("^t","TimeDomain-",names(newdata));
names(newdata)=gsub("^f","FrequenceDomain-",names(newdata));
names(newdata)=gsub("mean\\(\\)","Mean",names(newdata));
names(newdata)=gsub("std\\(\\)","Std",names(newdata));


#5.Creates a tidy data set with the average of each variable for each activity and each subject

##create a second data set
library(dplyr);
seconddata=newdata%>%group_by(subject,activity)%>%summarise_all(mean);

##write the new data set
write.table(seconddata,"./data_in_step5.txt",row.name=FALSE);



