#' Split texts into segments
#'
#' \code{split_text} splits texts into blocks of a maximum number of bytes.
#'
#' @importFrom purrr map2_dfr
#'
#' @param text character vector to be split.
#' @param max_size_bytes maximum size of a single text segment in bytes.
#' @param tokenize level of tokenization. Either "sentences" or "words".
#'
#' @details The function uses \code{tokenizers::tokenize_sentences} to split texts.
#'
#' @return Returns a (\code{tibble}) with the following columns:
#' \itemize{
#' \item \code{text_id} position of the text in the character vector.
#' \item \code{segment_id} ID of a text segment.
#' \item \code{segment_text} text segment that is smaller than \code{max_size_bytes}
#' }
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Split long text
#' text <- paste0(rep("This is a very long text.", 10000), collapse = " ")
#' split_text(text)
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
