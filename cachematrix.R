## Put comments here that give an overall description of what your
## functions do

## These functions are used to caching the inverse of a matrix to avoid 
## repeatly compute the inverse of that matrix.

## Use:
## x <- matrix(...)
## y <- makeCacheMatrix(x)
## cacheSolve(y, ...)

## Write a short comment describing this function

## Function makeCacheMatrix take a matrix x and return a list of functions:
## set: to set the value of the matrix
## get: to get the value of the matrix
## setinverse: to set the value of the inverse of the matrix
## getinverse: to get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, 
		setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

## This function take the value of a matrix and others and return the value of
## the inverse of the matrix 

## The function first search whether the inverse has already been cached, 
## if it is, it return that value; if it is not, it copute the value and
## cache it, then return the value of it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
