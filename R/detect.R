#' Detect the language of a text using the official DeepL Translator API
#'
#' \code{detect} detects the language of a text using the official DeepL Translator API. English, German, French,
#'     Spanish, Italian, Dutch and Polish are currently available. To use this service, an authentication key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @export
#'
#' @examples
#' \donttest{
#' detect("My name is Hans.", auth_key = "my_key")
#'
#' }
detect <- function(text, auth_key = "your_key") {

  res <- translate(text = text, source_lang = NULL, target_lang = "PL", tag_handling = NULL,
            split_sentences = TRUE, preserve_formatting = FALSE, get_detect = TRUE,
            auth_key = auth_key)

  source_lang <- res$source_lang

  return(source_lang)

}
