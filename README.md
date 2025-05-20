[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/deeplr)](https://cran.r-project.org/package=deeplr)
[![cranlogs](https://cranlogs.r-pkg.org/badges/grand-total/deeplr)](http://cran.rstudio.com/web/packages/deeplr/index.html)

# deeplr
This R package is an interface to the [DeepL API](https://developers.deepl.com/docs). A [developer account](https://www.deepl.com/pro#developer) is required to use the service. There are currently **two different** subscription plans. The [DeepL API Free](https://www.deepl.com/pro#developer) is free of charge and allows a maximum of 500,000 characters/month to be translated. For the [DeepL API Pro](https://www.deepl.com/pro#developer) you pay a monthly fee and usage-dependent costs.

## Installation
For regularly updated version (latest: 2.1.0), install from GitHub:

```r
install.packages("devtools")
devtools::install_github("zumbov2/deeplr")
```

## Authentication
To use the API, you must set your DeepL API key. Starting from version 2.1.0, the package looks for an environment variable called DEEPL_API_KEY.

### Option 1: Temporarily (per R session)

```r
Sys.setenv(DEEPL_API_KEY = "your-key-here")
```

### Option 2: Permanently

Add the following line to your `.Renviron` file (e.g. via `usethis::edit_r_environ()`):

```
DEEPL_API_KEY=your-key-here
```

# Functions
The package provides functions for both subscriptions plans. Functions that call the free API end with a `2`.

## Helpers
### `available_languages`/`available_languages2`
These functions allow you to list all supported languages of the API.

``` r
deeplr::available_languages2()
#> # A tibble: 30 × 2
#>    language name     
#>    <chr>    <chr>    
#>  1 AR       arabic   
#>  2 BG       Bulgarian
#>  3 CS       Czech    
#>  4 DA       Danish   
#>  5 DE       German   
#>  6 EL       Greek    
#>  7 EN       English  
#>  8 ES       Spanish  
#>  9 ET       Estonian 
#> 10 FI       Finnish  
#> # … with 20 more rows
```

### `usage`/`usage2`
These functions allow you to monitor how much you translate, as well as the limits set. 

``` r
deeplr::usage2()
#> $character_count
#> [1] 544
#> 
#> $character_limit
#> [1] 500000
```

## Main functions `translate`/`translate2`
With the main functions of the package, texts can be translated between the available languages. 

``` r
deeplr::translate2(
  text = "Das ist ein erster Test.",
  target_lang = "EN"
  )
#> [1] "This is a first test."
```

The functions are vectorised with respect to the inputs `text`, `target_lang` and `source_lang`. Accordingly, several texts can be translated from different languages into other languages in one API call.

``` r
deeplr::translate2(
  text = c("I like to translate texts.", "Ich übersetze gerne Texte."),
  target_lang = c("FR", "IT"),
  )
#> [1] "J'aime traduire des textes." "Mi piace tradurre testi."
```

If you want to translate several texts into the same language, then specify only one language in `target_lang`.

``` r
deeplr::translate2(
  text = c("I like to translate texts.", "Ich übersetze gerne Texte."),
  target_lang = "ZH"
  )
#> [1] "我喜欢翻译文本。" "我喜欢翻译文本。"
```

Use `source_lang` when you want to be sure that the correct source language is used. If `source_lang = NULL`, DeepL will guess the language. In some cases this can lead to problems. If you want to know which language the system has chosen as the source language, you can display this information in the result.

``` r
deeplr::translate2(
  text = "Me llamo Javier.",
  target_lang = "EN",
  get_detect = T
  )
#> # A tibble: 1 × 2
#>   translation        source_lang
#>   <chr>              <chr>      
#> 1 My name is Javier. ES
```

## Convenience functions
The package offers the following convenience functions:

* `toChinese`/`toChinese2`
* `toEnglish`/`toEnglish2`
* `toFrench`/`toFrench2`
* `toGerman`/`toGerman2`
* `toItalian`/`toItalian2`
* `toJapanese`/`toJapanese2`
* `toPortuguese`/`toPortuguese2`
* `toRussian`/`toRussian2`
* `toSpanish`/`toSpanish2`

``` r
deeplr::toEnglish2("機械学習とは、経験からの学習により自動で改善するコンピューターアルゴリズムもしくはその研究領域で")
#> [1] "Machine learning is a computer algorithm or area of research that automatically improves by learning from experience."
```

## Handling glossaries (from version 2.1.0)

As of version **2.1.0**, the `deeplr` package supports [DeepL glossaries](https://developers.deepl.com/docs/api-reference/glossaries), which allow you to define and manage your own custom translation pairs.

* `supported_glossary_language_pairs()`/`supported_glossary_language_pairs2()` – check which language pairs are supported for glossaries
* `create_glossary()`/`create_glossary2()` – create a new glossary
* `get_glossary_entries()`/`get_glossary_entries2()` – list the entries of a glossary
* `delete_glossary()`/`delete_glossary2()` – delete a glossary

### Example: Create and use a glossary

``` r
# Create glossary (e.g. for English–German)
glossary <- deeplr::create_glossary2(
  name = "Schwiizerdütsch",
  source_lang = "EN",
  target_lang = "DE",
  entries_source_lang = c("Sorry", "Croissant"),
  entries_target_lang = c("Exgüsi", "Gipfeli")
  )

# Inspect entries
deeplr::get_glossary_entries2(glossary$glossary_id)
#> # A tibble: 2 × 2
#>   EN        DE     
#>   <chr>     <chr>  
#> 1 Croissant Gipfeli
#> 2 Sorry     Exgüsi

# Use glossary in translation (source and target lang must be set)
deeplr::translate2(
  "Sorry, I would like two croissants, please.", 
  source_lang = "EN",
  target_lang = "DE",
  glossary_id = glossary$glossary_id
  )
#> [1] "Exgüsi, ich hätte gerne zwei Gipfeli, bitte."

# Delete glossary when no longer needed
deeplr::delete_glossary2(glossary$glossary_id)
#> Glossary '76e7296a-edb0-438e-97f7-72bc12f1971b' has been successfully deleted.
```

## Additional functions
### `pimp`/`pimp2`
These functions translate a text into an auxiliary language and back into the original language, leading to sometimes astonishing improvements in linguistic correctness.

``` r
deeplr::pimp2(
  text = "In former times I lived in Zurich.",
  source_lang = "EN",
  help_lang = "DE"
  )
#> [1] "I used to live in Zurich."
```

### `split_text`
Since a single API request can be no larger than 30 kbytes, large texts must be preprocessed, i.e. broken down into smaller pieces of text. This can be done with `split_text`, which splits texts into segments of a selectable maximum number of bytes.
``` r
text <- paste0(rep("This is a very long text.", 10000), collapse = " ")
deeplr::split_text(text, max_size_bytes = 29000)
#> # A tibble: 9 × 3
#>   text_id segment_id segment_text                                               
#>     <int>      <int> <chr>                                                      
#> 1       1          1 This is a very long text. This is a very long text. This i…
#> 2       1          2 This is a very long text. This is a very long text. This i…
#> 3       1          3 This is a very long text. This is a very long text. This i…
#> 4       1          4 This is a very long text. This is a very long text. This i…
#> 5       1          5 This is a very long text. This is a very long text. This i…
#> 6       1          6 This is a very long text. This is a very long text. This i…
#> 7       1          7 This is a very long text. This is a very long text. This i…
#> 8       1          8 This is a very long text. This is a very long text. This i…
#> 9       1          9 This is a very long text. This is a very long text. This i…
```





