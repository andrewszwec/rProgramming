makeCacheMatrix <- function(matrix = numeric()){
      
      
      
      
      
      
}

## Experiments
## Invers function works as expected
a <- rbind(c(2,3),c(2,2))
a
solve(a)

a <- rbind(c(1,2,3),c(0,1,4), c(5,6,0))
a
b <- solve(a)
b

## How does there example work?
## makeVector makes a vector into a object with a number of methods and attributes
## It holds your matrix + has set(), get(), setmean(), getmean() functions, list() prints out all the methods

## x is stored in this function's environment somewhere?
makeVector <- function(x = numeric()) {
      ## Init Mean
      ## Mean = NULL
      m <- NULL
      
      ## Reset vector 'x' to new value from set() function and reset mean to NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      
      ## returns matrix
      get <- function() x
      
      ## Once mean is calculated, set the mean attribute of the vector to the value
      setmean <- function(mean) m <<- mean
      
      ## return the value of the mean
      getmean <- function() m
      list(set = set, get = get,
           setmean = setmean,
           getmean = getmean)
}


cachemean <- function(x, ...) {
      ## once you've made a vector 'x' with some "special properties" 
      ## you can call on these special properties, like getmean(), etc
      m <- x$getmean()
      
      ## if the mean is not null then return the mean
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      
      ## else, if the mean has not been stored in getmean() yet then 
      ## get the matrix you stored in the vector and call it data
      data <- x$get()
      
      ## now calculate the mean of the matrix
      m <- mean(data, ...)
      
      ## store the mean in the special vector using the method setmean()
      x$setmean(m)
      m
}
## Test cacheMean function
a <- rbind(c(2,3),c(2,2))
b <- rbind(c(3,5),c(5,6))

aa <- makeVector(a)
cachemean(aa)











