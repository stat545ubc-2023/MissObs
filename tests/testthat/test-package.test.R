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