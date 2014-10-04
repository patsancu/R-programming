best <- function(state, outcome) {
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
    
    minimum <- min(completeStateData[cause])
    bestHospitalsCases <- completeStateData[cause] == minimum
    bestHospitals <- completeStateData[bestHospitalsCases,]
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    bestHospitals$Hospital.Name <- sort(bestHospitals$Hospital.Name)
    return(as.character(bestHospitals$Hospital.Name)[1])
}

