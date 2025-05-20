#' List Supported Languages of the DeepL API Pro
#'
#' \code{available_languages} returns a list of all languages supported by the DeepL API Pro.
#'
#' @importFrom httr POST add_headers content
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
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Pro}. The function makes an API call to retrieve the 
#'     list of supported languages and returns them in a structured format.
#'
#' @references \href{https://developers.deepl.com/docs/getting-started/supported-languages}{DeepL API Documentation on Supported Languages}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' available_languages()
#' }
#'
available_languages <- function(auth_key) {

  # DeepL API call
  response <- httr::POST(
    url = "https://api.deepl.com/v2/languages",
    httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key)))
    )

  response_check(response)
  raw <- httr::content(response)
  raw_t <- purrr::transpose(raw)
  
  tibble::tibble(
    language = unlist(raw_t$language),
    name = unlist(raw_t$name)
    )
  
  }
