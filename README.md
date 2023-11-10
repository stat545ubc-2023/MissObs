
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

## Usage

count_all_missing_by_group(data, group_col, .groups = “drop”)

`data`: Data in data.frame or tibble format for which number of missing
values is to be determined

`group_col`: Column in data to group by

`.groups`: (OPTIONAL) Controls whether the output data frame is grouped.
By default, drops all levels of grouping (“drop”). Specify “keep” to
keep the output data frame grouped by group. See summarize()
documentation in dplyr for a full list of options.

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

In the tibble generated above, you can see the
function`count_all_missing_by_group` returned the total number of
missing values for each groups in a `group`. For example, there are two
category for the group variable **extreme_type**. The value of the
variable **flow** is missing 2 times from the minimum category, but it
is not missing from the maximum category.
