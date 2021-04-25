#' Translate texts with DeepL API Free
#'
#' \code{translate2} translates texts between different languages using DeepL API Free.
#'     Use \code{available_languages2} to list all supported languages. An authentication key
#'     is required to use this service. With the DeepL API Free package, developers can translate
#'     up to 500,000 characters per month for free.
#'
#' @importFrom purrr map2_chr map2_dfr pmap_chr pmap_dfr
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param target_lang target language of the translation. If input is of length 1, all elements
#'     are translated into the same language.
#' @param source_lang language of the text to be translated. If parameter \code{is.null}, the
#'     API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' translate2("I like to translate texts.", target_lang = "DE", auth_key = "x")
#'
#' # Translate multiple texts into one target language
#' texts <- c("I like to translate texts.", "Ich übersetze gerne Texte.")
#' translate2(texts, target_lang = "FR", auth_key = "x")
#'
#' # Translate a single text into multiple target languages
#' translate2("I like to translate texts.", target_lang = c("FR", "DE", "IT"), auth_key = "x")
#'
#' # Translate multiple texts into different languages
#' texts <- c("I like to translate texts.", "Ich übersetze gerne Texte.")
#' translate2(texts, target_lang = c("FR", "IT"), auth_key = "x")
#'
#' }
#'
translate2 <- function(text, target_lang = "EN", source_lang = NULL, split_sentences = TRUE,
                      preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  # Inputs variables
  if (length(source_lang) == 1) source_lang <- rep(source_lang, length(text))
  if (length(target_lang) == 1) target_lang <- rep(target_lang, length(text))
  if (length(target_lang) > 1 & length(text) == 1) text <- rep(text, length(target_lang))

  # Without source_lang
  if (is.null(source_lang)) {

    if (!get_detect) {

      translation_vec <- purrr::map2_chr(
        text,
        target_lang,
        translate2_wh,
        split_sentences = split_sentences,
        preserve_formatting = preserve_formatting,
        get_detect = get_detect,
        auth_key = auth_key
      )

    } else {

      translation_vec <- purrr::map2_dfr(
        text,
        target_lang,
        translate2_wh,
        split_sentences = split_sentences,
        preserve_formatting = preserve_formatting,
        get_detect = get_detect,
        auth_key = auth_key
      )

    }

  }

  # With source_lang
  if (!is.null(source_lang)) {

    if (!get_detect) {

      translation_vec <- purrr::pmap_chr(
        list(text = text, target_lang = target_lang, source_lang = source_lang),
        translate2_wh,
        split_sentences = split_sentences,
        preserve_formatting = preserve_formatting,
        get_detect = get_detect,
        auth_key = auth_key
      )

    } else {

      translation_vec <- purrr::pmap_chr(
        list(text = text, target_lang = target_lang, source_lang = source_lang),
        translate2_wh,
        split_sentences = split_sentences,
        preserve_formatting = preserve_formatting,
        get_detect = get_detect,
        auth_key = auth_key
      )

    }

  }

  # Return
  return(translation_vec)

}
