context("datafileInit")
test_that("valid funtion arguments", {
              expect_error(datafileInit(basedir=1))
              expect_error(datafileInit(basedir=c("/usr","bin")))
              expect_error(datafileInit(subdir=1))
              expect_error(datafileInit(datadir=1))

  
})

test_that("file file/directory names", {
              expect_error(datafileInit(basedir="/some/dir/that/really/should/not/exists"))
  
})

test_that("set environment vars", {

              dir <- tempdir()
              datafileInit(basedir=dir)
              
              res <- get("workdir",env=.DatafileConfig)
              expect_equal(res,file.path(dir,"data"))


              unlink(file.path(dir,"data"),recursive=TRUE)
  
})

test_that("directory creation", {
              dir <- tempdir()
              datafileInit(basedir=dir)
              expect_true(file.exists(file.path(dir,"data")))
              unlink(file.path(dir,"data"),recursive=TRUE)

              datafileInit(basedir=dir, subdir=c("a","b","c"))
              expect_true(file.exists(file.path(dir,"a","b","c","data")))
              unlink(file.path(dir,"a"),recursive=TRUE)
  
})
