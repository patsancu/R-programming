pollutantmean <- function(directory, pollutant, id = 1:332) {    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    #Create empty vector
    data <- vector()
    #Iterate across given ids (or default ones)
    for (element in id){
        path <- generatePath(directory, element)
        ds <- read.csv(file=path) 
        
        #Subsets just the pollutant values
        pollutantValues <- ds[pollutant] 
        #Subsets values not "NA"
        values <- ! is.na(pollutantValues)
        data <- c(data, pollutantValues[values] )        
    }
    mean(data)
}

generatePath = function(path, number){
    #Generates path to csv file, according to "path" and "number" arguments
    numberPath <- generateNumber(number)
    fullPath <- paste(path,'/' ,numberPath, '.csv', sep='')
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
