#' Fix and improve texts using DeepL
#'
#' \code{pimp2} translates a text into a help language and then back into the original language
#'     using the undocumented JSON-RPC DeepL API. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
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
#'
#' @export
#'
#' @examples
#' \donttest{
#' pimp2("In former times I lived in Zurich", help_lang = "DE")
#' }
#'
pimp2 <- function(text, help_lang) {

  # Detect language of source
  source_lang <- detect2(text)
  if (source_lang == help_lang) stop("Help language corresponds to the source language.")

  # Translate to helper language
  text2 <- translate2(text = text, source_lang = source_lang, target_lang = help_lang, get_detect = FALSE)

  # Translate back into source language
  pimped <- translate2(text = text2, source_lang = help_lang, target_lang = source_lang, get_detect = FALSE)

  return(pimped)

}


