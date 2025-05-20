#' Delete a Glossary with the DeepL API Free
#'
#' \code{delete_glossary2} deletes a glossary from your DeepL API Free account using its unique ID.
#'
#' @importFrom httr DELETE add_headers
#'
#' @param glossary_id A string specifying the unique ID of the glossary to be deleted.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details Deleting a glossary is permanent and cannot be undone. If needed, you can back up 
#'     glossary entries in advance using \code{\link{get_glossary_entries2}}.
#'
#'     To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}.
#'
#'     For a list of available glossaries and their metadata, see \code{\link{list_glossaries2}}.
#'
#' @return No return value. A confirmation message is printed upon successful deletion.
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/glossaries#delete-a-glossary}{DeepL API Documentation on Glossary Deletion}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' glossary_id <- "example-glossary-id"
#' delete_glossary2(glossary_id)
#' }
delete_glossary2 <- function(glossary_id, auth_key) {
  
  # DeepL API call
  response <- 
    httr::DELETE(
      url = paste0("https://api-free.deepl.com/v2/glossaries/", glossary_id),
      httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key)))
    )
  
  # Check for HTTP error
  response_check(response)
  
  # Success message
  message(sprintf("Glossary '%s' has been successfully deleted.", glossary_id))
  
}


