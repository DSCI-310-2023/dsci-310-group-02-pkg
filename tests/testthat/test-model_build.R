library(testthat)
library(vdiffr)

# test input
testthat::test_that("model_build should return error when the data type of input
                    argument is wrong", {
  expect_error(model_build(
  "iris", recipe(Species ~., data = iris), "Species"))
  expect_error(model_build(
  iris, "recipe", "Species"))
  expect_error(model_build(
  iris, recipe(Species ~., data = iris), 2))
})

# test output
testthat::test_that("model_build function returns the fitted KNN model without any error", {
  expect_no_error(model_build(test_train, test_recipe, test_col))
})
