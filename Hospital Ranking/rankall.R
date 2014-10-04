# returns a 2-column data frame
# containing the hospital in each state that has the 
# ranking specified in num

rankall <- function(outcome, num = "best") {
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv")
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    df <- NULL
    for (element in sort(unique(outcomeData$State))){
        #print(element)
        hospital <- rankhospital(element,outcome, num)
        #print()  
        ##df <- rbind(df, data.frame("State"=element,"hospital"=hospital))
        df <- rbind(df, data.frame("hospital"=hospital,"state"=element))
              
    }
    
    
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    df
}
