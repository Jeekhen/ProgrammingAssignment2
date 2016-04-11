## The purpose of the 2 functions below is to calculate an inverse matrix and ## cache the results. If the function are repetivitely called, the function 
## will grap the result from the cache instead recalculating the value


## The following function create an object that could retrieve the original 
## matrix before inverse and the inversed matrix
## Function Input Parameters:
## x <- the matrix that will be inversed
## Function Output Parameters:
## output <- a list of function to retrieve and store matrix and the inverse 
## matrix

makeCacheMatrix <- function(x = matrix()) {
        inv_matrix <<- NULL
        
        ## Function for setting the target matrix 
        set <- function(new_matrix) {
                norm_matrix <<- new_matrix
                inv_matrix <<- NULL
        }
        get <- function () x ## Function for getting the target matrix
        
        ## Function to set and get the inversed matrix.
        setInverseMatrix <- function(new_matrix2) inv_matrix <<- new_matrix2
        getInverseMatrix <- function() inv_matrix
        
        ## return a list of function 
        list(set = set, get = get,
             setInverseMatrix = setInverseMatrix,
             getInverseMatrix = getInverseMatrix)
}


## The following function will calculate the actual inverse matrix
## Function Input Parameters:
## x <- the matrix that will be inversed
## Function Output Parameters:
## output <- inverse matrix of output
cacheSolve <- function(x, ...) {
       
        ## get cached inverse matrix
        result <- x$getInverseMatrix()
        
        ## if result value is not NULL, it means values have already been 
        ## calculated
        if(!is.null(result)){
                message("Cached data was retrieve")
        }else{
                ## calculate the inverse matrix since it is empty and store 
                ## the value back into the cache
                data <- x$get()
                result <- solve(data)
                x$setInverseMatrix(result)
        }
        
        ## return the inverse matrix
        result 
}
