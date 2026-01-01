#' @title Assign positive and negative sentiment values
#'
#' @author Ronald Hochreiter, \email{ron@@hochreiter.net}
#'
#' @description
#' \code{sentiments} augments the given data.frame of single words with both
#' positive as well as negative sentiment values if a match is found
#'
#' @param words Linear term (vector) of the objective function
#' 
#' @return a list with two data.frames containing all positive and negative
#' sentiments of the given data.frame of words
#' 
#' @export
#' 
#' @examples
#' url <- "https://www.bmeia.gv.at/fileadmin/user_upload/Vertretungen/Astana/Visa/1918_-_2018._Die_Anfaenge_der_Republik_OEsterreich_im_internationalen_Kontext..pdf"
#' content <- pdftools::pdf_text(url(url))
#' words <- pdftools_to_dataframe(content)
#' sentiment <- sentiments(words)
#' nrow(sentiment[["positive"]])
#' nrow(sentiment[["negative"]])
#' 
sentiments <- function(words) {
  data(sentiws2)
  sentiments.pos <- words %>% inner_join(sentiws.pos, relationship = "many-to-many")
  sentiments.neg <- words %>% inner_join(sentiws.neg, relationship = "many-to-many")
  return(list(positive = sentiments.pos, negative = sentiments.neg))
}
