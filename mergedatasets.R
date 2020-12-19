#this function merges our test/train datasets
mergedatasets <- function(destination=getwd()){
        library(dplyr)
        #create required paths
        stest_url<-paste(destination,'/test/subject_test.txt',sep = '')
        xtest_url<-paste(destination,'/test/X_test.txt',sep = '')
        ytest_url<-paste(destination,'/test/y_test.txt',sep = '')
        strain_url<-paste(destination,'/train/subject_train.txt',sep = '')
        xtrain_url<-paste(destination,'/train/X_train.txt',sep = '')
        ytrain_url<-paste(destination,'/train/y_train.txt',sep = '')
        activity_url<-paste(destination,'/activity_labels.txt',sep = '')
        features_url<-paste(destination,'/features.txt',sep = '')
        #read data
        stest<-read.table(stest_url)
        xtest<-read.table(xtest_url)
        ytest<-read.table(ytest_url)
        strain<-read.table(strain_url)
        xtrain<-read.table(xtrain_url)
        ytrain<-read.table(ytrain_url)
        activity<<-read.table(activity_url)
        features<-read.table(features_url)
        #join test and train sets for x
        x<-rbind(xtrain,xtest)
        #name columns of x
        names(x)<-features[,2]
        #join all data
        dataset_merged<<-cbind(x,rbind(ytrain,ytest),rbind(strain,stest))
        #rename y and subject column correctly
        names(dataset_merged)[562]<<-'y'
        names(dataset_merged)[563]<<-'subject'
        #replace activity numbers with actual names
        for (i in 1:6) {
                dataset_merged$subject<<-gsub(activity[i,1],activity[i,2],dataset_merged$subject)     
        }
}