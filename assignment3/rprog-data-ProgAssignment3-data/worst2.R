worst2 <- function(data, outcomeColNum, state){
      # Get All records where the outcome column has data and has the chosen $state
      d1 <- data[which( !is.na(data[outcomeColNum]) & data$state==state ),]
      
      # Create sort index
      idx <- order(d1[ names(d1)[outcomeColNum] ], d1["hospitalname"], decreasing=TRUE ) 
      # Use index to order my data
      d1_sorted <- d1[idx, ]
      # Get lowest mortality rate hospital name
      worstHospital <- d1_sorted$hospitalname[1]
      
      ## Return hospital name in that state with lowest 30-day death
      ## rate
      
      return(worstHospital)
}