# Assignment 2 Coursera R Programming
# Caching the Inverse of a Matrix
# Two functions:    makeCacheMatrix:  A special "matrix" object
#                                     that can cache the matrix's inverse
#                   cacheSolve: Function to compute or retrieve the inverse 
#                               of a matrix returned by makeCacheMatrix
#
makeCacheMatrix <- function(matx = matrix(),...) {
    # matx is a square matrix that is invertible
    #
    # returns a list containing four functions used in calculating
    # or retrieving the inverse of a matrix
    #
    imat <- NULL      # initialize the inverse matrix
    #
    
    setmat <- function(mt) {
        #Enter with mt, a square matrix that is invertible
        #This function will store the matrix to be inverted
        #Once makeCacheMatrix is executed, we do not have to initiate another
        #instance of the makeCacheMatrix to change the value of matx
        #
        matx <<- mt     #intialize original matrix in the parent environment
        imat <<- NULL   #initialize the inverse matrix in parent environment
    }
    # 
    getmat <- function () {
        # When the function getmat() is called, matx is retrieved
        # from the parent environment [makeCacheMatrix] and returned
        matx
    }
    #
    setsolve <- function(inverse) {
        # This function will set (store) the inverse of matx
        imat <<- inverse   #The function solve finds the inverse 
        
    }
    getsolve <- function() {
        # This function will return the imat object from parent environment
        imat
    }    
    #
    # return with the four functions used to set(store) a matrix,
    # get(retrieve) the matrix, set(store) the inverse of the matrix,   
    # and get(retrieve) the inverse of the matrix.
    #
    list(setmat = setmat, getmat = getmat,
         setsolve = setsolve, getsolve = getsolve)
    #
}  #  end of makeCacheMatrix
#
cacheSolve <- function(matx,...) {
    # matx is an object of type makeCacheMatrix
    #
    # Using the inverse matrix process in makeCacheMatrix, this function
    # will return either compute the inverse of a matrix or retrieve 
    # the inverse if it has already been computed.
    #
    imat <- matx$getsolve()    #retrieve the inverse of the matrix
                               #This will either be null (not computed)
                               #or some value already stored
    #
    # If inverse has been computed (imat is not NULL) 
    # then retrieve the inverse and return its value
    if(!is.null(imat)) {
        message("Getting cached inverse")
        return(imat)
    }
    #
    # Since imat was not computed, we'll do that now
    #
    matdata <- matx$getmat()  #retrieve the original matrix
    imat <- solve(matdata, ...)   #compute the inverse
    matx$setsolve(imat)    #Set (store) the inverse 
    imat                   #return the inverse
    
}  #End of cacheSolve
