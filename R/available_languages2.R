#' List supported languages of DeepL API Free
#'
#' \code{available_languages2} list all supported languages of DeepL API Free.
#'
#' @importFrom httr POST content
#' @importFrom purrr map_chr
#' @importFrom tibble tibble
#'
#' @param auth_key authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' available_languages2(auth_key = "my_key")
#' }
#'
available_languages2 <- function(auth_key = "your_key") {

  # DeepL API call
  response <- httr::POST(
    url = "https://api-free.deepl.com/v2/languages",
    body = list(auth_key = auth_key)
    )

  response_check(response)

  tibble::tibble(
    language = purrr::map_chr(httr::content(response), "language"),
    name = purrr::map_chr(httr::content(response), "name")
    )

}
