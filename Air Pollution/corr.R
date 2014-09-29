corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    v <- vector("numeric")
    for (element in 1:332){
        path <- generatePath(directory, element)
        ds <- read.csv(file=path) 
        completeCases <- complete.cases(ds)
        sizeComplete <- dim(ds[completeCases,])[1]
        if (sizeComplete > threshold){
            completeTable <- ds[completeCases,]
            correlation <- cor(completeTable$nitrate, completeTable$sulfate)
            v <- append(v, correlation)
        }
    }
    
}

generatePath = function(path, number){
    #Generates path to csv file, according to "path" and "number" arguments
    numberPath <- generateNumber(number)
    fullPath <- paste(path,'/', numberPath, '.csv', sep='')
}

generateNumber = function(number){
    ##Generates a three digit number, equivalent to the "number" parameter.1
    prefix <- ''
    if (number < 100){
        prefix <- paste(prefix, '0', sep='')
    }
    if (number < 10){
        prefix <- paste(prefix, '0', sep='')
    }
    prefix <- paste(prefix, number, sep='')
}
