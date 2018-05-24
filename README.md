[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/deeplr)](https://cran.r-project.org/package=deeplr)
[![Build Status](https://travis-ci.org/zumbov2/deeplr.svg?branch=master)](https://travis-ci.org/zumbov2/deeplr)
[![Licence](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![cranlogs](https://cranlogs.r-pkg.org/badges/grand-total/deeplr)](http://cran.rstudio.com/web/packages/deeplr/index.html)

# deeplr
This R package is an interface to the [DeepL Translator API](https://www.deepl.com/api.html) that translates
texts between different languages. The following languages are currently available: English (`EN`), German (`DE`), French (`FR`), Spanish (`ES`), Italian (`IT`), Dutch (`NL`) and Polish (`PL`).

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
In the frist example, we let the API guess the language of the source text. If `get_detect = TRUE`, the detected language is 
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
Now we use `map_chr` from the `purrr` package to apply the function to all elements of the character vector. 
```
purrr::map_chr(hello, translator)
[1] "Hello world!"   "Hello, world!"  "Hello World!"   "Ciao Mondo!"    "Hallo wereld!"  "Hello the world!"
```
4 out of 6. Not a bad start.

### What went wrong?
Let's check for the source languages detected. We respecify our translator and use `purrr`'s `map_df` function to get a data frame with the source languages.
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
We respecify our translator once again and use another `purrr` function (`map2_chr`) to map over the two inputs simultaneously.
```
translator3 <- function(text, source_lang) deeplr::toEnglish(text = text, source_lang = source_lang, 
                                                             auth_key = auth_key)

purrr::map2_chr(hello, source_lang, translator3)
[1] "Hello world!"   "Hello, world!"  "Hello World!"   "Hello World!"   "Hello world!"   "Hello the world!"
```
The candidate has... 100 points.

## Example 3: Some additional testing 
### Text to translate
*Near the beginning of his career, Einstein thought that Newtonian mechanics was no longer enough to reconcile the laws of classical mechanics with the laws of the electromagnetic field. This led him to develop his special theory of relativity during his time at the Swiss Patent Office in Bern (1902–1909), Switzerland. However, he realized that the principle of relativity could also be extended to gravitational fields, and he published a paper on general relativity in 1916 with his theory of gravitation. He continued to deal with problems of statistical mechanics and quantum theory, which led to his explanations of particle theory and the motion of molecules. He also investigated the thermal properties of light which laid the foundation of the photon theory of light. In 1917, he applied the general theory of relativity to model the structure of the universe.* (Source: [Wikipedia](https://en.wikipedia.org/wiki/Albert_Einstein))
```
nchar(Einstein)
[1] 869

deeplr::toGerman(Einstein, auth_key = auth_key)
```
### The result
*Zu Beginn seiner Karriere dachte Einstein, dass die Newtonsche Mechanik nicht mehr ausreicht, um die Gesetze der klassischen Mechanik mit den Gesetzen des elektromagnetischen Feldes in Einklang zu bringen. Dies führte ihn während seiner Zeit am Schweizerischen Patentamt in Bern (1902-1909) zur Entwicklung seiner speziellen Relativitätstheorie. Allerdings erkannte er, dass das Prinzip der Relativitätstheorie auch auf Gravitationsfelder ausgedehnt werden kann, und veröffentlichte 1916 mit seiner Gravitationstheorie ein Papier über die allgemeine Relativitätstheorie. Er beschäftigte sich weiterhin mit Problemen der statistischen Mechanik und Quantentheorie, die zu seinen Erklärungen der Partikeltheorie und der Bewegung von Molekülen führten. Er untersuchte auch die thermischen Eigenschaften von Licht, die den Grundstein für die Photonentheorie des Lichts legten. Im Jahre 1917 wandte er die allgemeine Relativitätstheorie an, um die Struktur des Universums zu modellieren.*

An impressive result from my point of view.

### Timing
```
system.time(deeplr::toGerman(Einstein, auth_key = auth_key))
   user  system elapsed 
   0.00    0.00    2.08
```
Let's scale up a bit (86,900 characters).
```
system.time(deeplr::toGerman(paste0(rep(Einstein, 100), collapse = " "), auth_key = auth_key))
   user  system elapsed 
   0.24    0.01   12.53 
```

Happy Testing
