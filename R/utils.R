#' @importFrom utf8 utf8_valid as_utf8
#'
#' @noRd
text_check <- function(text) {

  # Coerce non-character vectors to a character vector
  if (!is.character(text)) message("Text input had to be coerced to a character vector.")
  text <- as.character(text)

  # Check if text can be translated to valid UTF-8 string
  if (!utf8::utf8_valid(text)) stop("Text input cannot be translated to a valid UTF-8 string.")
  text <- utf8::as_utf8(text)

  return(text)
}

#' @importFrom utf8 utf8_valid as_utf8
#'
#' @noRd
text_check2 <- function(text) {

  # Coerce non-character vectors to a character vector
  if (!is.character(text)) message("Text input had to be coerced to a character vector.")
  text <- as.character(text)

  # Check if text can be translated to valid UTF-8 string
  if (!utf8::utf8_valid(text)) stop("Text input cannot be translated to a valid UTF-8 string.")
  text <- utf8::as_utf8(text)

  # Check for maximum text length
  if (nchar(text) > 5000) stop("Text input must not exceed 5000 characters for free API calls.")

  return(text)
}

#' @importFrom httr status_code
#'
#' @noRd
response_check <- function(response) {
  status <- httr::status_code(response)
  if (status == 400) stop("Wrong request, please check your parameters. (HTTP error ", status, ")")
  if (status == 403) stop("Please supply a valid auth_key parameter. (HTTP error ", status, ")")
  if (status == 413) stop("The request size exceeds the current limit. (HTTP error ", status, ")")
  if (status == 414) stop("Request-URI Too Large. (HTTP error ", status, ")")
  if (status == 429) stop("Please wait and send your request once again. (HTTP error ", status, ")")
  if (status == 456) stop("The character limit has been reached. (HTTP error ", status, ")")
}
