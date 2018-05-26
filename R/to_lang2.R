#' Translate a text into English with DeepL
#'
#' \code{toEnglish2} calls the DeepL API via a JSON-RPC call and translates a text from German, French,
#'     Spanish, Italian, Dutch or Polish into English. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toEnglish2("Hallo Welt!", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' translator1 <- function(t) toEnglish2(text = t)
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' translator2 <- function(t) toEnglish2(text = t, get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
#'
toEnglish2 <- function(text, source_lang = NULL, get_detect = FALSE, get_alt = FALSE) {

  translate2(text = text, source_lang = source_lang, target_lang = "EN", get_detect = get_detect, get_alt = get_alt)

}

#' Translate a text into German with DeepL
#'
#' \code{toGerman2}  calls the DeepL API via a JSON-RPC call and translates a text from English, French,
#'     Spanish, Italian, Dutch or Polish into German. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#' If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toGerman2("Hallo Welt!", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toGerman2(text = t)
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Je suis médecin.", "I'm from Wales")
#' translator2 <- function(t) toGerman2(text = t, get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
#'
toGerman2 <- function(text, source_lang = NULL, get_detect = FALSE, get_alt = FALSE) {

  translate2(text = text, source_lang = source_lang, target_lang = "DE", get_detect = get_detect, get_alt = get_alt)

}

#' Translate a text into French with DeepL
#'
#' \code{toFrench2} calls the DeepL API via a JSON-RPC call and translates a text from English, German,
#'     Spanish, Italian, Dutch or Polish into French. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{ES} Spanish
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toFrench2("Hallo Welt!", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toFrench2(text = t)
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toFrench2(text = t, get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toFrench2 <- function(text, source_lang = NULL, get_detect = FALSE, get_alt = FALSE) {

  translate2(text = text, source_lang = source_lang, target_lang = "FR", get_detect = get_detect, get_alt = get_alt)

}

#' Translate a text into Spanish with DeepL
#'
#' \code{toSpanish2} calls the DeepL API via a JSON-RPC call and translates a text from English, German,
#'     French, Italian, Dutch or Polish into Spanish. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toSpanish2("Hallo Welt!", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toSpanish2(text = t)
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toSpanish2(text = t, get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
#'
toSpanish2 <- function(text, source_lang = NULL, get_detect = FALSE, get_alt = FALSE) {

  translate2(text = text, source_lang = source_lang, target_lang = "ES", get_detect = get_detect, get_alt = get_alt)

}

#' Translate a text into Italian with DeepL
#'
#' \code{toItalian2} calls the DeepL API via a JSON-RPC call and translates a text from English, German,
#'     French, Spanish, Dutch or Polish into Italian. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toItalian2("Hallo Welt!", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toItalian2(text = t)
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toItalian2(text = t, get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toItalian2 <- function(text, source_lang = NULL, get_detect = FALSE, get_alt = FALSE) {

  translate2(text = text, source_lang = source_lang, target_lang = "IT", get_detect = get_detect, get_alt = get_alt)

}

#' Translate a text into Dutch with DeepL
#'
#' \code{toDutch2} calls the DeepL API via a JSON-RPC call and translates a text from English, German,
#'     French, Spanish, Italian or Polish into Dutch. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{IT} Italian
#' \item \code{PL} Polish
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toDutch2("Hallo Welt!", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toDutch2(text = t)
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toDutch2(text = t, get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toDutch2 <- function(text, source_lang = NULL, get_detect = FALSE, get_alt = FALSE) {

  translate2(text = text, source_lang = source_lang, target_lang = "NL", get_detect = get_detect, get_alt = get_alt)

}

#' Translate a text into Polish with DeepL
#'
#' \code{toPolish2} calls the DeepL API via a JSON-RPC call and translates a text from English, German,
#'     French, Spanish, Italian or Dutch into Polish. No authentication key is required to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param get_alt if \code{TRUE}, alternative translations are also included in the response.
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation(s)
#'     (if \code{get_alt = TRUE}) is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned
#'     with the following columns:
#' \itemize{
#' \item \code{translation} the translated text(s).
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toPolish2("Hallo Welt!", auth_key = "my_key")
#'
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toPolish2(text = t)
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toPolish2(text = t, get_detect = T)
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toPolish2 <- function(text, source_lang = NULL, get_detect = FALSE, get_alt = FALSE) {

  translate2(text = text, source_lang = source_lang, target_lang = "PL", get_detect = get_detect, get_alt = get_alt)

}
