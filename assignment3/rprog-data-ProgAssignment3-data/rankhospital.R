## This function really says who is the nth hospital for this particular outcome?
rankhospital <- function(state, outcome, num = "best") {

      # Switch on value of num
      if (num == "best"){
            return( best(state, outcome) )
      } else if (num=="worst" ){
            return( worst(state, outcome) )
      } else if ( is.numeric(num)==TRUE ){
            return( whosNth(state, outcome, as.numeric(num))  )
      } else 
            return("NA")
      
}

