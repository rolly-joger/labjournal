######################################### Title: Webscraping in R Author: Bas Hofstra Version:
######################################### 29-07-2021

rm(list=ls())
install.packages("RSelenium")
install.packages("netstat")
install.packages("pingr")
library(RSelenium)
library(pingr)
library(netstat)
?RSelenium

port <- netstat::free_port(random = TRUE)
pingr::ping_port("www.jochemtolsma.nl", port = port)
ping_port("r-project.org")
rD <- rsDriver(browser = "firefox", port = port, chromever = NULL, verbose = FALSE)
remDr <- rD[["client"]]


#pid <- rD$server$process$get_pid()  #get process id
#system(paste0("Taskkill /F /T", " /PID ", pid))
