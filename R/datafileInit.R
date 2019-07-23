#' Initialise datafile
#' 
#' Data is stored in a subdirectory under the current workdir, or base
#' directory. This function sets the base directory, checks if it
#' exists and, if needed, creates the data directory
#'
#' @param basedir Path of the base directory
#' @param subdir character of vector of character with the names of
#' the subdirectory
#' @param datadir name of the data directory, default is 'data'
#'
#' @return
#' full path of file to data directory
#'
#' @importFrom here here
#' @export

datafileInit <- function(basedir=NA,subdir=NA,datadir="data") {

    #code:
    # check if basedir is character
    if(length(basedir)!=1) {
        stop("datafileInit: basedir should have length 1")
    }

    if(is.na(basedir)) {
        basedir=here::here()
        cat("basedir set to",basedir,"\n")
    }

    if(!is.character(basedir)) {
        stop("datafileInit: basedir is not character")
    }

    if(!is.character(datadir)) {
        stop("datafileInit: datadir is not character")
    }
       
    if(!file.exists(basedir)) {
        stop("datafileInit: basedir does not exist")
    }
    if(!is.na(subdir[1])) {
        if(any(!is.character(subdir))) {
            stop("datafileInit: subdir is not character")
        }
        subdir <- paste(subdir,collapse=.Platform$file.sep)
        basedir <- file.path(basedir,subdir)
    }

    fullpath <- file.path(basedir,datadir)
    if(!file.exists(fullpath)) {
        dir.create(file.path(basedir,datadir),recursive=TRUE)
    }
    assign("workdir",fullpath,envir=.DatafileConfig)

}
