#' Split Text into Byte-Limited Segments
#'
#' \code{split_text} divides input text into smaller segments that do not exceed a specified maximum size in bytes.
#'     Segmentation is based on sentence or word boundaries.
#'
#' @importFrom purrr map2_dfr
#'
#' @param text A character vector containing the text(s) to be split.
#' @param max_size_bytes An integer specifying the maximum size (in bytes) for each segment.
#' @param tokenize A string indicating the level of tokenization. Must be either \code{"sentences"} or \code{"words"}.
#'
#' @details This function uses \code{tokenizers::tokenize_sentences} (or \code{tokenize_words} if specified) 
#'     to split the text into natural language segments before assembling byte-limited blocks.
#'
#' @return A tibble with one row per text segment, containing the following columns:
#' \itemize{
#'   \item \code{text_id}: The index of the original text in the input vector.
#'   \item \code{segment_id}: A sequential ID identifying the segment number.
#'   \item \code{segment_text}: The resulting text segment, each within the specified byte limit.
#' }
#'
#' @export
#'
#' @examples
#' \dontrun{
#' long_text <- paste0(rep("This is a very long text. ", 10000), collapse = "")
#' split_text(long_text, max_size_bytes = 1000, tokenize = "sentences")
#' }
#' 
split_text <- function(text, max_size_bytes = 29000, tokenize = "sentences") {

  purrr::map2_dfr(
    1:length(text),
    text,
    split_text_wh,
    max_size_bytes = max_size_bytes,
    tokenize = tokenize
    )

}
