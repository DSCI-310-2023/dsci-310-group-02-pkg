#' Create a correlation matrix plot for variable pairs
#'
#' This function takes the variable pairs in the data to create a correlation
#' matrix with the heatmap of correlation values
#'
#' @param data The dataframe
#' @import GGally
#' @return A correlation matrix for variable pairs in data
#' @export
#'
#' @examples corr_plot(mtcars)

corr_plot <- function(data){

  if(!is.data.frame(data)){
    stop("'Data' must be a dataframe")
  }

  if(nrow(data) == 0){
    stop("'Data' must be a dataframe with rows data")
  }

  pairs <- ggpairs(data, upper = list(continuous = wrap("cor", size = 2)),
                   lower = list(continuous = wrap("points", size = .01)))

  # adjust the titles' size and angle
  pairs <- pairs + theme(text = element_text(size=8),
                         axis.text.x = element_text(angle=90, hjust=1))
  # correlation matrix plot
  cor_pair <- ggcorr(data, label = TRUE, label_round = 2)

  # get the color from the correlation matrix plot
  cor_g <- ggplotGrob(cor_pair)
  colors <- cor_g$grobs[[6]]$children[[3]]$gp$fill

  # change the background color of matrix of plots
  idx <- 1
  c <- ncol(data)
  for (k1 in 1:(c-1)) {
    for (k2 in (k1+1):(c-1)) {
      plt <- getPlot(pairs,k1,k2) +
        theme(panel.background = element_rect(fill = colors[idx], color="white"),
              panel.grid.major = element_line(color= colors[idx]))
      pairs <- putPlot(pairs,plt,k1,k2)
      idx <- idx+1
    }
  }
  return(pairs)
}
