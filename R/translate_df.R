#' Translate a character vector of a data frame element by element using DeepL
#'
#' \code{translate_df} translates a character vector of a given data frame between  English, German, French,
#'     Spanish, Portuguese, Italian, Dutch, Polish and Russian using the official DeepL Translator API. To use
#'     this service, an authentication key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param data a data frame.
#' @param column_name vector to be translated. Only UTF8-encoded plain text is supported. Elements may contain multiple sentences.
#'     The element wise request size should not exceed 30kbytes.
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
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences by element. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the languages detected for the source texts are also included in the response. It corresponds to
#'     the values of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated texts are returned.
#' @param auth_key DeepLauthentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translations is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated texts.
#' \item \code{source_lang} detected or specified languages of the input texts.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Data frame
#' dat <- data.frame(
#'   text = c("La seule facon de savoir ce qui se passe est de perturberle systeme.",
#'            "The whole problem with the world is that fools are always so certain of themselves."
#'            ), stringsAsFactors = F)
#'
#' # Translate
#' translate_df(dat, "text", target_lang = "DE", auth_key = "x")
#' }
#'
translate_df <- function(data, column_name, source_lang = NULL, target_lang = "EN", tag_handling = NULL,
                         split_sentences = TRUE, preserve_formatting = FALSE, get_detect = FALSE,
                         auth_key = "your_key") {

  # Vector
  vec <- data[[column_name]]

  # Translate
  translation_df <- translate_vec(text = vec, source_lang = source_lang, target_lang = target_lang,
                                  tag_handling = tag_handling, split_sentences = split_sentences,
                                  preserve_formatting = preserve_formatting, get_detect = get_detect,
                                  auth_key = auth_key)

  # Return
  return(translation_df)

}
