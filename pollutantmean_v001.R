###################################################################################################
##  Function 1
###################################################################################################

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ## Get all file names in folder
  filenames <- list.files(path="./specdata/", pattern="*.csv" ,full.names = TRUE, ignore.case = TRUE)
  
  ## Go and get data from specified files (select filesnames where filename contains id[] )
  padded <- formatC(id, width=3, format='d', flag="0")
  mypattern <- paste(padded,".csv",sep="")
  
  ## Check each file name XXX.csv against all the filenames
  myfiles <- character()
  for (s in mypattern) {
    myfilemask <- lapply(filenames, grep, pattern=s )
    myfiles <- cbind(myfiles, filenames[complete.cases(filenames[myfilemask == TRUE])])
  }
  
  library(plyr)
  import.list <- llply(myfiles, read.csv, header=TRUE, colClasses=c('character','numeric','numeric','numeric'))
  
  tempData <- list()
  for (i in 1:length(import.list)){
    tempData <- rbind(tempData, import.list[[i]])
  }
  
  mydata <- list()
  for(j in 1:length(id)){
    mydata <- rbind( mydata, tempData[which(tempData$ID == id[j]),])
  }
  
  completeCases <- mydata[complete.cases(mydata)==TRUE,]
  
  return( mean(completeCases[pollutant][,], na.rm=TRUE) )
  
}