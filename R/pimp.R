#' Improve Texts via Round-Trip Translation with the DeepL API Pro
#'
#' \code{pimp} translates a text into a helper language and then back to the original language 
#'     using the DeepL API Pro. This method can be used to refine or rephrase text automatically.
#'
#' @param text A character vector containing the texts to be improved. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language of the input text. If of length 1, the same language is applied to all elements.
#' @param help_lang A string specifying the helper language used for the intermediate translation.
#' @param auth_key A string representing the authentication key for the DeepL API Pro. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Pro account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Pro}. This service may incur costs based on the number 
#'     of translated characters. To view all supported languages, use \code{\link{available_languages}}.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation on Translation}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' pimp(
#'   "In former times I lived in Zurich", 
#'   source_lang = "EN", 
#'   help_lang = "DE"
#'   )
#' }
#' 
pimp <- function(text, source_lang, help_lang, auth_key) {

  # Translate to helper language
  text2 <- translate(text = text, target_lang = help_lang, source_lang = source_lang, auth_key = auth_key)

  # Translate back into source language
  pimped <- translate(text = text2, target_lang = source_lang, source_lang = help_lang, auth_key = auth_key)

  return(pimped)

}

