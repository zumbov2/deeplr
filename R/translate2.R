#' Translate texts using DeepL
#'
#' \code{translate2} translates texts between English, German, French, Spanish, Portuguese, Italian, Dutch,
#'     Polish and Russian using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
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
#' @param source_lang language of the text to be translated (see below). If parameter \code{is.null}, the API will try to detect
#'     the language of the source.
#' @param target_lang language into which to translate. Can be one of the following:
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
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' translate2("Hallo Welt!", target_lang = "EN")
#'
#' # translate2 applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' purrr::map_chr(txt1, translate2, target_lang = "FR")
#'
#' # translate2 applied to multiple strings (with language detection response)
#' txt2 <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' purrr::map_df(txt2, translate2, target_lang = "ES", get_detect = T)
#'
#' }
#'
translate2 <- function(text, source_lang = NULL, target_lang = "EN", get_detect = FALSE,
                       subdomain = "www2") {

  # Text prep -------------------------------------------------------------------------------------
  text <- text_check2(text)

  # Get source language ---------------------------------------------------------------------------
  if (is.null(source_lang)) source_lang <- detect2(text)

  # Split text into sentences ---------------------------------------------------------------------
  text <- unlist(tokenizers::tokenize_sentences(text))

  # Define jobs -----------------------------------------------------------------------------------
  jobs <- purrr::map(text, list_maker)

  # Generate payload for free API request ---------------------------------------------------------
  payload <-
    list("jsonrpc" = "2.0",
         "method" = "LMT_handle_jobs",
         params = list(
           "jobs" = jobs,
           "lang" = list(
             "source_lang_computed" = source_lang,
             "target_lang" = target_lang,
             "user_preferred_langs" = list("FR", "DE", "EN")
             )
           )
         )

  # DeepL API call --------------------------------------------------------------------------------
  response <- httr::POST(
    paste0("https://", subdomain, ".deepl.com/jsonrpc"),
    body = rjson::toJSON(payload),
    handle = httr::handle("")
  )

  # Check for HTTP error --------------------------------------------------------------------------
  response_check(response)

  # Extract content -------------------------------------------------------------------------------
  translation <- extractor(response, FALSE)
  if (get_detect) translation <- tibble::tibble(translation = translation, source_lang = source_lang)

  return(translation)
}
