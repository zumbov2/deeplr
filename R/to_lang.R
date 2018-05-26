#' Translate a text into English with the official DeepL Translator API
#'
#' \code{toEnglish} calls the official DeepL translator API and translates a text from German, French,
#'     Spanish, Italian, Dutch or Polish into English. To use this service, an authentication key is required.
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
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
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
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("Mein Name ist Albert.", "Ich bin Physiker.", "Ich wurde 1879 in Ulm geboren.")
#' translator1 <- function(t) toEnglish(text = t, auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' translator2 <- function(t) toEnglish(text = t, get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
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

#' Translate a text into German with the official DeepL Translator API
#'
#' \code{toGerman} calls the official DeepL translator API and translates a text from English, French,
#'     Spanish, Italian, Dutch or Polish into German. To use this service, an authentication key is required.
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
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
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
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toGerman(text = t, auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Je suis médecin.", "I'm from Wales")
#' translator2 <- function(t) toGerman(text = t, get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
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

#' Translate a text into French with the official DeepL Translator API
#'
#' \code{toFrench} calls the official DeepL translator API and translates a text from English, German,
#'     Spanish, Italian, Dutch or Polish into French. To use this service, an authentication key is required.
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
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
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
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toFrench(text = t, auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Me llamo Fred.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toFrench(text = t, get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toFrench <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "FR", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate a text into Spanish with the official DeepL Translator API
#'
#' \code{toSpanish} calls the official DeepL translator API and translates a text from English, German,
#'     French, Italian, Dutch or Polish into Spanish. To use this service, an authentication key is required.
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
#' \item \code{IT} Italian
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
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
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toSpanish(text = t, auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toSpanish(text = t, get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
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

#' Translate a text into Italian with the official DeepL Translator API
#'
#' \code{toItalian} calls the official DeepL translator API and translates a text from English, German,
#'     French, Spanish, Dutch or Polish into Italian. To use this service, an authentication key is required.
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
#' \item \code{NL} Dutch
#' \item \code{PL} Polish
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
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toItalian(text = t, auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toItalian(text = t, get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toItalian <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "IT", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate a text into Dutch with the official DeepL Translator API
#'
#' \code{toDutch} calls the official DeepL translator API and translates a text from English, German,
#'     French, Spanish, Italian or Polish into Dutch. To use this service, an authentication key is required.
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
#' \item \code{PL} Polish
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
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toDutch(text = t, auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toDutch(text = t, get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toDutch <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                 preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "NL", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}

#' Translate a text into Polish with the official DeepL Translator API
#'
#' \code{toPolish} calls the official DeepL translator API and translates a text from English, German,
#'     French, Spanish, Italian or Dutch into Polish. To use this service, an authentication key is required.
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
#' @param auth_key your \code{DeepL} authentication key which provides access to the API.
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
#' # Customized translator applied to multiple strings
#' txt1 <- c("My name is Albert.", "I'm a physicist.", "I was born in 1879 in Ulm.")
#' translator1 <- function(t) toPolish(text = t, auth_key = "x")
#' purrr::map_chr(txt1, translator1)
#'
#' # Customized translator applied to multiple strings (with language detection response)
#' txt2 <- c("Je m'appelle Jean.", "Ich bin Arzt.", "I'm from Wales")
#' translator2 <- function(t) toPolish(text = t, get_detect = T, auth_key = "x")
#' purrr::map_df(txt2, translator2)
#'
#' }
#'
toPolish <- function(text, source_lang = NULL, tag_handling = NULL, split_sentences = TRUE,
                    preserve_formatting = FALSE, get_detect = FALSE, auth_key = "your_key") {

  translate(text = text, source_lang = source_lang, target_lang = "PL", tag_handling = tag_handling,
            split_sentences = split_sentences, preserve_formatting = preserve_formatting, get_detect = get_detect,
            auth_key = auth_key)

}
