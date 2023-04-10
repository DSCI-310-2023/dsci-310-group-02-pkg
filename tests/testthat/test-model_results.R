library(testthat)

# test input
testthat::test_that("model_results should return error when the data type of input
                    argument is wrong", {
  expect_error(model_results("test_testing", test_model, test_col))
  expect_error(model_results(test_testing, "test_model", test_col))
  expect_error(model_results(test_testing, test_model, 2))
  expect_error(model_results("test_testing", "test_model", 2))
})

# test output
testthat::test_that("model_results function returns the correct confusion matrix", {
  cm <- model_results(test_testing, test_model, test_col)
  expect_type(cm, "list")
})
