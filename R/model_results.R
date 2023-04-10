#' KNN model confusion matrix
#'
#' Create the confusion matrix of the fitted KNN model to assess performance
#'
#' @import yardstick
#'
#' @param test_data The testing data for the model
#' @param model The fitted KNN model
#' @param col The column name of the response variable
#'
#' @return A confusion matrix of the model
#' @export
#'
#' @examples
#' split <- rsample::initial_split(iris, prop = 0.75, strata = Species)
#' ex_test <- rsample::testing(split)
#' ex_train <- rsample::training(split)
#' ex_recipe <- recipes::recipe(Species ~., data = ex_train)
#' ex_model <- model_build(ex_train, ex_recipe, "Species")
#' model_result(ex_test, ex_model, "Species")

model_result <- function(test_data, model, col){

prediction <- predict(model, test_data)
bind_cols(test_data)
test_data$pred <- prediction$.pred_class
test_data$col <- as.factor(test_data[,col])

# Assess model accuracy and return the confusion matrix
conf_matrix <- conf_mat(data = test_data, truth = col, estimate = pred)
return(conf_matrix)
}
