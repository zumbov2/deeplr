#' List Supported Glossary Language Pairs with the DeepL API Pro
#'
#' \code{supported_glossary_language_pairs} lists all language pairs supported for glossary creation 
#'     in the DeepL API Pro.
#'
#' @importFrom httr GET content add_headers
#' @importFrom purrr transpose
#' @importFrom tibble tibble
#'
#' @param auth_key A string representing the authentication key for the DeepL API Pro. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Pro account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Pro}.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/glossaries#list-supported-glossary-language-pairs}{DeepL API Documentation — Supported Glossary Language Pairs}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' supported_glossary_language_pairs()
#' }
#' 
supported_glossary_language_pairs2 <- function(auth_key) {
  
  # DeepL API call
  response <- 
    httr::GET(
      url = "https://api-free.deepl.com/v2/glossary-language-pairs",
      httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key)))
      )
  
  # Check for HTTP error
  response_check(response)
  
  # Extract supported pairs
  raw <- httr::content(response)
  raw_t <- purrr::transpose(raw$supported_languages)
  
  supported_language_pairs <-
    tibble::tibble(
      source_lang = unlist(raw_t$source_lang),
      target_lang = unlist(raw_t$target_lang)
      )
  
  # Return
  return(supported_language_pairs)
  
}

