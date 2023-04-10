#' Plot a histogram for the count of each categorical variable
#'
#' @import dplyr
#' @import ggplot2
#' @param data The dataframe includes the grp_var variable
#' @param grp_var The categorical column which is used for grouping other variables
#'
#' @return A histogram that shows the count of each categorical variable
#' @export
#'
#' @examples hist_plot(iris, "Species")


hist_plot <- function(data, grp_var){

  if(!is.data.frame(data)){
    stop("'Data' must be a dataframe")
  }

  if(!is.character(grp_var)){
    stop("'grp_var' must be a string(The name of the column)")
  }

  # create a bar chart that counts categorical variables
  options(repr.plot.width = 12, repr.plot.height = 8)
  grp_df <- data %>% group_by(.data[[grp_var]])

  categorical_distribution <- grp_df %>%
    ggplot(mapping = (aes(x = .data[[grp_var]], fill = .data[[grp_var]]))) +
    geom_bar() +
    labs(x = "Category", y = "Number of Occurrences", fill = "Category") +
    ggtitle("Histogram of Each Category Count")

  return(categorical_distribution)
}

