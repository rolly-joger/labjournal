#webscraping but with clicking things ----
#own' packages----
fpackage.check <- function(packages) {
  lapply(packages, FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  })
}

fsave <- function(x, file = NULL, location = "./data/processed/") {
  ifelse(!dir.exists("data"), dir.create("data"), FALSE)
  ifelse(!dir.exists("data/processed"), dir.create("data/processed"), FALSE)
  if (is.null(file))
    file = deparse(substitute(x))
  datename <- substr(gsub("[:-]", "", Sys.time()), 1, 8)
  totalname <- paste(location, datename, file, ".rda", sep = "")
  save(x, file = totalname)  #need to fix if file is reloaded as input name, not as x. 
}

fload <- function(filename) {
  load(filename)
  get(ls()[ls() != "filename"])
}

fshowdf <- function(x, ...) {
  knitr::kable(x, digits = 2, "html", ...) %>%
    kableExtra::kable_styling(bootstrap_options = c("striped", "hover")) %>%
    kableExtra::scroll_box(width = "100%", height = "300px")
}

colorize <- function(x, color) {
  sprintf("<span style='color: %s;'>%s</span>", color, x)
}

# more formal packages ----
library(tidyverse)
library(httr)
library(xml2)
library(reshape2)
library(stringr)
library(selenider)
library(RSelenium)
library(jsonlite)
library(netstat)
library(pingr)
#start up selenium ----
# find a free port
port <- netstat::free_port(random = TRUE)

# ping port for confirmation
pingr::ping_port("www.jochemtolsma.nl", port = port)
ping_port("r-project.org")

#set up server and browser
rD <- rsDriver(browser = "chrome", port = port, chromever = "latest", verbose = FALSE)
remDr <- rD[["client"]]

#if stop --- do this 
#pid <- rD$server$process$get_pid()  #get process id
#system(paste0("Taskkill /F /T", " /PID ", pid))
#trial: follow tutorial ----
# navigate to RU staff page
remDr$open()
remDr$navigate("https://www.ru.nl/")

# handle cookies
remDr$findElement(using = "css", value = ".agree-button")$highlightElement()
remDr$findElement(using = "css", value = ".agree-button")$clickElement()

cookies <- remDr$getAllCookies()
saveRDS(cookies, "cookies.rds")
remDr$addCookie(name = cookies[[1]][["name"]], value = cookies[[1]][["value"]])

remDr$maxWindowSize()

