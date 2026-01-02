#' @title Convert output of pdftools into a data.frame
#'
#' @author Ronald Hochreiter, \email{ron@@hochreiter.net}
#'
#' @description
#' \code{wordframe_from_pdftext} converts the output of pdftools::pdf_text(file)
#' into a data.frame with one word per row to be further augmented with the
#' respective sentiments.
#'
#' @param pdftext Output of pdftools::pdf_text(file)
#' @param minlength Minimum length of words 
#' 
#' @return data.frame with one word per row of the original file
#' 
#' @export
#' 
#' @examples
#' url <- "https://www.bmeia.gv.at/fileadmin/user_upload/Vertretungen/Astana/Visa/1918_-_2018._Die_Anfaenge_der_Republik_OEsterreich_im_internationalen_Kontext..pdf"
#' content <- pdftools::pdf_text(url(url))
#' words <- wordframe_from_pdftext(content)
#' 
wordframe_from_pdftext <- function(pdftext, minlength = 2) {
  content <- paste(pdftext, collapse = "")
  text.vector <- unlist(strsplit(removePunctuation(stripWhitespace(content)), split = ' '))
  pos.words <- which(nchar(text.vector) > minlength)
  text.frame <- data.frame(word = text.vector[pos.words])
  text.frame$word <- as.character(text.frame$word)
  return(text.frame)
}
