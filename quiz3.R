## Quiz :: week 3

# Question 1
library(datasets)
data(iris)

# Subset to only get the numerics and do colMeans
df <- subset(iris, Species=="virginica", select=c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width))
m <- colMeans(df , na.rm = TRUE)
typeof(m)

# Question 2
dim(iris)
[1] 150   5
# Collapse the 150 rows into 1
# Chose
apply(iris[, 1:4], 2, mean)


# Question 3
# THis with() thing and tapply() combine to make a group by clause
library(datasets)
data(mtcars)
dim(mtcars)
[1] 32 11

# Choose
with(mtcars, tapply(mpg, cyl, mean))


# Question 4
h <- with(mtcars, tapply(hp, cyl, mean))

abs(h["4"]-h["8"])





