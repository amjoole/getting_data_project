#this function will automatically change all names of variables into
#the standard/tidy form.
cleannames <- function(names){
        library(stringr)
        #change t to time in the beginning of names
        names<-gsub('^t','timedomainsignal',names)
        #change f to frequency in the beginning of names
        names<-gsub('^f','frequencydomainsignal',names)
        #avoid unnecessary repetition 
        names<-gsub('BodyBody','body',names)
        #adding useful information to variable name
        names<-gsub('AccJerk','linearaccelerationderivedintime',names)
        #adding useful information to variable name
        names<-gsub('GyroJerk','angularvelocityderivedintime',names)
        #substituting abbreviation with original word 
        names<-gsub('Acc','acceleration',names)
        #substituting abbreviation with original word
        names<-gsub('Mag','magnitude',names)
        #adding useful information to variable name
        names<-gsub('X','directionx',names)
        #adding useful information to variable name
        names<-gsub('Y','directiony',names)
        #adding useful information to variable name
        names<-gsub('Z','directionz',names)
        #substituting abbreviation with original word
        names<-gsub('std','standard',names)
        #removing unnecessary signs
        names<-gsub('[[:punct:]]','',names)
        #lowering all characters
        names<- str_to_lower(names)
        #enhancing variable names
        names<-gsub('subject','activity',names)
        #substituting abbreviation with original word
        names<-gsub('gyro','gyroscope',names)
        #substituting abbreviation with original word
        names<-gsub('\\wfreq','frequency',names)
        
        names
}