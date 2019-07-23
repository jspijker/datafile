#' return path of a file in the data directory
#' 
#' Returns the full here() path from a file in the data directory
#'
#' @param fname filename (without the path)
#'
#' @return
#' full path of file to data directory
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

#' drname add
#' @export
dfn <- function(...) {
    datafile(...)
}
