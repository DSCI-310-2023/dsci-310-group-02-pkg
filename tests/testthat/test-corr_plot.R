library(ggplot2)
library(testthat)
library(vdiffr)

# test input
testthat::test_that("corr_plot should return error when the data type of input
                    argument is wrong", {
  expect_error(corr_plot("mtcars"))
  expect_error(corr_plot(test_data_na))
})

# test output
testthat::test_that("corr_plot function returns the correct plots", {
  pf <- corr_plot(mtcars)
  expect_doppelganger("function returns correct correlation matrix", pf)
  expect_equal(ggtitle(pf)$labels, ggtitle(helper_corr)$labels)
})

