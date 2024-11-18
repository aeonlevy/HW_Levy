### Web Scraping Homework
##Aeon and Joe 

if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, dplyr, tidyverse)
library(tidyverse)
library(rvest)

au_staff <- "https://www.american.edu/cas/mathstat/faculty/"
html <- read_html(au_staff)
html 
  
staff_names <-html%>%
  html_nodes("profile-name")%>%
  html_text2()

staff_email <- html %>%
  html_nodes("profile-email") %>% 
  html_text2()

staff_phone <- html %>%
  html_nodes("profile-phone") %>% 
  html_text2()