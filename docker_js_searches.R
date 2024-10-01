rm(list = ls())
install.packages("seleniumPipes")
library(seleniumPipes)
library(selenium)
library(RSelenium)
library(httr)
library(curl)
library(tidyverse)
selenium_server_available(4444L)
get_server_status(4444L)
sessionInfo()

url <- "https://www.ecosia.org"
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4444L, browserName = "firefox")
remDr$open()

remDr$navigate(url)
remDr$findElement(using = "css", value = "div.search-form__search-field")$highlightElement()
website <- remDr$findElement(using = "css", value = "div.search-form__search-field")$clickElement()
website$sendKeysToElement(list("CBG Namenbank", key = "enter")) #does not work

url <- "https://www.cbgfamilienamen.nl"
remDr$navigate(url)
remDr$findElement(using = "css", value = "input")$highlightElement()
remDr$findElement(using = "css", value = "input")$sendKeysToElement(list("Ou", key = "enter")) #works
remDr$findElement("link text", "analyse en verklaring")$highlightElement()
remDr$findElement("link text", "analyse en verklaring")$clickElement() #gotten to the right page 
remDr$findElement(using = "id", value = "href")$getElementText() #kan ik wat onder 'verklaring' staat krijgen?
#now i have to find a way to get the text beneath "kenmerken"
#then i have to make a df from all these things
#then i will have to make a list, and for each name, we split up the string
#then we apply "is_country"
#if "if_country" is true, then we print the name of the country 
#and then we have to see if we can clean something up 
