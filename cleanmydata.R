#this function cleans our data and returns a table of all means for activities
cleanmydata<-function(){
        #produce dataset_merged
        mergedatasets()
        #select desired names which include only std and mean values
        desired_columns<-grep('*mean*|*std*',names(dataset_merged),value = TRUE)
        #select desired columns
        cleaned_data<<-select(dataset_merged,all_of(c(desired_columns,'subject')))
        #edit column names into standard format
        names(cleaned_data)<<-cleannames(names(cleaned_data))
        #calculate mean of all variables for different activities
        meanofwalking<-colMeans(filter(cleaned_data,cleaned_data$activity=='WALKING')[,1:79])
        meanofwalking_upstairs<-colMeans(filter(cleaned_data,cleaned_data$activity=='WALKING_UPSTAIRS')[,1:79])
        meanofwalking_downstairs<-colMeans(filter(cleaned_data,cleaned_data$activity=='WALKING_DOWNSTAIRS')[,1:79])
        meanofsitting<-colMeans(filter(cleaned_data,cleaned_data$activity=='SITTING')[,1:79])
        meanofstanding<-colMeans(filter(cleaned_data,cleaned_data$activity=='STANDING')[,1:79])
        meanoflaying<-colMeans(filter(cleaned_data,cleaned_data$activity=='LAYING')[,1:79])
        #join the results in one table
        meanofdata<<-rbind(meanofwalking,meanofwalking_upstairs,meanofwalking_downstairs,meanofsitting,meanofstanding,meanoflaying)
        meanofdata
}
