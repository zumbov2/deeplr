#' Issue a DeepL Translator API query
#'
#' \code{translate} calls the DeepL Translator API and translates texts between English, German,
#'     French, Spanish, Italian, Dutch and Polish.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils object.size
#' @importFrom httr GET status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
#' @param source_lang language of the text to be translated (see below). If parameter \code{is.null}, the API will detect
#'     the language of the text and translate it.
#' @param target_lang language into which to translate. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' translate("Hallo Welt!", target_lang = "EN", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' translator1 <- function(t) translate(text = t, target_lang = "FR", auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' translator2 <- function(t) translate(text = t, target_lang = "ES", get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
translate <- function(text, source_lang = NULL, target_lang = "EN", tag_handling = NULL,
                      split_sentences = TRUE, preserve_formatting = FALSE, get_detect = FALSE,
                      auth_key = "your_key") {

  # Text prep -------------------------------------------------------------------------------------
  text_check(text)

  # Logical to numeric ----------------------------------------------------------------------------
  split_sentences <- as.numeric(split_sentences)
  preserve_formatting <- as.numeric(preserve_formatting)

  # DeepL API call --------------------------------------------------------------------------------
  response <- httr::GET(
    "https://api.deepl.com/v1/translate",
    query = list(
      text = text,
      source_lang = source_lang,
      target_lang = target_lang,
      tag_handling = tag_handling,
      split_sentences = split_sentences,
      preserve_formatting = preserve_formatting,
      auth_key = auth_key
    )
  )

  # Check for HTTP error --------------------------------------------------------------------------
  response_check(response)

  # Extract content -------------------------------------------------------------------------------
  if (get_detect) {
    translation <- tibble::tibble(
      translation = unlist(httr::content(response))[2],
      source_lang = unlist(httr::content(response))[1]
    )
  } else {
    translation <- unname(unlist(httr::content(response))[2])
  }

  return(translation)
}
