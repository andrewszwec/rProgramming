##  rProgramming - Week 2 Videos 
myfunc  <- function(var1, var2 = 1, var3 = NULL){
      print(var1)
      print(var2)
      print(var3)
      
}

# Lazy evaluation - R only evaluates variables if they are used in the script

# ... elipsis
myplot  <- function(x,y, type="l", ...){
      plot(x,y, type=type, ...)
}
# cant use positional matching after '...' Variables after ... must be explicitly named


columnmean  <- function(y, removeNA = TRUE){
      nc  <- ncol(y)
      means  <- numeric(nc)
      for (i in 1:nc){
            means[i]  <-  mean(y[,i], na.rm = removeNA)
      }
      means
      
}

# Coding standards
# making lots of little functions helps with debugger locating errors

# Object and Functions Scoping
search() # 
# lexical scoping

# Free variables
# R looks for z in the function (i.e. scope) where it was defined.
# if it can't find the variable in the current environment then it 
# goes to the next enironment in the list until it finds the variable 
# that you have asked for

# You can make a function that builds other functions
make.power  <- function(n) {
      pow  <- function(x){
            x^n
      }
      pow
}

cube  <- make.power(3)
square  <- make.power(2)
cube(3)
square(3)

# Amazing!!


ls(environment(cube))
get("n", environment(cube))
get("n", environment(square))

ls(environment(columnmean))

## Parent envirnoment for lexical scoping
y <- 10
f  <- function(x){
      y <- 2
      y^2 + g(x)
      ## Parent environment for dynamic scoping
}

g <- function(x){
      x*y
}

f(3)
# = 34 # Hooray!

# Matrix manipulation

x <- 1:4
y <- 1:4
x %*% T(y)

## Dates and Times
# Time since EPOCH

# POSIX
## as.POSIXlt(x) has all the years, days, months, min, hrs, etc....
## as.POSIXct(x) # Something else...
## strptime << converts string into POSIXlt
x <- as.Date("1970-01-01")
weekdays(x)
months(x)
quarters(x)

x <- Sys.time()
x
p <- as.POSIXlt(x)
p
names(unclass(p))
p$isdst
p$wday

?strptime
datestring  <- "January 10, 2012 10:40"
x <- strptime(datestring, "%B %d, %Y %H:%M")
x












