# Test  cases whether functions in this package work properly.

##Test 1: The first test checks whether the function gives the same result
## as directly calling `group_by()` and `summarize()`, whether the `.groups`
##optional input is used or not.

test_that("Output matches direct call to dplyr", {
  small_tbl <- tibble::tribble(~group, ~var1, ~var2,
                       "A", 1, NA,
                       "A", 2, "x",
                       "B", NA, "y",
                       "C", 3, "z")

  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
                            .groups = "drop"),
                count_all_missing_by_group(small_tbl, group)
  )

  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
                            .groups = NULL),
                count_all_missing_by_group(small_tbl, group, NULL)
  )
})
## The second test checks the error handling for malformed `.groups` input arguments.
## This checks that the valid input `NULL` doesn't throw an error because `NULL`
## can play havoc on badly written input checks.
test_that("Checking error handling for .groups input", {
  expect_error(
    count_all_missing_by_group(airquality, Month, "kep")
  )
  expect_no_error(
    count_all_missing_by_group(airquality, Month, NULL)
  )
})
