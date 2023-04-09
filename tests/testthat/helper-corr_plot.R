library(ggplot2)

# helper data
test_data <- mtcars
test_data_na <- data.frame(x=c(), y=c(), z=c())

helper_corr <- ggpairs(test_data, upper = list(continuous = wrap("cor", size = 2)),
                 lower = list(continuous = wrap("points", size = .01)))

# adjust the titles' size and angle
helper_corr <- helper_corr + theme(text = element_text(size=8),
                       axis.text.x = element_text(angle=90, hjust=1))
# correlation matrix plot
cor_pair <- ggcorr(test_data, label = TRUE, label_round = 2)

# get the color from the correlation matrix plot
cor_g <- ggplotGrob(cor_pair)
colors <- cor_g$grobs[[6]]$children[[3]]$gp$fill

# change the background color of matrix of plots
idx <- 1
c <- ncol(test_data)
for (k1 in 1:(c-1)) {
  for (k2 in (k1+1):(c-1)) {
    plt <- getPlot(helper_corr ,k1, k2) +
      theme(panel.background = element_rect(fill = colors[idx], color="white"),
            panel.grid.major = element_line(color= colors[idx]))
    helper_corr <- putPlot(helper_corr,plt,k1,k2)
    idx <- idx+1
  }
}
