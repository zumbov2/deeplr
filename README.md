[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/deeplr)](https://cran.r-project.org/package=deeplr)
[![Build Status](https://travis-ci.org/zumbov2/deeplr.svg?branch=master)](https://travis-ci.org/zumbov2/deeplr)
[![Licence](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![cranlogs](https://cranlogs.r-pkg.org/badges/grand-total/deeplr)](http://cran.rstudio.com/web/packages/deeplr/index.html)
[![Rdoc](http://www.rdocumentation.org/badges/version/deeplr)](http://www.rdocumentation.org/packages/deeplr)

# deeplr
This R package is an interface to the official [DeepL Translator API](https://www.deepl.com/api.html) and the undocumented DeepL JSON-RPC API used on the [DeepL website](https://www.deepl.com/translator) to translate short texts of up to 5000 characters. The following languages are currently available: 
* English (`EN`)
* German (`DE`)
* French (`FR`)
* Spanish (`ES`)
* Italian (`IT`)
* Dutch (`NL`) 
* Polish (`PL`). 

Access to the official API is subject to a monthly fee (see [DeepL Pro Pricing](https://www.deepl.com/pro-pricing.html)). The undocumented API can currently be used free of charge.

## Installation
The version 1.0.0 is on CRAN, and you can install it by:
```
install.packages("deeplr")
```
For regularly updated version (latest: 1.0.0), install from GitHub:
```
install.packages("devtools")
devtools::install_github("zumbov2/deeplr")
```

# Examples
The package provides all functions for both types of API calls. Functions that call the free API end with a `2`. Only these functions are used in the following examples.

## Example 1: `Hello World!`
```
deeplr::translate2("Hallo Welt!", target_lang = "EN")
[1] "Hello World!"
```
In the first examples, we let the API guess the language of the source text. If `get_detect = TRUE`, the detected language is 
included in the response.
```
deeplr::translate2("Hallo Welt!", target_lang = "EN", get_detect = T)
# A tibble: 1 x 2
  translation  source_lang
  <chr>        <chr>      
1 Hello world! DE   
```
Or we can just use `source_lang = "DE"` to tell the API what the source language is.

## Example 2: A multilingual version of `Hello World!` 
### First try 
```
hello <- c("Hallo Welt!", "Bonjour le monde !", "Hola Mundo!", "Ciao Mondo!", 
           "Hallo wereld!", "Witajcie świat!")
```
We want to translate the above strings into English. We use `toEnglish2`, a simple wrapper for `translate2(target_lang = "EN")`. With `map_chr` from the `purrr` package we apply the function to all elements of the character vector. 
```
purrr::map_chr(hello, deeplr::toEnglish2)
[1] "Hello world!"  "Hello, world!"  "Hello World!"  "Ciao Mondo!"  "Hallo wereld!"  "Hello the world!"
```
4 out of 6. Not a bad start.

### What went wrong?
Let's check for the source languages detected. For this we combine `detect2` with `map_chr`.
```
purrr::map_chr(hello, deeplr::detect2)
[1] "DE" "FR" "ES" "ES" "EN" "PL"
```
The API doesn't seem to recognize all languages correctly. This is not unusual with such short strings.

### Second try 
Let's give it some help. We create a vector with the correct source languages. 
```
source_lang <- c("DE", "FR", "ES", "IT", "NL", "PL")
```
We specify a translator function and use another `purrr` function (`map2_chr`) to map over the two inputs simultaneously.
```
translator <- function(text, source_lang) deeplr::toEnglish2(text = text, source_lang = source_lang)

purrr::map2_chr(hello, source_lang, translator)
[1] "Hello world!"  "Hello, world!"  "Hello World!"  "Hello World!"  "Hello world!"  "Hello the world!
```
Better!

## Example 3: Pimp your text
DeepL cannot only be used for translations, but also to improve texts. How does it work? We translate the text into a "help language" and back into the original language. Let's take a look at what DeepL does with typical mistakes that German speakers make in English.

### No. 1
```
m1 <- "In former times I lived in Zurich."

deeplr::pimp2(m1, help_lang = "DE")
[1] "I used to live in Zurich."
```
### No. 2
```
m2 <- "In the near of the main station."

deeplr::pimp2(m2, help_lang = "DE")
[1] "Near the main station."
```
### No. 3
```
m3 <- "In our English class we were five."

deeplr::pimp2(m3, help_lang = "DE")
[1] "There were five of us in our English class."
```
### No. 4
```
m4 <- "The dog of my friend like to bark."

deeplr::pimp2(m4, help_lang = "DE")
[1] "My friend's dog likes to bark."
```

## Example 4: Some additional testing
### Text to translate
```
nchar(Einstein)
[1] 869
```
*Near the beginning of his career, Einstein thought that Newtonian mechanics was no longer enough to reconcile the laws of classical mechanics with the laws of the electromagnetic field. This led him to develop his special theory of relativity during his time at the Swiss Patent Office in Bern (1902–1909), Switzerland. However, he realized that the principle of relativity could also be extended to gravitational fields, and he published a paper on general relativity in 1916 with his theory of gravitation. He continued to deal with problems of statistical mechanics and quantum theory, which led to his explanations of particle theory and the motion of molecules. He also investigated the thermal properties of light which laid the foundation of the photon theory of light. In 1917, he applied the general theory of relativity to model the structure of the universe.* (Source: [Wikipedia](https://en.wikipedia.org/wiki/Albert_Einstein))
```
deeplr::toGerman2(Einstein)
```
### The result
*Zu Beginn seiner Karriere dachte Einstein, dass die Newtonsche Mechanik nicht mehr ausreicht, um die Gesetze der klassischen Mechanik mit den Gesetzen des elektromagnetischen Feldes in Einklang zu bringen. Dies führte ihn während seiner Zeit am Schweizerischen Patentamt in Bern (1902-1909) zur Entwicklung seiner speziellen Relativitätstheorie. Allerdings erkannte er, dass das Prinzip der Relativitätstheorie auch auf Gravitationsfelder ausgedehnt werden kann, und veröffentlichte 1916 mit seiner Gravitationstheorie ein Papier über die allgemeine Relativitätstheorie. Er beschäftigte sich weiterhin mit Problemen der statistischen Mechanik und Quantentheorie, die zu seinen Erklärungen der Partikeltheorie und der Bewegung von Molekülen führten. Er untersuchte auch die thermischen Eigenschaften von Licht, die den Grundstein für die Photonentheorie des Lichts legten. Im Jahre 1917 wandte er die allgemeine Relativitätstheorie an, um die Struktur des Universums zu modellieren.*

**Quite impressive!!!**

### Timing
```
system.time(deeplr::toGerman2(Einstein))
       User      System verstrichen 
       0.01        0.00        1.91 
```
