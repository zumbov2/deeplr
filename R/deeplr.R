#' \code{deeplr} package
#'
#' An R wrapper for the DeepL Translator API
#'
#' See the README on
#' \href{https://github.com/zumbov2/deeplr#readme}{GitHub}
#'
#' @docType package
#' @name deeplr
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1") {

  utils::globalVariables(c(".", "sentence", "bytes", "bytes_sum"))

  }
