library(rsample)
library(recipes)

data <- iris
split <- initial_split(data, prop = 0.75, strata = Species)
test_train <- training(split)
test_recipe <- recipe(Species ~., data = test_train)
test_col <- "Species"
