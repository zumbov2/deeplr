[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/deeplr)](https://cran.r-project.org/package=deeplr)
[![Build Status](https://travis-ci.org/zumbov2/deeplr.svg?branch=master)](https://travis-ci.org/zumbov2/deeplr)
[![cranlogs](https://cranlogs.r-pkg.org/badges/grand-total/deeplr)](http://cran.rstudio.com/web/packages/deeplr/index.html)

# deeplr
This R package is an interface to the [DeepL API](https://www.deepl.com/docs-api). A [developer account](https://www.deepl.com/pro#developer) is required to use the service. There are currently **two different** subscriptions plans. The [DeepL API Free](https://www.deepl.com/pro#developer) is free of charge and allows a maximum of 500,000 characters/month to be translated. For the [DeepL API Pro](https://www.deepl.com/pro#developer) you pay a monthly fee and usage-dependent costs.

## Installation
For regularly updated version (latest: 2.0.1), install from GitHub:
```r
install.packages("devtools")
devtools::install_github("zumbov2/deeplr")
```

# Functions
The package provides functions for both subscriptions plans. Functions that call the free API end with a `2`.

## Helpers
### `available_languages`/`available_languages2`
These functions allow you to list all supported languages of the API.

``` r
langs <- deeplr::available_languages2(my_key)
as.data.frame(langs)

#>    language       name
#> 1        BG  Bulgarian
#> 2        CS      Czech
#> 3        DA     Danish
#> 4        DE     German
#> 5        EL      Greek
#> 6        EN    English
#> 7        ES    Spanish
#> 8        ET   Estonian
#> 9        FI    Finnish
#> 10       FR     French
#> 11       HU  Hungarian
#> 12       IT    Italian
#> 13       JA   Japanese
#> 14       LT Lithuanian
#> 15       LV    Latvian
#> 16       NL      Dutch
#> 17       PL     Polish
#> 18       PT Portuguese
#> 19       RO   Romanian
#> 20       RU    Russian
#> 21       SK     Slovak
#> 22       SL  Slovenian
#> 23       SV    Swedish
#> 24       ZH    Chinese
```

### `usage`/`usage2`
These functions allow you to monitor how much you translate, as well as the limits set. 

``` r
deeplr::usage2(my_key)

#> $character_count
#> [1] 413
#> 
#> $character_limit
#> [1] 500000
```

## Main functions `translate`/`translate2`
With the main functions of the package, texts can be translated between the available languages. 

``` r
deeplr::translate2(
  text = "Das ist ein erster Test.",
  target_lang = "EN",
  auth_key = my_key
  )

#> [1] "This is a first test."
```

The functions are vectorised with respect to the inputs `text`, `target_lang` and `source_lang`. Accordingly, several texts can be translated from different languages into other languages in one API call.

``` r
deeplr::translate2(
  text = c(
    "I like to translate texts.",
    "Ich übersetze gerne Texte."
  ),
  target_lang = c("FR", "IT"),
  auth_key = my_key
  )

#> [1] "J'aime traduire des textes." "Mi piace tradurre testi."
```

If you want to translate several texts into the same language, then specify only one language in `target_lang`.

``` r
deeplr::translate2(
  text = c(
    "I like to translate texts.",
    "Ich übersetze gerne Texte."
  ),
  target_lang = "ZH",
  auth_key = my_key
)

#> [1] "我喜欢翻译文本。" "我喜欢翻译文本。"
```

Use `source_lang` when you want to be sure that the correct source language is used. If `source_lang = NULL`, DeepL will guess the language. In some cases this can lead to problems. If you want to know which language the system has chosen as the source language, you can display this information in the result.

``` r
deeplr::translate2(
  text = "Me llamo Javier.",
  target_lang = "EN",
  auth_key = my_key,
  get_detect = T
  )

#> # A tibble: 1 x 2
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
deeplr::toEnglish2(
  text = "機械学習とは、経験からの学習により自動で改善するコンピューターアルゴリズムもしくはその研究領域で",
  auth_key = my_key
  )

#> [1] "Machine learning is a computer algorithm or research area that automatically improves by learning from experience."
```

## Additional functions
### `pimp`/`pimp2`
These functions translate a text into an auxiliary language and back into the original language, leading to sometimes astonishing improvements in linguistic correctness.

``` r
deeplr::pimp2(
  text = "In former times I lived in Zurich.",
  source_lang = "EN",
  help_lang = "DE",
  auth_key = my_key
  )

#> [1] "I used to live in Zurich."
```

### `split_text`
Since a single API request can be no larger than 30 kbytes, large texts must be preprocessed, i.e. broken down into smaller pieces of text. This can be done with `split_text`, which splits texts into segments of a selectable maximum number of bytes.

``` r
text <- paste0(rep("This is a very long text.", 10000), collapse = " ")
deeplr::split_text(text, max_size_bytes = 29000)

#> # A tibble: 9 x 3
#>   text_id segment_id segment_text                                               
#>     <int>      <int> <chr>                                                      
#> 1       1          1 This is a very long text. This is a very long text. This i~
#> 2       1          2 This is a very long text. This is a very long text. This i~
#> 3       1          3 This is a very long text. This is a very long text. This i~
#> 4       1          4 This is a very long text. This is a very long text. This i~
#> 5       1          5 This is a very long text. This is a very long text. This i~
#> 6       1          6 This is a very long text. This is a very long text. This i~
#> 7       1          7 This is a very long text. This is a very long text. This i~
#> 8       1          8 This is a very long text. This is a very long text. This i~
#> 9       1          9 This is a very long text. This is a very long text. This i~
```


