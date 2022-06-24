
<!-- README.md is generated from README.Rmd. Please edit that file -->

# env2list

<!-- badges: start -->

<!-- badges: end -->

The goal of env2list is to pull objects from the global environment in a
manner reminiscint of the popular `tidyselect` helpers.

## Installation

You can install the released version of env2list from \[GitHub with:

``` r
remotes::install_github("daranzolin/env2list")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(env2list)
library(nycflights13)
data("airlines")
data("airports")
data("airmiles")
data("airquality")
data("CO2")

ls()
#> [1] "airlines"   "airmiles"   "airports"   "airquality" "CO2"       
#> [6] "work_data"
air_dfs <- env_matches("^air")
#> airlines assigned to output.
#> airmiles assigned to output.
#> airports assigned to output.
#> airquality assigned to output.
names(air_dfs)
#> [1] "airlines"   "airmiles"   "airports"   "airquality"
str(air_dfs, max.level = 1)
#> List of 4
#>  $ airlines  : tbl_df [16 × 2] (S3: tbl_df/tbl/data.frame)
#>  $ airmiles  : Time-Series [1:24] from 1937 to 1960: 412 480 683 1052 1385 ...
#>  $ airports  : tbl_df [1,458 × 8] (S3: tbl_df/tbl/data.frame)
#>   ..- attr(*, "spec")=List of 3
#>   .. ..- attr(*, "class")= chr "col_spec"
#>  $ airquality:'data.frame':  153 obs. of  6 variables:
rm(air_dfs)

s_dfs <- env_ends_with("s")
#> airlines assigned to output.
#> airmiles assigned to output.
#> airports assigned to output.
names(s_dfs)
#> [1] "airlines" "airmiles" "airports"
str(s_dfs, max.level = 1)
#> List of 3
#>  $ airlines: tbl_df [16 × 2] (S3: tbl_df/tbl/data.frame)
#>  $ airmiles: Time-Series [1:24] from 1937 to 1960: 412 480 683 1052 1385 ...
#>  $ airports: tbl_df [1,458 × 8] (S3: tbl_df/tbl/data.frame)
#>   ..- attr(*, "spec")=List of 3
#>   .. ..- attr(*, "class")= chr "col_spec"
```
