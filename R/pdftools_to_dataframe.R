pdftools_to_dataframe <- function(pdftext, minlength = 2) {
  content <- paste(pdftext, collapse = "")
  text.vector <- unlist(strsplit(removePunctuation(stripWhitespace(content)), split = ' '))
  pos.words <- which(nchar(text.vector) > minlength)
  text.frame <- data.frame(word = text.vector[pos.words])
  text.frame$word <- as.character(text.frame$word)
  return(text.frame)
}
