#' @title Complete SentiWS2 datasets
#'
#' @author Ronald Hochreiter, \email{ron@@hochreiter.net}
#'
#' @description
#' \code{sentiws2} returns two data.frames with all positive and negative 
#' sentiments 
#' 
#' @return two data.sets with the original SentiWS2 dictionaries
#' 
#' @export
#' 
#' @examples
#' sentiws2()
#' 
sentiws2 <- function() {
  data(sentiws2)
  return(sentiws2)
}
