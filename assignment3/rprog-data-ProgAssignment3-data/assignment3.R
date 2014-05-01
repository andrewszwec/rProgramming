## Get Submit script
setwd("~/Documents/Coursera/dataScienceSpecialisation/rProgramming/assignment3/rprog-data-ProgAssignment3-data")
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
source("rankhospital.R")
source("best.R")
source("worst.R")
source("whosNth.R")

# Part 4
source("rankall.R")
source("best2.R")
source("worst2.R")
source("whosNth2.R")

## Part 1
setwd("~/Documents/Coursera/dataScienceSpecialisation/rProgramming/assignment3/rprog-data-ProgAssignment3-data")
#outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#head(outcome)

# Change column names to lower case and remove '.'
#names(outcome)[1] 
#names(outcome) <- gsub("\\.","",names(outcome))
#names(outcome) <- tolower(names(outcome))
#names(outcome)[1] 
#names(outcome)[11]
#outcome[1:5,1:5]

## Convert column 11 to a numeric
#outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
#hist(outcome[, 11])
# Hist Name
#names(outcome)[11]
#outcome$state




best <- function(state, outcome) {
      # state  <- "AL"
      # outcome <- "heart attack" 
      
      ## Read outcome data
      setwd("~/Documents/Coursera/dataScienceSpecialisation/rProgramming/assignment3/rprog-data-ProgAssignment3-data")
      data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      
      # Change column names to lower case and remove '.'
      names(data) <- gsub("\\.","",names(data))
      names(data) <- tolower(names(data))
      
      
      ## Check that state and outcome are valid
       if( (state %in% unique(data$state) == FALSE) |  
                 (outcome %in% c("heart attack","heart failure", "pneumonia") == FALSE) ){
             print("outcome or state is invalid....")
            break
       }
      
      ## Parse outcome to make it suitable for matching
      outcome <- gsub("[\\.| ]","", tolower(outcome) )
      
      ## Go find the column corresponding to the outcome chosen
      outcomeColNum <- grep(paste0("^hospital30daydeathmortalityratesfrom", outcome), names(data))
      
      # Cast the column as numeric for calculations
      data[, outcomeColNum] <- as.numeric(data[, outcomeColNum])
      
      # Get All records where the outcome column has data and has the chosen $state
      d1 <- data[which( data[outcomeColNum]!="Not Available" & data$state==state ),]
      
      # Create sort index
      idx <- order(d1[ names(d1)[outcomeColNum] ] ) 
      # Use index to order my data
      d1_sorted <- d1[idx, ]
      # Get lowest mortality rate hospital name
      bestHospital <- d1$hospitalname[1]
      
      ## Return hospital name in that state with lowest 30-day death
      ## rate
      
      return(bestHospital)

}











