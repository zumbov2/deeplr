#' Retrieve Usage Data from a DeepL API Free Account
#'
#' \code{usage2} returns the character usage and configured character limit for the current billing period
#'     of a DeepL API Free account.
#'
#' @importFrom httr POST content
#'
#' @param auth_key Character. Your DeepL API authentication key. If missing, the function uses 
#'   the \code{DEEPL_API_KEY} environment variable. You can set it using 
#'   \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} file for persistent use.
#'
#' @details
#' To use this function, you must register for a DeepL API Free account at 
#' \url{https://www.deepl.com/pro#developer}. The Free plan includes up to 500,000 characters per month.
#'
#' @return A named list or structured object containing:
#' \itemize{
#'   \item \code{character_count} – Number of characters used in the current billing period.
#'   \item \code{character_limit} – Total character limit for the current billing period.
#' }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/usage/get-usage-information}{DeepL API Documentation — Usage}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' usage2()
#' }
#' 
usage2 <- function(auth_key) {

  # DeepL API call
  response <- httr::POST(
    url = "https://api-free.deepl.com/v2/usage",
    httr::add_headers("Authorization" = paste("DeepL-Auth-Key", get_key(auth_key)))
    )

  response_check(response)

  httr::content(response)

}
