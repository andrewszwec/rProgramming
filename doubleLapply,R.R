## Great ideas for double for loop -> nested lapply




test <- lapply(mypattern, function(x){ lapply(filenames, grep, pattern=x )} )




myfiles <- lapply(filenames, grep, pattern=mypattern )
myfiles <- filenames[complete.cases(filenames[myfiles == TRUE])]
myfiles