library(rsample)
library(recipes)

data <- iris
split <- initial_split(iris, prop = 0.75, strata = Species)
test_testing <- testing(split)
test_training <- training(split)
test_recipe <- recipe(Species ~., data = test_training)
test_model <- model_build(test_training, test_recipe, "Species")
test_col <- "Species"
