#library ----
require(tidyverse)
require(igraph)
require(shiny)
require(RSiena)
require(rmdformats)
require(prettydoc)
require(hrbrthemes)
require(tint)
require(tufte)
require(psych)
require(RSelenium)
require(jsonlite)

#webpages PHD repositories ----
"UU", "RUG", "UvA", "EUR",
"Leiden", "RU", "VU", "UvT", "TU Delft",
"UvH"

oatd_html <- rvest::read_html("https://www.oatd.org")
ru_phd <- rvest::read_html("https://repository.ubn.ru.nl")



#universiteit-ranking ----
Universiteit <- c("UU", "RUG", "UvA", "EUR",
                  "Leiden", "RU", "VU", "UvT", "TU Delft",
                  "UvH")
Ranking <- c(66, 79, 61, 99, 77, 140, 125, 225, 48, "NA")
uni_ranking <- data.frame(Universiteit, Ranking)
# and then function? 


scholars[1]
