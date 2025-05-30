#' Detect the Language of a Text with the DeepL API Free
#'
#' \code{detect2} identifies the language of a given text using the DeepL API Free.
#'
#' @param text A character vector containing the texts to classify. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, you can translate or detect up to 
#'     500,000 characters per month at no cost. To view all supported languages, use \code{\link{available_languages2}}.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' detect2("My name is Hans.")
#' }
detect2 <- function(text, auth_key) {

  res <- translate2(text = text, target_lang = "PL", source_lang = NULL, split_sentences = TRUE,
                   preserve_formatting = FALSE, get_detect = TRUE, auth_key = auth_key)

  source_lang <- res[["source_lang"]]

  return(source_lang)

}
