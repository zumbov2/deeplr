#' Create a Glossary with the DeepL API Pro
#'
#' \code{create_glossary} creates a glossary for a language pair using the DeepL API Pro.
#'
#' @importFrom httr POST content content_type add_headers
#' @importFrom jsonlite toJSON
#' @importFrom tibble as_tibble
#'
#' @param name A string specifying the name to be associated with the glossary.
#' @param source_lang A string specifying the source language code.
#' @param target_lang A string specifying the target language code.
#' @param entries_source_lang A character vector containing the glossary entries in the source language.
#' @param entries_target_lang A character vector containing the glossary entries in the target language.
#' @param return_tibble Logical. If \code{TRUE}, the returned result will be converted to a tibble.
#' @param auth_key A string representing the authentication key for the DeepL API Pro. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Pro account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Pro}. The function sends a request to create a glossary 
#'     and returns the result in a structured format.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/glossaries}{DeepL API Documentation on Glossaries}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' glossary_english <- c("Hello", "Goodbye")
#' glossary_swiss_german <- c("Grüezi", "Adiöö")
#'  
#' create_glossary(
#'   name = "My Glossary",
#'   source_lang = "en",
#'   target_lang = "de",
#'   entries_source_lang = glossary_english,
#'   entries_target_lang = glossary_swiss_german
#' )
#' }
#'
create_glossary <- function(name, source_lang, target_lang, entries_source_lang, entries_target_lang, 
                             return_tibble = F, auth_key) {
  
  # Getting entries in the correct format
  entries_csv <- 
    paste0(
      paste(
        entries_source_lang, 
        entries_target_lang, 
        sep = ","
        ),
      collapse = "\n"
      )
  
  # DeepL API call
  response <- 
    httr::POST(
      url = "https://api.deepl.com/v2/glossaries",
      body = jsonlite::toJSON(
        list(
          name = "My Glossary",
          source_lang = source_lang,
          target_lang = target_lang,
          entries = entries_csv,
          entries_format = "csv"
          ), 
        auto_unbox = TRUE
        ),
      httr::content_type("application/json"),
      httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key)))
      )
  
  # Check for HTTP error
  response_check(response)
  
  # Extract supported pairs
  response <- httr::content(response)
  if (return_tibble) response <- tibble::as_tibble(response)
  
  # Return
  return(response)
  
}

