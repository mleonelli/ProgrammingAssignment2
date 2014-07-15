## Put comments here that give an overall description of what your
## functions do

## cachematrix.R is a utility script that creates an object storing
## a matrix and its inverse

## Write a short comment describing this function

## makeCacheMatrix sets up the object which stores the matrix and
## its inverse
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


## Write a short comment describing this function

## cacheSolve retrieves the cached inverse if present if not
## calculates its inverse and save it to the object

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
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
