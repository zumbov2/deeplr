#' @importFrom utf8 utf8_valid as_utf8
#'
#' @noRd
text_check <- function(text) {

  # Check for text
  if (is.null(text)) stop("Text input is missing.")

  # Coerce non-character vectors to a character vector
  if (!is.character(text)) message("Text input had to be coerced to a character vector.")
  text <- as.character(text)

  # Check if text can be translated to valid UTF-8 string
  if (!utf8::utf8_valid(text)) stop("Text input cannot be translated to a valid UTF-8 string.")
  text <- utf8::as_utf8(text)

  return(text)
}

#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom stringr str_sub
#'
#' @noRd
text_check2 <- function(text) {

  # Check for text
  if (is.null(text)) stop("Text input is missing.")

  # Coerce non-character vectors to a character vector
  if (!is.character(text)) message("Text input had to be coerced to a character vector.")
  text <- as.character(text)

  # Check if text can be translated to valid UTF-8 string
  if (!utf8::utf8_valid(text)) stop("Text input cannot be translated to a valid UTF-8 string.")
  text <- utf8::as_utf8(text)

  # Check for maximum text length
  if (nchar(text) > 5000) {

    text <- stringr::str_sub(text, 1, 5000)
    message("Text input shortened to 5000 characters.")

  }

  # Check for minimal text length
  if (nchar(text) == 0) stop("Text input is empty.")

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

#' @noRd
list_maker <- function(text) list("kind" = "default", "raw_en_sentence" = text)

#' @importFrom httr content
#'
#' @noRd
extractor <- function(response, alternatives) {

    cnt <- rjson::fromJSON(httr::content(response, "text"))
    translations <- cnt$result$translations

    # Initiate output
    output <- NULL
    number_of_sentences <- length(translations)

    # No alternatives
    if (!alternatives | is.null(alternatives)) {

      translation <- NULL
      for (i in 1:number_of_sentences) {

        sentence <- translations[[i]]$beams[[1]]$postprocessed_sentence
        translation <- c(translation, sentence)

      }
      output <- paste0(translation, collapse = " ")
    }

    # Return
    return(output)

  }
