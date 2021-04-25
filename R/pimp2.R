#' Fix and improve texts using DeepL API Free
#'
#' \code{pimp2} translates a text into a support language and back into the original language
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector with texts to be improved. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be improved. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param help_lang language used as a help language for reverse translation.
#' @param auth_key authentication key.
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
#' pimp2(
#'     text = "In former times I lived in Zurich",
#'     source_lang = "EN",
#'     help_lang = "DE",
#'     auth_key = "my_key"
#'     )
#' }
#'
pimp2 <- function(text, source_lang, help_lang, auth_key = "your_key") {

  # Translate to helper language
  text2 <- translate2(text = text, target_lang = help_lang, source_lang = source_lang, auth_key = auth_key)

  # Translate back into source language
  pimped <- translate2(text = text2, target_lang = source_lang, source_lang = help_lang, auth_key = auth_key)

  return(pimped)

}

