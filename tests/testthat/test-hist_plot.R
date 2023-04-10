library(ggplot2)
library(testthat)
library(vdiffr)
library(tidyverse)
# test input
testthat::test_that("data_plot should return error when the data type of input
                    argument is wrong", {
  expect_error(hist_plot("iris", "Species"))
  expect_error(hist_plot(iris, Species))
})

# test output
testthat::test_that("data_plot function returns the correct plots", {
  pf <- hist_plot(iris, "Species")
  expect_doppelganger("function returns correct hist", pf)
  expect_equal(ggtitle(pf)$labels, ggtitle(helper_hist)$labels)
})

#test input
testthat::test_that("data_plot function returns an error if the input is not a string", {
  expect_error(hist_plot(iris, 123))
})

