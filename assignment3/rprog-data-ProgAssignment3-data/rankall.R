rankall <- function(outcome, num = "best") {
      
      ## Read outcome data
      ## Check that state and outcome are valid
      ## For each state, find the hospital of the given rank
      ## Return a data frame with the hospital names and the
      ## (abbreviated) state name
      
      ## Read outcome data
      data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      
      # Change column names to lower case and remove '.'
      names(data) <- gsub("\\.","",names(data))
      names(data) <- tolower(names(data))
      
      
      ## Check that state and outcome are valid
      if (outcome %in% c("heart attack","heart failure", "pneumonia") == FALSE){
            stop("invalid outcome")
      }
      
      ## Parse outcome to make it suitable for matching
      outcome <- gsub("[\\.| ]","", tolower(outcome) )
      
      ## Go find the column corresponding to the outcome chosen
      outcomeColNum <- grep(paste0("^hospital30daydeathmortalityratesfrom", outcome), names(data))
      
      # Cast the column as numeric for calculations
      data[, outcomeColNum] <- as.numeric(data[, outcomeColNum])
      
      # get unique states to iterate through
      s <- unique(data$state)
      
      # Switch on value of num
      if (num == "best"){
            d <- data.frame( sapply(s, best2, data=data, outcomeColNum=outcomeColNum) )
            e <- cbind(d[1], data.frame( row.names(d) ) )
            names(e)<-c("hospital", "state")
            return( e[order(e$state), ] ) 
      } else if (num=="worst" ){
            d <- data.frame( sapply(s, worst2, data=data, outcomeColNum=outcomeColNum) )
            e <- cbind(d[1], data.frame( row.names(d) ) )
            names(e)<-c("hospital", "state")
            return( e[order(e$state), ] ) 
      } else if ( is.numeric(num)==TRUE ){
            d <- data.frame( sapply(s, whosNth2, data=data, outcomeColNum=outcomeColNum, num=as.numeric(num)) )
            e <- cbind(d[1], data.frame( row.names(d) ) )
            names(e)<-c("hospital", "state")
            return( e[order(e$state), ] ) 
      } else 
            return("NA")
       
      ##d <- sapply(s, rankhospital, outcome=outcome, num=num)
}
