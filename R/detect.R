#' Language detection using DeepL API Pro
#'
#' \code{detect} guesses the language of a text using DeepL API Pro.
#'     Use \code{available_languages} to list all supported languages. An authentication key
#'     is required to use this service. The service costs depending on the number of translated characters.
#'
#' @param text character vector with texts to classify. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Pro
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' detect("My name is Hans.", auth_key = "my_key")
#' }
#'
detect <- function(text, auth_key = "your_key") {

  res <- translate(text = text, target_lang = "PL", source_lang = NULL, split_sentences = TRUE,
                   preserve_formatting = FALSE, get_detect = TRUE, auth_key = auth_key)

  source_lang <- res[["source_lang"]]

  return(source_lang)

}
