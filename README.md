[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/deeplr)](https://cran.r-project.org/package=deepler)
[![Build Status](https://travis-ci.org/zumbov2/deeplr.svg?branch=master)](https://travis-ci.org/zumbov2/deeplr)
[![Licence](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![cranlogs](https://cranlogs.r-pkg.org/badges/grand-total/deeplr)](http://cran.rstudio.com/web/packages/deeplr/index.html)

# deeplr
This R package is an interface to the [DeepL Translator API](https://www.deepl.com/api.html) that translates
texts between different languages. The following languages are currently available: 
* English `EN`
* German `DE`
* French `FR`
* Spanish `ES`
* Italian `IT`
* Dutch `NL`
* Polish `PL`

Access to the API is subject to a monthly fee (see [DeepL Pro](https://www.deepl.com/pro.html)). You can currently translate 1,000,000 characters per month for 20 euros (see [DeepL Pro Pricing](https://www.deepl.com/pro-pricing.html)).

## Installation
For regularly updated version (latest: 0.1.1), install from GitHub:
```
install.packages("devtools")
devtools::install_github("zumbov2/deeplr")
```
## Example 1: `Hello World!`
```
deeplr::translate("Hallo Welt!", target_lang = "EN", auth_key = auth_key)
[1] "Hello World!"
```
In the example above, we let the API guess what the source language is. If `get_detect = TRUE`, the detected source language is 
included in the response.
```
deeplr::translate("Hallo Welt!", target_lang = "EN", get_detect = TRUE, auth_key = auth_key)
# A tibble: 1 x 2
  translation  source_lang
  <chr>        <chr>      
1 Hello World! DE    
```
Or we can just use `source_lang = "DE"` to tell the API what the source language is.

## Example 2: A multilingual version of `Hello World!` 
### First try 
```
hello <- c("Hallo Welt!", "Bonjour le monde !", "Hola Mundo!", "Ciao Mondo!", 
           "Hallo wereld!", "Witajcie świat!")
```
We want to translate the above strings into English. To do this, we first define our translation function. `toEnglish` is 
a simple wrapper and identical to `translate(target_lang = "EN")`.
```
translator <- function(text) deeplr::toEnglish(text = text, auth_key = auth_key)
```
Now we use `map_chr` from the `purrr` package to apply our function to all elements of our character vector. 
```
purrr::map_chr(hello, translator)
[1] "Hello world!"   "Hello, world!"  "Hello World!"   "Ciao Mondo!"    "Hallo wereld!"  "Hello the world!"
```
### What went wrong?
Not quite everything went as planned. Let's check for the source languages detected. We respecify our translator and use
`purrr`'s `map_df` function to get a data frame with the source languages.
```
translator2 <- function(text) deeplr::toEnglish(text = text, get_detect = T, auth_key = auth_key)

purrr::map_df(hello, translator2)
# A tibble: 6 x 2
  translation      source_lang
  <chr>            <chr>      
1 Hello world!     DE         
2 Hello, world!    FR         
3 Hello World!     ES         
4 Ciao Mondo!      ES         
5 Hallo wereld!    ""         
6 Hello the world! PL   
```
### Second try 
The API didn't recognize all source languages correctly. Let's give it some help. We create a vector with the correct 
source languages. 
```
source_lang <- c("DE", "FR", "ES", "IT", "NL", "PL")
```
We respecify our translator once again and use another `purrr` function (`map2_chr`) to map over our two inputs simultaneously.
```
translator3 <- function(text, source_lang) deeplr::toEnglish(text = text, source_lang = source_lang, 
                                                             auth_key = auth_key)

purrr::map2_chr(hello, source_lang, translator3)
[1] "Hello world!"   "Hello, world!"  "Hello World!"   "Hello World!"   "Hello world!"   "Hello the world!"
```
The candidate has... 99 points.
