#' Retrieve current usage data of a DeepL Pro account
#'
#' \code{usage} returns the character usage and the configured limit for the current period of a DeepL Pro Account.
#'
#' @importFrom httr GET content
#' @importFrom rjson fromJSON
#'
#' @param auth_key authentication key of the corresponding DeepL Pro account.
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
  unlist(rjson::fromJSON(rawToChar(httr::content(response))))

}
