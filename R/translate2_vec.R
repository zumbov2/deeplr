#' Translate character vectors element by element using DeepL
#'
#' \code{translate2_vec} translates character vectors between English, German, French, Spanish,
#'     Portuguese, Italian, Dutch, Polish and Russian using the undocumented JSON-RPC DeepL API.
#'     No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text character vector to be translated. A single element must not exceed 5000 characters. Only UTF8-encoded plain text
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
#' # Character vector
#' dat <- c("A dog.", "Un chien.", "Un perro.", "Un cane.", "Een hond.")
#'
#' # Translate
#' translate2_vec(dat, target_lang = "DE")
#' }
#'
translate2_vec <- function(text, source_lang = NULL, target_lang = "EN", get_detect = FALSE,
                           subdomain = "www2") {

  # Inputs variables ----------------------------------------------------------------------------------
  if (length(source_lang) == 1) source_lang <- rep(source_lang, length(text))
  if (length(target_lang) == 1) target_lang <- rep(target_lang, length(text))

  # Without source_lang -------------------------------------------------------------------------------
  if (is.null(source_lang)) {

    # Define function
    translate2_fun_1 <- function(t, tl) translate2(text = t, source_lang = source_lang,
                                                   target_lang = tl, get_detect = get_detect,
                                                   subdomain = subdomain)

    if (!get_detect) translation_vec <- purrr::map2_chr(text, target_lang, translate2_fun_1)
    if (get_detect) translation_vec <- purrr::map2_df(text, target_lang, translate2_fun_1)

  }

  # With source_lang -------------------------------------------------------------------------------
  if (!is.null(source_lang)) {

    # Define function
    translate2_fun_2 <- function(t, sl, tl) translate2(text = t, source_lang = sl,
                                                       target_lang = tl, get_detect = get_detect,
                                                       subdomain = subdomain)


    if (!get_detect) translation_vec <- purrr::pmap_chr(list(t = text, sl = source_lang, tl = target_lang), translate2_fun_2)
    if (get_detect) translation_vec <- purrr::pmap_df(list(t = text, sl = source_lang, tl = target_lang), translate2_fun_2)

  }

  return(translation_vec)

}
