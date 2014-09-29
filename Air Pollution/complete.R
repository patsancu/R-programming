complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
        
    temp <- vector("numeric")
    
    for (element in id){
        path <- generatePath(directory, element)
        ds <- read.csv(file=path) 
        completeCases <- complete.cases(ds)
        sizeComplete <- dim(ds[completeCases,])[1]
        
        temp[element] <- sizeComplete              
    }
    
    data.frame(ID=id, nobs=temp[id])
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

isComplete = function(row){
    ! is.na(row['sulfate']) || ! is.na(row['nitrate'])
}
