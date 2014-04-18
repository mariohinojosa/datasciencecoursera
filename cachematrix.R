## Put comments here that give an overall description of what your
## functions do:
##The overall objective of the functions is to cache the inverse of a matrix and
##retrieve it when necessary instead of re-doing the computation every single time

## Write a short comment describing this function:
##makeCacheMatrix does the following: 
##(1) takes in a (square) matrix
##(2) obtains the inverse matrix using the solve() function 
##(3) caches the result
##(4) creates a list of functions

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) m <<- solve
    getInverse <- function() m
    list(set = set, get = get,
    setInverse = setInverse,
    getInverse = getInverse)
}


## Write a short comment describing this function:
##(1) checks the m vector to see if there is a cache, 
##(2.a) if there is,it returns the cache (in this case the inverse matrix)
##(2.b) If NO cache, then it computes the inverse matrix and saves the result in the cache
##(3) returns the result

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}