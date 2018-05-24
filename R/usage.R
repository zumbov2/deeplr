#' Get current usage information of a DeepL Pro account
#'
#' \code{usage} returns the character usage and the configured limit for the current period of a DeepL Pro Account.
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#'
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' usage(auth_key = "my_key")
#'
#' }
#'
#'
usage <- function(auth_key = "your_key") {

  # DeepL API usage call --------------------------------------------------------------------------
  response <- httr::GET(
    "https://api.deepl.com/v1/usage",
    query = list(
      "auth_key" = auth_key
      )
    )

  # Check for HTTP error --------------------------------------------------------------------------
  response_check(response)

  # Extract content -------------------------------------------------------------------------------
  unlist(jsonlite::fromJSON(rawToChar(httr::content(response))))

}
