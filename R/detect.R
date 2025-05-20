#' Detect the Language of a Text with the DeepL API Pro
#'
#' \code{detect} identifies the language of a given text using the DeepL API Pro.
#'
#' @param text A character vector containing the texts to classify. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param auth_key A string representing the authentication key for the DeepL API Pro. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Pro account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Pro}. This service may incur costs depending on the number of 
#'     characters submitted. To view all supported languages, use \code{\link{available_languages}}.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' detect("My name is Hans.")
#' }
#' 
detect <- function(text, auth_key) {

  res <- translate(text = text, target_lang = "PL", source_lang = NULL, split_sentences = TRUE,
                   preserve_formatting = FALSE, get_detect = TRUE, auth_key = auth_key)

  source_lang <- res[["source_lang"]]

  return(source_lang)

}
