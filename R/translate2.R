#' Translate texts with DeepL
#'
#' \code{translate2} calls the DeepL API via a JSON-RPC call and translates texts between English, German,
#'     French, Spanish, Italian, Dutch and Polish. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
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
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' translator1 <- function(t) translate2(text = t, target_lang = "FR")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' translator2 <- function(t) translate2(text = t, target_lang = "ES", get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
translate2 <- function(text, source_lang = NULL, target_lang = "EN", get_detect = FALSE, get_alt = FALSE){

  # Text prep -------------------------------------------------------------------------------------
  text <- text_check2(text)

  # Generate payload for free API request ----------------------------------------------------------------
  payload <-
    list("jsonrpc" = "2.0",
         "method" = "LMT_handle_jobs",
         params = list(
           "jobs" = list(
             list("kind" = "default",
                  "raw_en_sentence"= text
                  )
             ),
           "lang" = list(
             "user_preferred_langs" = list(target_lang, source_lang),
             "source_lang_user_selected" = ifelse(is.null(source_lang), "auto", source_lang),
             "target_lang" = target_lang
             )
           )
         )

  response <- httr::POST(
    "https://www.deepl.com/jsonrpc",
    body = rjson::toJSON(payload)
    )

  # Check for HTTP error --------------------------------------------------------------------------
  response_check(response)

  # Extract content -------------------------------------------------------------------------------
  cnt <- rjson::fromJSON(httr::content(response, "text"))
  translations <- cnt$result$translations

  if (get_alt) {

    num <- (length(unlist(translations))-4)/4
    translation <- NULL

    # Get alternatives
    for (i in 1:num) translation <- c(translation, translations[[1]]$beams[[i]]$postprocessed_sentence)

    # Get source language
    if (get_detect) translation <- tibble::tibble(translation = translation, source_lang = cnt$result$source_lang)

  } else {

    translation <- translations[[1]]$beams[[1]]$postprocessed_sentence

    # Get source language
    if (get_detect) translation <- tibble::tibble(translation = translation, source_lang = cnt$result$source_lang)

  }

  return(translation)

}
