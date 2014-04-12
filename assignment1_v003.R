###################################################################################################
##  Function 1
###################################################################################################

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  filenames <- list.files(path="./specdata/", pattern="*.csv" ,full.names = TRUE, ignore.case = TRUE)
  library(plyr)
  import.list <- llply(filenames, read.csv, header=TRUE, colClasses=c('character','numeric','numeric','numeric'))
  
  tempData <- import.list[[1]]
  for (i in 2:length(import.list)){
    tempData <- rbind(tempData, import.list[[i]])
  }
  
  
  mydata <- tempData[which(tempData$ID == id[1]),]
  
  for(j in 2:length(id)){
  
    mydata <- rbind( mydata, tempData[which(tempData$ID == id[j]),])
    
  }
  
  completeCases <- mydata[complete.cases(mydata)==TRUE,]
  
  return( mean(completeCases[pollutant][,], na.rm=TRUE) )
  
}


###################################################################################################
##  Function 2
###################################################################################################

complete <- function(directory, id = 1:332) {

  filenames <- list.files(path="./specdata/", pattern="*.csv" ,full.names = TRUE, ignore.case = TRUE)
  library(plyr)
  import.list <- llply(filenames, read.csv, header=TRUE, colClasses=c('character','numeric','numeric','numeric'))
  
  tempData <- import.list[[1]]
  for (i in 2:length(import.list)){
    tempData <- rbind(tempData, import.list[[i]])
  }
  
  
  mydata <- tempData[which(tempData$ID == id[1]),]
  
  for(j in 2:length(id)){
    
    mydata <- rbind( mydata, tempData[which(tempData$ID == id[j]),])
    
  }
  
  completeCases <- mydata[complete.cases(mydata)==TRUE,]
  
  completeCases["count"] <- 1

  groupby <- tapply(completeCases$count,completeCases$ID,sum)
  
  output <- melt(groupby)
  
  names(output) <- c('id','nobs')
  
  return(output)  

}























