## The first function, makeCacheMatrix creates a special "Matrix", which is  a list containing a function to

## set the value of the matrix, get the value of the matrix, set the value if the inverse and get the value of the inverse



makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y){
                
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get, setinv = setinv, getinv = getinv)
        
}


## The following function calculates the inverse of the special "Matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setinv function.

cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached inverse")
                return(i)
        }
        mat <- x$get()
        i <- solve(mat, ...)
        x$setinv(i)
        i
}
