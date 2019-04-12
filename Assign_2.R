# Assignment 2 Coursera R Programming
# Caching the Inverse of a Matrix
# Two functions:    makeCacheMatrix:  A special "matrix"
#                                     that can cache its inverse
#                   cacheSolve: Function to compute the inverse of a
#                               a matrix returned by makeCacheMatrix
#
makeCacheMatrix <- function(matx = matrix(),...) {
    # matx is a square matrix that is invertible
    # returns a list containing four functions
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
    setsolve <- function(solve) {
        # This function will set up the function to find the inverse of matx
        imat <<- solve   #The function solve finds the inverse 
        
    }
    getsolve <- function() {
        # This function will return the imat object from parent environment
        imat
    }    
    list(setmat = setmat, getmat = getmat,
         setsolve = setsolve, getsolve = getsolve)
}  #  end of makeCacheMatrix