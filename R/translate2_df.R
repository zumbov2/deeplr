#' Translate a character vector of a data frame element by element using DeepL
#'
#' \code{translate2_df} translates a character vector of a given data frame between English, German, French,
#'     Spanish, Portuguese, Italian, Dutch, Polish and Russian using the undocumented JSON-RPC DeepL API.
#'     No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param data a data frame.
#' @param column_name vector to be translated. A single element must not exceed 5000 characters. Only UTF8-encoded plain text
#'     is supported. Elements may contain multiple sentences.
#' @param source_lang vector containing the source languages of the texts to be translated (see below). If argument \code{is.null},
#'     the API will try to detect the languages of the source. If input is of length 1, the same source language is applied to all elements.
#' @param target_lang vector containing the languages into which to translate. If input is of length 1, all elements are translated
#'     into the same language. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#' @param get_detect if \code{TRUE}, the languages detected for the source texts are also included in the response. It corresponds to
#'     the values of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated texts are returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translations
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated texts.
#' \item \code{source_lang} detected or specified languages of the input texts.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Data frame
#' dat <- data.frame(
#'   text = c("La seule facon de savoir ce qui se passe est de perturberle systeme.",
#'            "The whole problem with the world is that fools are always so certain of themselves"
#'            ), stringsAsFactors = F)
#'
#' # Translate
#' translate2_df(dat, "text", target_lang = "DE")
#' }
#'
translate2_df <- function(data, column_name, source_lang = NULL, target_lang = "EN", get_detect = FALSE,
                          subdomain = "www2") {

  # Vector
  vec <- data[[column_name]]

  # Translate
  translation_df <- translate2_vec(text = vec, source_lang = source_lang, target_lang = target_lang, get_detect = get_detect,
                             subdomain = subdomain)

  # Return
  return(translation_df)

}
