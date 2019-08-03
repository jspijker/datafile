#' Expand a filename to a full path.
#' 
#' This function expands a filename to a full file path
#'
#' @param fname filename 
#'
#' @return
#' full path of file to data directory
#' 
#' This function assumes that the data directory is correctly
#' initialized using datafileInit(). It will return a full path to the
#' file in the data directory.
#' 
#' @aliases dfn
#' @export



datafile <- function(fname) {
    
    if(!is.character(fname)) {
        stop("datafile:fname is not character")
    }

    workdir <- get("workdir",envir=.DatafileConfig)
    f <- file.path(workdir,fname)
    return(f)
}

# #' drname add
#' @export
# #' describe in datafile short hand datafile function
dfn <- function(...) {
    datafile(...)
}

