#' Translate Texts into English with the DeepL API Free
#'
#' \code{toEnglish2} translates a text from any supported source language into English using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toEnglish2("Hallo Welt!")
#'
#' texts <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toEnglish2(texts, get_detect = TRUE)
#' }
#' 
toEnglish2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                       get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                       glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "EN", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into German with the DeepL API Free
#'
#' \code{toGerman2} translates a text from any supported source language into German using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toGerman2("Hello world!")
#'
#' texts <- c("Me llamo Fred.", "Je suis médecin.", "I'm from Brisbane.")
#' toGerman2(texts, get_detect = TRUE)
#' }
#' 
toGerman2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                      glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "DE", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into French with the DeepL API Free
#'
#' \code{toFrench2} translates a text from any supported source language into French using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toFrench2("Hallo Welt!")
#'
#' texts <- c("Me llamo Fred.", "I'm a doctor.", "Ich komme aus der Schweiz.")
#' toFrench2(texts, get_detect = TRUE)
#' }
#' 
toFrench2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                      get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                      glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "FR", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into Italian with the DeepL API Free
#'
#' \code{toItalian2} translates a text from any supported source language into Italian using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toItalian2("Hallo Welt!")
#'
#' texts <- c("Me llamo Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toItalian2(texts, get_detect = TRUE)
#' }
#' 
toItalian2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                       get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                       glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "IT", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into Spanish with the DeepL API Free
#'
#' \code{toSpanish2} translates a text from any supported source language into Spanish using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toSpanish2("Hallo Welt!")
#'
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toSpanish2(texts, get_detect = TRUE)
#' }
#' 
toSpanish2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                       get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                       glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "ES", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into Japanese with the DeepL API Free
#'
#' \code{toJapanese2} translates a text from any supported source language into Japanese using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toJapanese2("Hallo Welt!")
#'
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toJapanese2(texts, get_detect = TRUE)
#' }
#' 
toJapanese2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                        get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                        glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "JA", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into Russian with the DeepL API Free
#'
#' \code{toRussian2} translates a text from any supported source language into Russian using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toRussian2("Hallo Welt!")
#'
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toRussian2(texts, get_detect = TRUE)
#' }
#' 
toRussian2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                       get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                       glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "RU", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into Chinese with the DeepL API Free
#'
#' \code{toChinese2} translates a text from any supported source language into Chinese using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toChinese2("Hallo Welt!")
#'
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toChinese2(texts, get_detect = TRUE)
#' }
#' 
toChinese2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                       get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                       glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "ZH", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}

#' Translate Texts into Portuguese with the DeepL API Free
#'
#' \code{toPortuguese2} translates a text from any supported source language into Portuguese using the DeepL API Free.
#'     Use \code{\link{available_languages2}} to list all supported languages.
#'
#' @param text A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
#'     Each element may contain multiple sentences but should not exceed 30 kB.
#' @param source_lang A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
#'     If of length 1, the same source language is applied to all elements.
#' @param split_sentences Logical. If \code{TRUE}, the engine splits the input into sentences. 
#'     For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.
#' @param preserve_formatting Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.
#' @param get_detect Logical. If \code{TRUE}, the detected language of the source text is included in the response.
#' @param context Optional string providing contextual information to improve translation quality, 
#'     especially for short or ambiguous text. Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
#'     \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
#'   }
#' @param formality Optional. Controls formality level of the translation (only for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries2}} to retrieve available glossaries.
#' @param auth_key A string representing the authentication key for the DeepL API Free. 
#'     If not provided, the function will attempt to retrieve the key from the environment 
#'     variable \code{DEEPL_API_KEY}. You can set this variable using 
#'     \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
#'     file for persistent use.
#'
#' @details To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
#'     \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
#'
#' @return If \code{get_detect = FALSE}, a character vector with translations is returned. 
#'     If \code{get_detect = TRUE}, a tibble with the following columns is returned:
#'     \itemize{
#'       \item \code{translation}: The translated text.
#'       \item \code{source_lang}: The detected or specified source language.
#'     }
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' toPortuguese2("Hallo Welt!")
#'
#' texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
#' toPortuguese2(texts, get_detect = TRUE)
#' }
#' 
toPortuguese2 <- function(text, source_lang = NULL, split_sentences = TRUE, preserve_formatting = FALSE,
                          get_detect = FALSE, context = NULL, model_type = NULL, formality = NULL, 
                          glossary_id = NULL, auth_key) {
  
  translate2(text = text, target_lang = "PT", source_lang = source_lang, split_sentences = split_sentences,
             preserve_formatting = preserve_formatting, get_detect = get_detect, context = context, 
             model_type = model_type, formality = formality, glossary_id = glossary_id, auth_key = auth_key)
  
}