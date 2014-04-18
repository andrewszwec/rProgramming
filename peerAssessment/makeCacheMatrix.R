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
makeVector <- function(x = numeric()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setmean <- function(mean) m <<- mean
      getmean <- function() m
      list(set = set, get = get,
           setmean = setmean,
           getmean = getmean)
}


cachemean <- function(x, ...) {
      m <- x$getmean()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- mean(data, ...)
      x$setmean(m)
      m
}

a <- rbind(c(2,3),c(2,2))
cachemean(a)