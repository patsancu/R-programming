## Put comments here that give an overall description of what your
## functions do

## Creates a special vector containing functions to
# - set matrix value
# - get matrix value
# - set matrix inverse
# - get matrix inverse
# - check whether the matrix has changed

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    changed <<- TRUE #indicates whether just the matrix changed, or both the matrix and the inverse
    set <- function(y) {
        x <<- y
        inv <<- NULL
        changed <<- TRUE
    }
    get <- function() x
    setinverse <- function(inverse){        
        inv <<- inverse
        changed <<- FALSE
    }
    getinverse <- function() inv
    hasChanged <- function() changed
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse,
         hasChanged = hasChanged)    
}


## Calculates the inverse of the matrix represented 
# by the special matrix x
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    #The assignment states that the matrix must not have changed
    if (! is.null(inv) && ! x$hasChanged() ){
        message("Getting cached inverse.")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}




#example matrices
#mat <- matrix(rnorm(25,1),5,5)