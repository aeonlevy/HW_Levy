-### Web Scraping Homework
  ##Aeon and Joe 
  
  if (!require("pacman")) install.packages("pacman")
pacman::p_load(rvest, dplyr, tidyverse)
library(tidyverse)
library(rvest)

au_staff <- "https://www.american.edu/cas/mathstat/faculty/"
html <- read_html(au_staff)
html 

staff_names <-html|> 
  html_elements(".profile-name")|> 
  html_text2() 
staff_names


staff_email <- html|> 
  html_elements(".profile-email")|> 
  html_text2() 
staff_email

staff_phone <- html|> 
  html_elements(".profile-phone")|> 
  html_text2() 
staff_phone

###um idk if this is what im supposed to do but im just gonna make a data frame

AUFACTULTYINFO <- data.frame(
  Staff_Name = staff_names,
  Staff_Email = staff_email,
  Staff_Phone = staff_phone,
  stringsAsFactors = FALSE
)

write.csv(AUFACTULTYINFO, "faculty.csv")

