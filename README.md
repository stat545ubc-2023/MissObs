
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MissObs

Note: This package is prepared for practice only.

The goal of this R package `MissObs` is to count missing values for all
columns by group. The function `count_all_missing_by_group` takes the
dataframe and returns a data frame or tibble with the number of NAs or
missing values within each level of `group`.

## Installation

You can install the development version of `MissObs` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools"
devtools::install_github("stat545ubc-2023/MissObs")
```

## Parameters

## Example

The simple example of what the package function does is provided below.

``` r
## Load the package
library(MissObs)

## Load sample data

library(datateachr)

## Calculate count of NAs or missing values for each level of extreme_type category in flow sample data.

missing_values<-count_all_missing_by_group(flow_sample, extreme_type, .groups = "drop")
missing_values
#> # A tibble: 2 × 7
#>   extreme_type station_id  year month   day  flow   sym
#>   <chr>             <int> <int> <int> <int> <int> <int>
#> 1 maximum               0     0     0     0     0   106
#> 2 minimum               0     0     2     2     2    13
```

In the tibble generated, you can see the function returned the total
number or counts if missing values for each groups. For example, the
value of the variable **flow** is missing 2 times from the minimum
category for value is not missing from the maximum category of the group
variable **extreme_type**
