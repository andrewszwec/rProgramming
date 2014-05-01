whosNth <- function(state, outcome, num = "best") {
      
      
      ## Read outcome data
      data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      
      # Change column names to lower case and remove '.'
      names(data) <- gsub("\\.","",names(data))
      names(data) <- tolower(names(data))
      
      
      ## Check that state and outcome are valid
      if( state %in% unique(data$state) == FALSE ){
            stop("invalid state")
      } else if (outcome %in% c("heart attack","heart failure", "pneumonia") == FALSE){
            stop("invalid outcome")
      } else
      
      ## Parse outcome to make it suitable for matching
      outcome <- gsub("[\\.| ]","", tolower(outcome) )
      
      ## Go find the column corresponding to the outcome chosen
      outcomeColNum <- grep(paste0("^hospital30daydeathmortalityratesfrom", outcome), names(data))
      
      # Cast the column as numeric for calculations
      data[, outcomeColNum] <- as.numeric(data[, outcomeColNum])
      
      # Get All records where the outcome column has data and has the chosen $state
      d1 <- data[which( !is.na(data[outcomeColNum]) & data$state==state ),]
      
      # Create sort index
      idx <- order(d1[ names(d1)[outcomeColNum] ], d1["hospitalname"] ) 
      # Use index to order my data
      d1_sorted <- d1[idx, ]
      # Get lowest mortality rate hospital name
      nthHospital <- d1_sorted$hospitalname[num]
      
      ## Return hospital name in that state with the given rank
      ## 30-day death rate
      
      return(nthHospital)
      
      
}
