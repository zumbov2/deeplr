


#' Get and set your API key 
#' 
#' As API keys should not be stored as plain text in a character variable, these functions use the operating system credential store to set and get your authentication key.
#' 
#' @section Installation on Linux
#' 
#' If you are using Linux, you may have to install a specific package for this to work. Visit https://r-lib.github.io/keyring/index.html for more information.
#'
#' @return
#' @export
#'
#' @examples
#' #deepl_key_set() #enter your API key in the prompt
#' auth_key = deepl_key_get()
deepl_key_get = function() {
    if(!requireNamespace("keyring", quietly=TRUE)) {
        stop('Package {keyring} is needed for function `deepl_key_get()` to work. Please install it: `install.packages("keyring")`.')
    }
    if(!interactive()) {
        stop('`deepl_key_get()` only works in interactive sessions.')
    }
    keyring::key_get(service="deepl") 
}



#' @param force Use `force=TRUE` to override any existing key
#'
#' @rdname deepl_key_get
#' @export
deepl_key_set = function(force=FALSE) {
    if(!requireNamespace("keyring", quietly=TRUE)) {
        stop('Package {keyring} is needed for function `deepl_key_set()` to work. Please install it: `install.packages("keyring")`.')
    }
    if(!interactive()) {
        stop('`deepl_key_set()` only works in interactive sessions.')
    }
    if(isFALSE(force)) {
        keylist = keyring::key_list()
        if(any(keylist$service=="deepl")){
            stop('There is already an API key for Deepl. Use `force=TRUE` to override this check and replace this key.')
        }
    }
    keyring::key_set(service="deepl", prompt="Enter your Deepl API key:") 
    invisible()
}

