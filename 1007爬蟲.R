# google套件擴增功能 selectgadget 點選開啟
library(xml2)
library(rvest)
url <- "https://price.591.com.tw/realprice-list.html"
web <- read_html(url)
time <- web %>%
  html_nodes(css = ".L-dealtime") %>% 
  html_text() %>% 
  as.data.frame()