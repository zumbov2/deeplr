#' Language detection using DeepL API Free
#'
#' \code{detect2} guesses the language of a text using DeepL API Free.
#'     Use \code{available_languages} to list all supported languages. An authentication key
#'     is required to use this service. With the DeepL API Free package, developers can translate
#'     up to 500,000 characters per month for free.
#'
#' @param text character vector with texts to classify. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' detect2("My name is Hans.", auth_key = "my_key")
#' }
#'
detect2 <- function(text, auth_key = "your_key") {

  res <- translate2(text = text, target_lang = "PL", source_lang = NULL, split_sentences = TRUE,
                   preserve_formatting = FALSE, get_detect = TRUE, auth_key = auth_key)

  source_lang <- res[["source_lang"]]

  return(source_lang)

}
