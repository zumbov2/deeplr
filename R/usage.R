#' Retrieve Usage Data from a DeepL API Pro Account
#'
#' \code{usage} returns the character usage and configured character limit for the current billing period
#'     of a DeepL API Pro account.
#'
#' @importFrom httr POST content
#'
#' @param auth_key Character. Your DeepL API authentication key. If missing, the function uses 
#'   the \code{DEEPL_API_KEY} environment variable. You can set it using 
#'   \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} file for persistent use.
#'
#' @details
#' To use this function, you must register for a DeepL API Pro account at 
#' \url{https://www.deepl.com/pro#developer}.
#'
#' @return A named list or structured object containing:
#' \itemize{
#'   \item \code{character_count} – Number of characters used in the current billing period.
#'   \item \code{character_limit} – Total character limit for the current billing period.
#' }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/usage-and-quota}{DeepL API Documentation — Usage}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' usage()
#' }
#' 
usage <- function(auth_key) {

  # DeepL API call
  response <- httr::POST(
    url = "https://api.deepl.com/v2/usage",
    httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key)))
    )

  response_check(response)

  httr::content(response)

}
