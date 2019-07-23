context("datafile")

test_that("valid function arguments", {
  expect_error(datafile(1))
})

test_that("filename creation",{
              dir <- tempdir()
              datafileInit(basedir=dir)
              fname <- "test.dat"
              expectedPath <- file.path(dir,"data",fname)
              expect_equal(datafile(fname),expectedPath)
              expect_equal(dfn(fname),expectedPath)
              unlink(file.path(dir,"data"),recursive=TRUE)
              
              datafileInit(basedir=dir, subdir=c("a","b","c"))
              expectedPath <- file.path(dir,"a","b","c","data",fname)
              expect_equal(datafile(fname),expectedPath)
              unlink(file.path(dir,"a"),recursive=TRUE)
              
})
