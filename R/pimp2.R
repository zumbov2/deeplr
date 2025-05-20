#' Improve Texts via Round-Trip Translation with the DeepL API Free
#'
#' \code{pimp2} translates a text into a helper language and then back to the original language 
#'     using the DeepL API Free. This method can be used to refine or rephrase text automatically.
#'
#' @param text A character vector containing the texts to be improved. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language of the input text. If of length 1, the same language is applied to all elements.
#' @param help_lang A string specifying the helper language used for the intermediate translation.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, you can translate up to 
#'     500,000 characters per month at no cost. To view all supported languages, use \code{\link{available_languages2}}.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation on Translation}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' pimp2(
#'   text = "In former times I lived in Zurich",
#'   source_lang = "EN",
#'   help_lang = "DE"
#' )
#' }
#' 
pimp2 <- function(text, source_lang, help_lang, auth_key) {

  # Translate to helper language
  text2 <- translate2(text = text, target_lang = help_lang, source_lang = source_lang, auth_key = auth_key)

  # Translate back into source language
  pimped <- translate2(text = text2, target_lang = source_lang, source_lang = help_lang, auth_key = auth_key)

  return(pimped)

}

