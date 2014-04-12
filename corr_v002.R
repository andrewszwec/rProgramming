###################################################################################################
##  Function 3
###################################################################################################

corr <- function(directory, threshold = 0) {

  filenames <- list.files(path="./specdata/", pattern="*.csv" ,full.names = TRUE, ignore.case = TRUE)
  library(plyr)
  import.list <- llply(filenames, read.csv, header=TRUE, colClasses=c('character','numeric','numeric','numeric'))
  
  ## tempData represents all data from the directory concatenated together in 1 dataframe
  tempData <- list()
  for (i in 1:length(import.list)){
    tempData <- rbind(tempData, import.list[[i]])
  }
  
  if 
  completeCases <- tempData[complete.cases(tempData)==TRUE,]
  
  completeCases["count"] <- 1

  #   Select records where number of records for an id > threshold
  #   -- SQL --
  #   select  Date,
  #           sulfate, 
  #           nitrate, 
  #           ID 
  #   from dataframe  df
  #   inner join (
  #     select ID, count(*) from dataframe 
  #     group by ID
  #     Having count(*) > $threshold
  #   ) t1
  #   on df.ID = t1.ID
  
  groupby <- tapply(completeCases$count,completeCases$ID,sum)
  
  subselect <- melt(groupby[ groupby>threshold ])
  names(subselect) <- c('ID','count')
  
  output <- completeCases[completeCases$ID %in% subselect$ID, ]
  
  

  ## Return a numeric vector of correlations
  ## How it works: Split the huge combined df into small df's by ID. 
  ## Then apply the cor function to find the correlation between nitrate and sulfate variables 
  ## unlist converts the list to a vector
  return( unlist(lapply(split(output, output$ID), function(x){ cor(x$nitrate, x$sulfate ) } ) )  )
}


