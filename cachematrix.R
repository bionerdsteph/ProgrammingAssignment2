## The first part will provide a space to attach meta data to an object and store it so it can be called in any environment.
## The second part will actualy take the inverse matrix and feed it back into the space created in the first part

## This first function will create a space for a matrix and meta data about it. It only creates the space to store meta data about whith an object not what that meta data is.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This second function will take the inverse matrix using the solve function and put it into the space created by the first function and then provide a way to call up the meta data and object.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
