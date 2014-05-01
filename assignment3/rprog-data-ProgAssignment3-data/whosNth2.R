whosNth2 <- function(data, outcomeColNum, state, num){
      # Get All records where the outcome column has data and has the chosen $state
      d1 <- data[which( !is.na(data[outcomeColNum]) & data$state==state ),]
      
      # Create sort index
      idx <- order(d1[ names(d1)[outcomeColNum] ], d1["hospitalname"] ) 
      # Use index to order my data
      d1_sorted <- d1[idx, ]
      # Get lowest mortality rate hospital name
      nthHospital <- d1_sorted$hospitalname[num]
      return(nthHospital) 
}