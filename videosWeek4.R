### rProgramming Videos :: Week 4

## Video 1


str(bodyfat)

4wd
desiel 
manual
white
$30k - $35k

## Video 2
# Simulation PART 1
Simulates normal random variables
rnorm = random generation
dnorm = density
pnorm = cumulative distribution
rpois
qnorm = quantile function

# Sets seed to reproduce the same numbers
set.seed(1)
rnorm(5)

rpois(10, 1)

## Video 3
# Simulation PART 2
# Linear model

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

# Binary variable x
set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)


# Poisson Model
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 +0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)


# Random Sampling
set.seed(1)
sample(1:10, 4)

sample(letters, 5)

# Some permutation of 1 thru 10
sample(1:10)

# With replacement
sample(1:10, replace=TRUE)


## Video 4
# R Profiler PART 1
# Find out why things are taking too long
system.time(lm)
user time: time the CPU is used for this process
elapsed time: "wall clock" time

parallel package > multi core, multi threaded or Basic Linear algebra simulation

system.time(readLines("http://www.jhsph.edu"))

hilbert <- function(n){
      i <- 1:n
      1/outer(i-1, i, "+")
}

x <- hilbert(1000)
system.time(svd(x))


# Use braces to time expressions
system.time( {
      n <- 1000
      r <- numeric(n)
      for(i in 1:n) {
            x <- rnorm(n)
            r[i] <- mean(x)
      }      
})


## Video 5
# R Profiler PART 2
Rprof()
summaryRprof(by.total) 
summaryRprof(by.self)

low level functions do all the work. Hence use by.self (subtracts out all the low level functions)

sample.interval
sampling.time = elapse time



## Video 6
# Scoping Rules
optim, nlm, optimize()

# Constructer function
make.NegLogLik <- function(data, fixed=c(FALSE, FALSE)){
      # Set params equal to fixed
      params <- fixed
      function(p){
            # select the unfixed params and put p into it (this will either be mu or sigma)
            params[!fixed] <- p
            mu <- params[1]
            sigma <- params[2]
            a <- -0.5*length(data)*log(2*pi*sigma^2)
            b <- -0.5*sum((data-mu)^2) / (sigma^2)
            -(a + b)
      }
}

set.seed(1); normals <- rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))

optim(c(mu=0, sigma=1), nLL)$par

nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum

nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum


# Plotting
# creat function nLL with param #1 (mu) fixed and 
# put in the payload of data which is a normal distribution
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len=100)
# Now put the x vector into the function nLL(), 
# 'x' is a vector of 100 parameters iterated through to set mu. This then produces a curve for mu, sigma and data
y <- sapply(x, nLL)
# Plot y take away the smallest y, negative, power e
plot(x, exp(-(y-min(y))), type="l")


nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))), type="l")

fixed <- c(FALSE, 2)
params <- fixed
params[!fixed] <- x[2] 


