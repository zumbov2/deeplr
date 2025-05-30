% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/to_lang2.R
\name{toJapanese2}
\alias{toJapanese2}
\title{Translate Texts into Japanese with the DeepL API Free}
\usage{
toJapanese2(
  text,
  source_lang = NULL,
  split_sentences = TRUE,
  preserve_formatting = FALSE,
  get_detect = FALSE,
  context = NULL,
  model_type = NULL,
  formality = NULL,
  glossary_id = NULL,
  auth_key
)
}
\arguments{
\item{text}{A character vector containing the text(s) to be translated. Only UTF-8 encoded plain text is supported. 
Each element may contain multiple sentences but should not exceed 30 kB.}

\item{source_lang}{A string specifying the source language. If \code{NULL}, the API will auto-detect the language. 
If of length 1, the same source language is applied to all elements.}

\item{split_sentences}{Logical. If \code{TRUE}, the engine splits the input into sentences. 
For single-sentence inputs, consider setting to \code{FALSE} to prevent unwanted splitting.}

\item{preserve_formatting}{Logical. If \code{TRUE}, formatting such as punctuation and casing is preserved.}

\item{get_detect}{Logical. If \code{TRUE}, the detected language of the source text is included in the response.}

\item{context}{Optional string providing contextual information to improve translation quality, 
especially for short or ambiguous text. Context is not translated and does not count toward character limits.}

\item{model_type}{Optional. Specifies the DeepL model to use:
\itemize{
  \item \code{"latency_optimized"} – Default low-latency model.
  \item \code{"quality_optimized"} – Higher quality, higher latency model (Pro only, limited language pairs).
  \item \code{"prefer_quality_optimized"} – Use quality-optimized when available, otherwise fallback.
}}

\item{formality}{Optional. Controls formality level of the translation (only for certain target languages):
\itemize{
  \item \code{"default"} – Neutral.
  \item \code{"more"} – More formal.
  \item \code{"less"} – More informal.
  \item \code{"prefer_more"} – Prefer formal, fallback to default.
  \item \code{"prefer_less"} – Prefer informal, fallback to default.
}}

\item{glossary_id}{Optional. Glossary ID for custom translation. Must match the language pair and requires \code{source_lang}.
Use \code{\link{list_glossaries2}} to retrieve available glossaries.}

\item{auth_key}{A string representing the authentication key for the DeepL API Free. 
If not provided, the function will attempt to retrieve the key from the environment 
variable \code{DEEPL_API_KEY}. You can set this variable using 
\code{Sys.setenv(DEEPL_API_KEY = "your_key")} or define it in your \code{.Renviron} 
file for persistent use.}
}
\value{
If \code{get_detect = FALSE}, a character vector with translations is returned. 
    If \code{get_detect = TRUE}, a tibble with the following columns is returned:
    \itemize{
      \item \code{translation}: The translated text.
      \item \code{source_lang}: The detected or specified source language.
    }
}
\description{
\code{toJapanese2} translates a text from any supported source language into Japanese using the DeepL API Free.
    Use \code{\link{available_languages2}} to list all supported languages.
}
\details{
To use this function, you must obtain an authentication key by registering for a DeepL API Free account at 
    \href{https://www.deepl.com/pro#developer}{DeepL API Free}. With the Free API, up to 500,000 characters per month can be translated at no cost.
}
\examples{
\dontrun{
toJapanese2("Hallo Welt!")

texts <- c("My name is Fred.", "Je suis médecin.", "Ich komme aus der Schweiz.")
toJapanese2(texts, get_detect = TRUE)
}

}
\references{
\href{https://developers.deepl.com/docs/api-reference/translate}{DeepL API Documentation — Translate}
}
