#' Translate texts into English using DeepL API Free
#'
#' \code{toEnglish2} translates a text from an available language into English
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null},
#'     the API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toEnglish2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toEnglish2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toEnglish2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "EN", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into German using DeepL API Free
#'
#' \code{toGerman2} translates a text from an available language into German
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null},
#'     the API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toGerman2("Hello world!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("Me llamo Fred.", "Je suis médecin.", "I'm from Brisbane.")
#' toGerman2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toGerman2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "DE", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into French using DeepL API Free
#'
#' \code{toFrench2} translates a text from an available language into French
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null},
#'     the API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toFrench2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("Me llamo Fred.", "I'm a doctor.", "Ich komme aus der Schweiz.")
#' toFrench2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toFrench2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "FR", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into Italian using DeepL API Free
#'
#' \code{toItalian2} translates a text from an available language into Italian
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null}, the API
#'     guesses the language of the source. If input is of length 1, the same source language is
#'     applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toItalian2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toItalian2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toItalian2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "IT", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into Spanish using DeepL API Free
#'
#' \code{toSpanish2} translates a text from an available language into Spanish
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null},
#'     the API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toSpanish2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toSpanish2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toSpanish2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "ES", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into Japanese using DeepL API Free
#'
#' \code{toJapanese2} translates a text from an available language into Japanese
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null}, the API
#'     guesses the language of the source. If input is of length 1, the same source language is
#'     applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toJapanese2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toJapanese2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toJapanese2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "JA", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into Russian using DeepL API Free
#'
#' \code{toRussian2} translates a text from an available language into Russian
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null},
#'     the API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toRussian2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toRussian2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toRussian2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                       get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "RU", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into Chinese using DeepL API Free
#'
#' \code{toChinese2} translates a text from an available language into Chinese
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null},
#'     the API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toChinese2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toChinese2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toChinese2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                       get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "ZH", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}

#' Translate texts into Portuguese using DeepL API Free
#'
#' \code{toPortuguese2} translates a text from an available language into Portuguese
#'     using DeepL API Free. Use \code{available_languages2} to list all supported languages.
#'     An authentication key is required to use this service. With the DeepL API Free package,
#'     developers can translate up to 500,000 characters per month for free.
#'
#' @param text character vector to be translated. Only UTF8-encoded plain text is supported.
#'     An element can contain several sentences, but should not exceed 30kbytes.
#' @param source_lang language of the text to be translated. If parameter \code{is.null},
#'     the API guesses the language of the source. If input is of length 1, the same source
#'     language is applied to all elements.
#' @param split_sentences if \code{TRUE}, the translation engine splits the input into sentences.
#'     If only one sentence is translated, it is recommended to set to \code{FALSE} to prevent
#'     the engine from unintentionally splitting the sentence.
#' @param preserve_formatting if \code{TRUE}, the translation engine tries to preserve some aspects
#'     (e.g. punctuation at the beginning and end of the sentence, upper/lower case at the beginning
#'     of the sentence) of the formatting.
#' @param get_detect if \code{TRUE}, the language detected for the source text is included in
#'     the response.
#' @param auth_key Authentication key.
#'
#' @details To get an authentication key, you need to register for a DeepL API Free
#'     account (\url{https://www.deepl.com/pro#developer}).
#'
#' @return If \code{get_detect} is set to \code{FALSE} a \code{character vector} containing the
#'    translation is returned. Otherwise, a (\code{tibble}) is returned with the following columns:
#' \itemize{
#' \item \code{translation} the translated text.
#' \item \code{source_lang} detected or specified language of the input text.
#' }
#'
#' @references \href{https://www.deepl.com/pro#developer}{DeepL API documentations}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Translate a single text
#' toPortuguese2("Hallo Welt!", auth_key = "my_key")
#'
#' # Translate multiple texts and return the detected language
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toPortuguese2(texts, get_detect = T, auth_key = "x")
#'
#' }
#'
#'
toPortuguese2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, auth_key = "your_key") {

  translate2(text = text, target_lang = "PT", source_lang = source_lang, split_sentences = split_sentences,
            preserve_formatting = preserve_formatting, get_detect = get_detect, auth_key = auth_key)

}
