#' List supported languages of DeepL API Pro
#'
#' \code{available_languages} list all supported languages of DeepL API Pro.
#'
#' @importFrom httr POST content
#' @importFrom purrr map_chr
#' @importFrom tibble tibble
#'
#' @param auth_key authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Pro
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' available_languages(auth_key = "my_key")
#' }
#'
available_languages <- function(auth_key = "your_key") {

  # DeepL API call
  response <- httr::POST(
    url = "https://api.deepl.com/v2/languages",
    body = list(auth_key = auth_key)
    )

  response_check(response)

  tibble::tibble(
    language = purrr::map_chr(httr::content(response), "language"),
    name = purrr::map_chr(httr::content(response), "name")
    )

}
