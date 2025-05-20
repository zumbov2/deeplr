#' List All Glossaries from the DeepL API Free
#'
#' \code{list_glossaries2} retrieves a list of all glossaries and their metadata associated with your DeepL API Free account. 
#' Note that glossary entries themselves are not included.
#'
#' @importFrom httr GET add_headers content
#' @importFrom purrr transpose
#' @importFrom tibble tibble
#'
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/glossaries#list-all-glossaries}{DeepL API Documentation on Glossaries}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' list_glossaries2()
#' }
#'
list_glossaries2 <- function(auth_key) {

  # DeepL API call
  response <- 
    httr::GET(
      url = "https://api-free.deepl.com/v2/glossaries",
      httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key)))
      )
  
  # Check for HTTP error
  response_check(response)
  
  # Extract
  raw <- httr::content(response)
  glossaries <- purrr::transpose(raw$glossaries)
  
  res <- 
    tibble::tibble(
      glossary_id = unlist(glossaries$glossary_id),
      name = unlist(glossaries$name),
      ready = unlist(glossaries$ready),
      source_lang = unlist(glossaries$source_lang),
      target_lang = unlist(glossaries$target_lang),
      creation_time = unlist(glossaries$creation_time),
      entry_count = unlist(glossaries$entry_count)
      )
  
    # Return
  return(res)
  
}

