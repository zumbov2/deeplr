#' Translate texts into English using DeepL
#'
#' \code{toEnglish2} translates a text from German, French, Spanish, Portuguese, Italian, Dutch, Polish or
#'     Russian into English using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toEnglish2("Hallo Welt!")
#'
#' # toEnglish2 applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' purrr::map_chr(txt1, toEnglish2)
#'
#' }
#'
#'
toEnglish2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "EN", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into German using DeepL
#'
#' \code{toGerman2} translates a text from English, French, Spanish, Portuguese, Italian, Dutch, Polish or
#'     Russian into German using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#' If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toGerman2("Hallo Welt!")
#'
#' # toGerman2 applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toGerman2)
#'
#' }
#'
#'
toGerman2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "DE", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into French using DeepL
#'
#' \code{toFrench2} translates a text from English, German, Spanish, Portuguese, Italian, Dutch, Polish or
#'     Russian into French using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toFrench2("Hallo Welt!")
#'
#' # toFrench2 applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toFrench2)
#'
#' }
#'
toFrench2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "FR", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into Spanish using DeepL
#'
#' \code{toSpanish2} translates a text from English, German, French, Portuguese, Italian, Dutch, Polish or
#'     Russian into Spanish using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toSpanish2("Hallo Welt!")
#'
#' # toSpanish2 applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toSpanish2)
#'
#' }
#'
#'
toSpanish2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "ES", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into Italian using DeepL
#'
#' \code{toItalian2} translates a text from English, German, French, Spanish, Portuguese, Dutch, Polish or
#'     Russian into Italian using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toItalian2("Hallo Welt!")
#'
#' # toItalian2 applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toItalian2)
#'
#' }
#'
toItalian2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "IT", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into Dutch using DeepL
#'
#' \code{toDutch2} translates a text from English, German, French, Spanish, Portuguese, Italian, Polish or
#'     Russian into Dutch using the undocumented JSON-RPC DeepL API. No authentication key is required to
#'     use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toDutch2("Hallo Welt!")
#'
#' # toDutch2 applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toDutch2)
#'
#' }
#'
toDutch2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "NL", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into Polish using DeepL
#'
#' \code{toPolish2} translates a text from English, German, French, Spanish, Portuguese, Italian, Dutch or
#'     Russian into Polish using the undocumented JSON-RPC DeepL API. No authentication key is required to
#'     use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{RU} Russian
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toPolish2("Hallo Welt!")
#'
#' # toPolish2 applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toPolish2)
#'
#' }
#'
toPolish2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "PL", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into Portuguese using DeepL
#'
#' \code{toPortuguese2} translates a text from English, German, French, Spanish, Italian, Dutch, Polish or
#'     Russian into Portuguese using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
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
#' \item \code{PL} Polish
#' \item \code{RU} Russian
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toPortuguese2("Hallo Welt!")
#'
#' # toPortuguese2 applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' purrr::map_chr(txt1, toPortuguese2)
#'
#' }
#'
#'
toPortuguese2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "PT", get_detect = get_detect,
             subdomain = subdomain)

}

#' Translate texts into Russian using DeepL
#'
#' \code{toRussian2} translates a text from English, German, French, Spanish, Portuguese, Italian, Dutch or
#'     Polish into Russian using the undocumented JSON-RPC DeepL API. No authentication key is required
#'     to use this service.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom httr POST content
#' @importFrom rjson toJSON fromJSON
#' @importFrom tibble tibble
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#'
#' @param text text to be translated. Must not exceed 5000 characters. Only UTF8-encoded plain text is supported.
#'     May contain multiple sentences.
#' @param source_lang language of the text to be translated. Can be one of the following:
#' \itemize{
#' \item \code{EN} English
#' \item \code{DE} German
#' \item \code{FR} French
#' \item \code{ES} Spanish
#' \item \code{PT} Portuguese
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
#'  }
#'     If parameter \code{is.null}, the API will try to detect the language of the text.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param subdomain specifies the deepl subdomain to be used for the translation request. Currently: 'www2'
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation
#'     is returned. Otherwise, a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
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
#' toRussian2("Hallo Welt!")
#'
#' # toRussian2 applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' purrr::map_chr(txt1, toRussian2)
#'
#' }
#'
#'
toRussian2 <- function(text, source_lang = NULL, get_detect = FALSE, subdomain = "www2") {

  translate2(text = text, source_lang = source_lang, target_lang = "RU", get_detect = get_detect,
             subdomain = subdomain)

}
