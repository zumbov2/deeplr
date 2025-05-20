#' Translate Texts Using the DeepL API Pro
#'
#' Translates UTF-8 encoded plain text between supported languages using the DeepL API Pro. 
#' A list of supported source and target languages is available at 
#' \url{https://developers.deepl.com/docs/getting-started/supported-languages}.
#' An authentication key is required to use this service. Charges may apply based on the number of characters translated.
#'
#' @importFrom purrr map2_chr map2_dfr pmap_chr pmap_dfr
#'
#' @param text Character vector. The text(s) to translate. Each element can contain multiple sentences 
#'   but must not exceed 30 kB. Only UTF-8 plain text is supported.
#' @param target_lang Character vector. Target language(s) for translation. If length 1, all texts are 
#'   translated into the same language.
#' @param source_lang Character vector or \code{NULL}. Source language(s). If \code{NULL}, the language 
#'   is auto-detected. If of length 1, it is applied to all texts.
#' @param split_sentences Logical. If \code{TRUE} (default), DeepL splits input into sentences before 
#'   translating. Set to \code{FALSE} to avoid unintended splits in short texts.
#' @param preserve_formatting Logical. If \code{TRUE}, preserves some text formatting (e.g., punctuation and capitalization).
#' @param get_detect Logical. If \code{TRUE}, returns a tibble including detected source languages along 
#'   with translations.
#' @param context Optional. Contextual text to improve translation quality, especially for short or ambiguous inputs. 
#'   Context is not translated and does not count toward character limits.
#' @param model_type Optional. Specifies the DeepL model to use:
#'   \itemize{
#'     \item \code{"latency_optimized"} – Default low-latency model.
#'     \item \code{"quality_optimized"} – Higher-quality, higher-latency model (Pro only, limited languages).
#'     \item \code{"prefer_quality_optimized"} – Uses quality-optimized when available; otherwise falls back.
#'   }
#' @param formality Optional. Controls the formality level of the translation (only supported for certain target languages):
#'   \itemize{
#'     \item \code{"default"} – Neutral.
#'     \item \code{"more"} – More formal.
#'     \item \code{"less"} – More informal.
#'     \item \code{"prefer_more"} – Prefer formal, fallback to default.
#'     \item \code{"prefer_less"} – Prefer informal, fallback to default.
#'   }
#' @param glossary_id Optional. Glossary ID for translation. Must match the language pair and requires \code{source_lang}.
#'     Use \code{\link{list_glossaries}} to retrieve IDs.
#' @param auth_key Character. Your DeepL API authentication key. If missing, the function uses 
#'   the \code{DEEPL_API_KEY} environment variable. You can set it using 
#'   \code{Sys.setenv(DEEPL_API_KEY = "your_key")} or in your \code{.Renviron} file.
#'
#' @details
#' Register for a DeepL API Pro key at \url{https://www.deepl.com/pro#developer}. 
#' Only texts passed via the \code{text} argument count toward your monthly quota.
#'
#' @return
#' If \code{get_detect = FALSE}, returns a character vector of translated texts.  
#' If \code{get_detect = TRUE}, returns a tibble with:
#' \itemize{
#'   \item \code{translation} – Translated text.
#'   \item \code{source_lang} – Detected or provided source language.
#' }
#'
#' @seealso \code{\link{list_glossaries}}
#'
#' @references \href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' translate("I like to translate texts.", target_lang = "DE")
#' 
#' translate(
#'   c("I like to translate texts.", "Ich übersetze gerne Texte."), 
#'   target_lang = "FR"
#'   )
#'   
#' translate("I like to translate texts.", target_lang = c("FR", "DE", "IT"))
#' 
#' translate(
#'   c("I like to translate texts.", "Ich übersetze gerne Texte."), 
#'   target_lang = c("FR", "IT")
#'   )
#' }
#' 
translate <- function(text, target_lang = "EN", source_lang = NULL, split_sentences = TRUE,
                       preserve_formatting = FALSE, get_detect = FALSE, context = NULL, 
                       model_type = NULL, formality = NULL, glossary_id = NULL, auth_key) {

  # Inputs variables
  if (length(source_lang) == 1) source_lang <- rep(source_lang, length(text))
  if (length(target_lang) == 1) target_lang <- rep(target_lang, length(text))
  if (length(target_lang) > 1 & length(text) == 1) text <- rep(text, length(target_lang))
  
  # Without source_lang
  if (is.null(source_lang)) {

    if (!get_detect) {

      translation_vec <- 
        purrr::map2_chr(
          text,
          target_lang,
          translate_wh,
          split_sentences = split_sentences,
          preserve_formatting = preserve_formatting,
          get_detect = get_detect,
          context = context,
          model_type = model_type,
          formality = formality,
          glossary_id = glossary_id,
          auth_key = auth_key
          )
      
      } else {
        
        translation_vec <- 
          purrr::map2_dfr(
            text,
            target_lang,
            translate_wh,
            split_sentences = split_sentences,
            preserve_formatting = preserve_formatting,
            get_detect = get_detect,
            context = context,
            model_type = model_type,
            formality = formality,
            glossary_id = glossary_id,
            auth_key = auth_key
            )
        
        }
    }

  # With source_lang
  if (!is.null(source_lang)) {

    if (!get_detect) {

      translation_vec <- 
        purrr::pmap_chr(
          list(text = text, target_lang = target_lang, source_lang = source_lang),
          translate_wh,
          split_sentences = split_sentences,
          preserve_formatting = preserve_formatting,
          get_detect = get_detect,
          context = context,
          model_type = model_type,
          formality = formality,
          glossary_id = glossary_id,
          auth_key = auth_key
          )
      
      } else {
        
        translation_vec <- 
          purrr::pmap_chr(
            list(text = text, target_lang = target_lang, source_lang = source_lang),
            translate_wh,
            split_sentences = split_sentences,
            preserve_formatting = preserve_formatting,
            get_detect = get_detect,
            context = context,
            model_type = model_type,
            formality = formality,
            glossary_id = glossary_id,
            auth_key = auth_key
            )
        
      }
    
    }

  # Return
  return(translation_vec)

}
