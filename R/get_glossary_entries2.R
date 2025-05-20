#' Retrieve Glossary Entries with the DeepL API Free
#'
#' \code{get_glossary_entries2} retrieves all term pairs from a specified glossary using the DeepL API Free.
#'     For a list of available glossaries, see \code{\link{list_glossaries2}}.
#'
#' @importFrom httr GET add_headers content accept
#' @importFrom readr read_tsv
#' @importFrom tibble tibble
#'
#' @param glossary_id A string specifying the unique ID of the glossary whose entries you want to retrieve.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details Glossaries are custom dictionaries consisting of source-target term pairs. The DeepL API returns these entries 
#'     as tab-separated values (TSV). This function parses and converts them into a tidy tibble for further analysis.
#'
#'     To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}.
#'
#' @return A tibble with two columns representing the source and target language terms. 
#'     Column names are automatically inferred from the glossary's language pair.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/glossaries#get-glossary-entries}{DeepL API Documentation — Get Glossary Entries}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' glossary_id <- "your-glossary-id"
#' entries <- get_glossary_entries2(glossary_id)
#' }
#' 
get_glossary_entries2 <- function(glossary_id, auth_key) {
  
  # DeepL API call
  response <- 
    httr::GET(
      url = paste0("https://api-free.deepl.com/v2/glossaries/", glossary_id),
      httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key))),
      httr::accept("text/tab-separated-values")
      )
  
  source_lang <- toupper(httr::content(response)[["source_lang"]])
  target_lang <- toupper(httr::content(response)[["target_lang"]])
  
  # DeepL API call
  response <- 
    httr::GET(
      url = paste0("https://api-free.deepl.com/v2/glossaries/", glossary_id, "/entries"),
      httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key))),
      httr::accept("text/tab-separated-values")
      )
  
  # Check for HTTP error
  response_check(response)
  
  # Extract
  entries <- 
    readr::read_tsv(
    file = response[["content"]], 
    col_names = c(source_lang, target_lang), 
    progress = FALSE, 
    show_col_types = FALSE
    )
  
  # Return
  return(entries)
  
}

