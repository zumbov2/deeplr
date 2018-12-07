#' Translate texts into English using the official DeepL Translator API
#'
#' \code{toEnglish} translates a text from German, French, Spanish, Portuguese, Italian, Dutch, Polish or
#'     Russian into English using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#'     If parameter \code{is.null}, the API will try to detect the language of the source.
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toEnglish("Hallo Welt!", auth_key = "my_key")
#'
#' # toEnglish applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' purrr::map_chr(txt1, toEnglish, auth_key = "x")
#'
#' # toEnglish applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' purrr::map_df(txt2, toEnglish, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toEnglish <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "EN", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into German using the official DeepL Translator API
#'
#' \code{toGerman} translates a text from English, French, Spanish, Portuguese, Italian, Dutch, Polish or
#'     Russian into German using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#' If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toGerman("Hallo Welt!", auth_key = "my_key")
#'
#' # toGerman applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toGerman, auth_key = "x")
#'
#' # toGerman applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Je suis médecin.", "I'm from Wales")
#' purrr::map_df(txt2, toGerman, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toGerman <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "DE", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into French using the official DeepL Translator API
#'
#' \code{toFrench} translates a text from English, German, Spanish, Portuguese, Italian, Dutch, Polish or
#'     Russian into French using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#'     If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toFrench("Hallo Welt!", auth_key = "my_key")
#'
#' # toFrench applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toFrench, auth_key = "x")
#'
#' # toFrench applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Ich bin Arzt.", "I'm from Wales")
#' purrr::map_df(txt2, toFrench, get_detect = T, auth_key = "x")
#'
#' }
#'
toFrench <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "FR", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into Spanish using the official DeepL Translator API
#'
#' \code{toSpanish} translates a text from English, German, French, Portuguese, Italian, Dutch, Polish or
#'     Russian into Spanish using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#'     If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toSpanish("Hallo Welt!", auth_key = "my_key")
#'
#' # toSpanish applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toSpanish, auth_key = "x")
#'
#' # toSpanish applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' purrr::map_df(txt2, toSpanish, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toSpanish <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "ES", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into Italian using the official DeepL Translator API
#'
#' \code{toItalian} translates a text from English, German, French, Spanish, Portuguese, Dutch, Polish or
#'     Russian into Italian using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#'     If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toItalian("Hallo Welt!", auth_key = "my_key")
#'
#' # toItalian applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toItalian, auth_key = "x")
#'
#' # toItalian applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' purrr::map_df(txt2, toItalian, get_detect = T, auth_key = "x")
#'
#' }
#'
toItalian <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "IT", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into Dutch using the official DeepL Translator API
#'
#' \code{toDutch} translates a text from English, German, French, Spanish, Portuguese, Italian, Polish or
#'     Russian into Dutch using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#'     If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toDutch("Hallo Welt!", auth_key = "my_key")
#'
#' # toDutch applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toDutch, auth_key = "x")
#'
#' # toDutch applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' purrr::map_df(txt2, toDutch, get_detect = T, auth_key = "x")
#'
#' }
#'
toDutch <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "NL", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into Polish using the official DeepL Translator API
#'
#' \code{toPolish} translates a text from English, German, French, Spanish, Portuguese, Italian, Dutch or
#'     Russian into Polish using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#'     If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toPolish("Hallo Welt!", auth_key = "my_key")
#'
#' # toPolish applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toPolish, auth_key = "x")
#'
#' # toPolish applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' purrr::map_df(txt2, toPolish, get_detect = T, auth_key = "x")
#'
#' }
#'
toPolish <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                    preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "PL", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into Portuguese using the official DeepL Translator API
#'
#' \code{toPortuguese} translates a text from English, German, French, Spanish, Italian, Dutch, Polish or
#'     Russian into Portuguese using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#' }
#'     If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toPortuguese("Hallo Welt!", auth_key = "my_key")
#'
#' # toPortuguese applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toPortuguese, auth_key = "x")
#'
#' # toPortuguese applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' purrr::map_df(txt2, toPortuguese, get_detect = T, auth_key = "x")
#'
#' }
#'
toPortuguese <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                     preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "PT", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate texts into Russian using the official DeepL Translator API
#'
#' \code{toRussian} translates a text from English, German, French, Spanish, Portuguese, Italian, Dutch or
#'     Polish into Portuguese using the official DeepL Translator API. To use this service, an authentication
#'     key is required.
#'
#' @importFrom utf8 utf8_valid as_utf8
#' @importFrom utils URLencode
#' @importFrom httr POST add_headers status_code content
#' @importFrom tibble tibble
#'
#' @param text text to be translated. Only UTF8-encoded plain text is supported. May contain multiple sentences.
#'     The request size should not exceed 30kbytes.
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
#' }
#'     If parameter \code{is.null}, the API will try to detect the language of the source
#' @param tag_handling if set to \code{"xml"}, the translation engine tries to find matches for XML enclosed words in
#'     the translated sentence and enclose them with the same tags. If no matching words are found, the tags are removed.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences. If only one sentence
#'     is translated, it is recommended to set to \code{FALSE} to prevent the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects (e.g. punctuation at the beginning
#'     and end of the sentence, upper/lower case at the beginning of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is also inclued in the response. It corresponds to
#'     the value of the argument \code{source_lang} if it was specified. If \code{FALSE}, only the translated text is returned.
#' @param auth_key DeepL authentication key which provides access to the API.
#'
#' @details To get an authentication key, you need to register for a DeepL Pro account (\url{https://www.deepl.com/pro.html}).
#'     This currently costs 20 euros per month and allows the translation of 1,000,000 characters per month (see
#'     \url{https://www.deepl.com/pro-pricing.html}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the translation is returned. Otherwise,
#'    a \code{data.frame} (\code{tibble::tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/api.html}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \donttest{
#' # Simple translation
#' toRussian("Hallo Welt!", auth_key = "my_key")
#'
#' # toRussian applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' purrr::map_chr(txt1, toRussian, auth_key = "x")
#'
#' # toRussian applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' purrr::map_df(txt2, toRussian, get_detect = T, auth_key = "x")
#'
#' }
#'
toRussian <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                         preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "RU", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}


