library(ggplot2)

# helper data
test_data <- iris
helper_hist <- test_data %>%
  ggplot(mapping = (aes(x = .test_data[["Species"]],
                                fill = .test_data[["Species"]]))) +
  geom_bar() +
  labs(x = "Category", y = "Number of Occurrences", fill = "Category") +
  ggtitle("Histogram of Each Category Count")
