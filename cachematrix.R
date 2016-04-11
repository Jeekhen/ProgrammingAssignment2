## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv_matrix <<- NULL
        
        set <- function(new_matrix) {
                norm_matrix <<- new_matrix
                inv_matrix <<- NULL
        }
        get <- function () x
        setInverseMatrix <- function(new_matrix2) inv_matrix <<- new_matrix2
        getInverseMatrix <- function() inv_matrix
        list(set = set, get = get,
             setInverseMatrix = setInverseMatrix,
             getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        result <- x$getInverseMatrix()
        
        if(!is.null(result)){
                message("Cached data was retrieve")
        }else{
                data <- x$get()
                result <- solve(data)
                x$setInverseMatrix(result)
        }
        
        result 
}
