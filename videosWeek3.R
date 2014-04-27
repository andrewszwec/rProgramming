### R Programming Video :: Week 3

lapply()
sapply()
apply()
tapply()
mapply()
split()

## lapply()
x <- list(a=1:5, b=rnorm(10))
lapply(x,mean)
typeof(lapply(x,mean))

x <- list(a = matrix(1:4,2,2), b = matrix(1:6,3,2))
x

## Anonymous function
## Defining your own functions with lapply - can be used for slicing
lapply(x, function(elt) elt[ ,1])


## sapply()
sapply returns the simplest object from lapply. e.g. a vector, matrix or list
typeof(sapply(x,mean)) # Vector

## apply()
# This returns the mean of each of the columns 
x <- matrix(rnorm(200),20,10)
# NOTE: the '2' here means keep the 2nd dimension ^ here 20 x 10 matrix, and colapse the rows
apply(x,2,mean)

## colapse the columns 
apply(x,1,sum)

## Optimised Column and Row operations
rowSums = apply(x,1,sum)
rowMeans = apply(x,1,mean)
# -- Add this to project colMeans!
colSums = apply(x,2,sum)
colMeans = apply(x,2,mean)

apply(x,1,quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2*2*10), c(2,2,10))
apply(a, c(1,2), mean)
rowMeans(a, dims = 2)

## tapply()
x <- c(rnorm(10), runif(10), rnorm(10,1))
x
f <- gl(3,10)
f

tapply(x,f,mean)
tapply(x,f,range)



## mapply
# Applies over multiple lists
noise <- function(n,mean,sd){
      rnorm(n,mean,sd)
}

# Make you own function and iterate it using mapply
noise(5,1,2)
noise(1:5,1:5,2)

mapply(noise, 1:5, 1:5, 2)






## split()  (Sort of like Group By)
# Splits the 'x' vector into small pieces by the factor 'f'
split(x,f)

lapply(split(x,f), mean) # = tapply(x, f ,mean)

## Split airquality Data by month (like a group by), then take the colmeans
library(datasets)
head(airquality)
# First split airquality into chunks by month, then take the mean of the 3 important cols
s <- split(airquality, airquality$Month)

sapply(s, function(x) colMeans(x[,c("Ozone","Solar.R", "Wind")], na.rm=TRUE))

# Split by multiple levels
x <- rnorm(10)
f1 <- gl(2,5)
f1
f2 <- gl(5,2)
f2

## Creates a tree hierarchy
interaction(f1,f2)

# Split x by both levels (Drop empty levels)
str(split(x, list(f1,f2), drop = TRUE))


## Debugging Tools
invisible prevents auto printing

traceback()
debug()
browser()   # Sets a break point in the code and puts it in debug mode
trace()     # Sets a trace
recover()   # recover is an error handler

mean(z)
traceback() # Tells you the function that caused the error


lm(y-z)
traceback()
debug(lm)   # Run a function in debug mode then run the function and use 'n' to step through your function

# Allows you to perouse the function call stack and find errors
options(error = recover)
read.csv("nosuchfile")









