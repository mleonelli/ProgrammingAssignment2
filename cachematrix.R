## cachematrix.R is a utility script that creates an object storing
## a matrix and its inverse

## makeCacheMatrix sets up the object which stores the matrix and
## its inverse
## makeCacheMatrix is initialized with a matrix and
## provides functions to cache the result of finding
## the inverse of that matrix.
## set: sets the stored matrix x
## get: returns the stored matrix x
## setInverse: caches the inverse of the matrix x
## getInverse: returns the cached inverse of the matrix x
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## cacheSolve retrieves the cached inverse if present if not
## calculates its inverse and save it to the object

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setsolve(m)
  m
}
