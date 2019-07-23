
<!-- README.md is generated from README.Rmd. Please edit that file -->
datafile
========

<!-- badges: start -->
<!-- badges: end -->
The datafile package is build around the philosophy that data should be seperated from code. This means that data is always written to a different location (directory) than your current working directory.

Installation
------------

You can install the github version of this package with

``` r
devtools::install_github("jspijker/datafile")
```

Basic Example
-------------

In this example we create a datadirectory using `datafileInit()` under the current working directory. Then we created some variable `x`. And using saveRDS and datafile we save it to disk. The final RDS file is now saved to `./data/x.rds`.

``` r

datafileInit() 
#> basedir set to /home/spijkerj/rivm/git/datafile
x<-rnorm(10)
saveRDS(x,datafile("x.rds"))
```

To retrieve the rds file, we use:

``` r
x<-readRDS(datafile("x.rds"))
```

If even `datafile` is to much typing for you, you can use the alias `dfn()`

``` r
x<-readRDS(dfn("x.rds"))
```

Please see the vignette for more examples how to use this function.
