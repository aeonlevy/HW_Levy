-### Web Scraping Homework
  ##Aeon and Joe 
  
  if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, dplyr, tidyverse)
library(tidyverse)
library(rvest)

au_staff <- "https://www.american.edu/cas/mathstat/faculty/"
html <- read_html(au_staff)
html 

staff_names <-html%>%
  html_nodes(".profile-name")%>%
  html_text(trim = TRUE) 

staff_email <- html %>%
  html_nodes(".profile-email") %>% 
  html_text(trim = TRUE) 

staff_phone <- html %>%
  html_nodes(".profile-phone") %>% 
  html_text(trim = TRUE) 

###um idk if this is what im supposed to do but im just gonna make a data frame

AUFACTULTYINFO <- data.frame(
  Staff_Name = staff_names,
  Staff_Email = staff_email,
  Staff_Phone = staff_phone,
  stringsAsFactors = FALSE
)

write.csv(AUFACTULTYINFO, "faculty.csv")

