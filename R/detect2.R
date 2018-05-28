#' Detect the language of a text using DeepL
#'
#' \code{detect2} detects the language of a text using the undocumented JSON-RPC DeepL API. English, German, French,
#'     Spanish, Italian, Dutch and Polish are currently available. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#'
#' @export
#'
#' @examples
#' \donttest{
#' detect2("My name is Hans.")
#'
#' }
detect2 <- function(text) {

  # Text prep -------------------------------------------------------------------------------------
  text <- text_check2(text)

  # Generate payload for free API request ---------------------------------------------------------
  payload <-
    list("jsonrpc" = "2.0",
         "method" = "LMT_split_into_sentences",
         params = list(
           "texts" = list(text),
           "lang" = list(
             "lang_user_selected" = "auto",
             "user_preferred_langs" = list("FR", "DE", "EN")
           )
         )
    )

  # DeepL API call via JSON-RPC -------------------------------------------------------------------
  response <- httr::POST(
    "https://www.deepl.com/jsonrpc",
    body = rjson::toJSON(payload)
  )

  # Check for HTTP error --------------------------------------------------------------------------
  response_check(response)

  # Extract language detected ---------------------------------------------------------------------
  cnt <- rjson::fromJSON(httr::content(response, "text"))
  source_lang <- cnt$result$lang

  return(source_lang)

}
