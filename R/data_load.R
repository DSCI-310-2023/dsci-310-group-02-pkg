#' Create the Data frame
#'
#' Read the data set from the URL and return it as a data frame
#'
#' @importFrom readr read_delim
#'
#' @param url The URL (in string) from where to download the data
#' @param sperator The separator (in string) used in the file
#'
#' @return A data frame with separated columns
#' @export
#'
#' @examples
#' data_load(
#' "https://raw.githubusercontent.com/kashish1928/white_wine_dataset/main/winequality-white.csv",
#' ";")

data_load <- function(url, sperator = ';') {
  data <- read_delim(url, delim = sperator)
  return(data)
}
