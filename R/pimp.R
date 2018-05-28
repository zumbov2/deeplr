#' Fix and improve texts using the official DeepL Translator API
#'
#' \code{pimp} translates a text into a help language and then back into the original language
#'     using the official DeepL Translator API. To use this service, an authentication key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
#' @param help_lang language used as a help language for reverse translation. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @export
#'
#' @examples
#' \donttest{
#' pimp("In former times I lived in Zurich", help_lang = "DE", auth_key = "my_key")
#' }
#'
pimp <- function(text, help_lang, auth_key = "your_key") {

  # Detect language of source
  source_lang <- detect(text, auth_key = auth_key)
  if (source_lang == help_lang) stop("Help language corresponds to the source language.")

  # Translate to helper language
  text2 <- translate(text = text, source_lang = source_lang, target_lang = help_lang, auth_key = auth_key)

  # Translate back into source language
  pimped <- translate(text = text2, source_lang = help_lang, target_lang = source_lang, auth_key = auth_key)

  return(pimped)

}

