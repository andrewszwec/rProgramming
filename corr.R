###################################################################################################
##  Function 3
###################################################################################################

corr <- function(directory, threshold = 0) {
  library(reshape)
  filenames <- list.files(path="./specdata/", pattern="*.csv" ,full.names = TRUE, ignore.case = TRUE)
  library(plyr)
  import.list <- llply(filenames, read.csv, header=TRUE, colClasses=c('character','numeric','numeric','numeric'))
  
  ## tempData represents all data from the directory concatenated together in 1 dataframe
  tempData <- list()
  for (i in 1:length(import.list)){
    tempData <- rbind(tempData, import.list[[i]])
  }
  

  completeCases <- tempData[complete.cases(tempData)==TRUE,]
  
  completeCases["count"] <- 1
  
  
  groupby <- tapply(completeCases$count,completeCases$ID,sum)
  temp <- groupby[ groupby>threshold ]
  
  if(length(temp)>0){
    
    subselect <- melt(temp)
  
    names(subselect) <- c('ID','count')
    
    output <- completeCases[completeCases$ID %in% subselect$ID, ]
    
    ## Return a numeric vector of correlations
    ## How it works: Split the huge combined df into small df's by ID. 
    ## Then apply the cor function to find the correlation between nitrate and sulfate variables 
    ## unlist converts the list to a vector
    myreturn <- unlist(lapply(split(output, output$ID), function(x){ cor(x$nitrate, x$sulfate ) } ) )
    
    
  }  else myreturn <- numeric()
    
  return(myreturn)
}


