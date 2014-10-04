#  returns a character vector with the name
# of the hospital that has the ranking specified by
# the num argument


rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv")
    
    ## Check that state and outcome are valid
    stateDataCases <- outcomeData$State == state    
    
    if (! any(stateDataCases)){ #There's no state data or the state doesn't exist
        stop("invalid state")        
    }   
    
    cause1 <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    cause2 <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    cause3 <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
    
    if (outcome == "heart failure"){
        cause <- cause1
    }
    else if (outcome == "heart attack"){
        cause <- cause2
    }
    else if (outcome == "pneumonia"){
        cause <- cause3
    }
    else{
        stop("invalid outcome")
    }
    
    
    
    stateData <- outcomeData[stateDataCases,]
    completeStateCases <- stateData[cause] != "Not Available"
    completeStateData <- stateData[completeStateCases,]
    
    ### NOTE!!! as.numeric(as.character) WTF?!
    completeStateData[[cause]] <- as.numeric(as.character(completeStateData[[cause]]))
    
    orderedData <- completeStateData[order(completeStateData[[cause]], completeStateData$Hospital.Name),]
    
    
    if (num == "best"){
        val <- orderedData[1,]$Hospital.Name
        #print(orderedData$Hospital.Name)
    }
    else if (num == "worst"){
        #val <- orderedData[length(orderedData)-1,]$Hospital.Name
        val <- tail(orderedData, n=1)$Hospital.Name
    }
    else{
        if (num > length(orderedData)){
            val <- "NA"
        }
        else{
            val <- orderedData[as.integer(num),]$Hospital.Name                
        }
        
    }
    return(as.character(val))
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
}
