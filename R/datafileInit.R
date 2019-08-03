#' Initialise datafile
#' 
#' This function sets the base directory, checks if it
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
#' Before using the datafile function you must tell were to store the
#' data. With this function you initialize the datafiel package and
#' sets the base directory. The default base directory is the
#' directory returned by here(). In this base directory a directory
#' is created with the name given by the datadir argument. The default
#' name is 'data'. 
#'
#' Using the 'subdir' argument, a sub-directory name can be added to
#' the base directory. For example, if you have your project in a git
#' repository and use subdirectories to separate the the different
#' parts of the projectory (e.g. for importing data, modelling and
#' reporting), then the basedir is set at the root of the git
#' repository (using `here()`) and you can use the subdir argument to
#' indicate in which subdirectory of your git repository the data
#' directory should be created.
#'
#' This function checks if the directories exists and if names are
#' valid (e.g. are of type character). If not, it will throw an error.
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
