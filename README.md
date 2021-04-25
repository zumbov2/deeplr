[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/deeplr)](https://cran.r-project.org/package=deeplr)
[![Build Status](https://travis-ci.org/zumbov2/deeplr.svg?branch=master)](https://travis-ci.org/zumbov2/deeplr)
[![Licence](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![cranlogs](https://cranlogs.r-pkg.org/badges/grand-total/deeplr)](http://cran.rstudio.com/web/packages/deeplr/index.html)

# deeplr
This R package is an interface to the [DeepL API](https://www.deepl.com/docs-api). A [developer account](https://www.deepl.com/pro#developer) is required to use the service. There are currently two different subscriptions plans. The [DeepL API Free](https://www.deepl.com/pro#developer) is free of charge and allows a maximum of 500,000 characters/month to be translated. For the [DeepL API Pro](https://www.deepl.com/pro#developer) you pay a monthly fee and usage-dependent costs.

## Installation
For regularly updated version (latest: 2.0.0), install from GitHub:
```r
install.packages("devtools")
devtools::install_github("zumbov2/deeplr")
```

# Functions
The package provides functions for both subscriptions plans. Functions that call the free API end with a `2`.

## `available_languages`/`available_languages2`

``` r
al <- deeplr::available_languages2(my_key)

as.data.frame(al)
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

## translate

<sup>Created on 2021-04-25 by the [reprex package](https://reprex.tidyverse.org) (v1.0.0)</sup>


