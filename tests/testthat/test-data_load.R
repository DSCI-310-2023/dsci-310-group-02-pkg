library(testthat)

test_url <- "https://raw.githubusercontent.com/kashish1928/white_wine_dataset/main/winequality-white.csv"
test_sep <- ";"

# test input
testthat::test_that("data_load should return error when the data type of input
                    argument is wrong", {
  expect_error(data_load("https://xxx", test_sep))
  expect_error(data_load(test_url, 123))
  expect_error(data_load("https://xxx", 123))
})

# test output
testthat::test_that("data_load function returns the correct dataframe", {
  expect_true(is.data.frame(data_load(test_url, test_sep)))
})
