#####Problem 1:
#Copy paste and run the tribble given below.
library(tidyverse)
tribble( ~x, ~y, ~w, ~z,
         210,   300,   220,   180,
         102,   100,   119,   187,
         176,   175,   188,   173,
         87,    95,   91,     94,
         202,   210,  234,    218,
         110,   122,  131,    128,
) -> dt
dt

## 1a) Use and show a map function to find the “mean” of each column of the dt data table
map_dbl(dt, mean)

## 1b) Use and show a map function to find the “standard deviation” of each column of the dt data table.
map_dbl(dt, sd)

## 1c) Use and show a map function that will calculate the “square root” of each value of each column of the data table dt.
map_df(dt, sqrt)

## 1d) Use and show a map function that will calculate the “square root” of each value of each column of the data table dt.
summary(dt)


##### Problem 2: 
library(ggplot2)

myfunction <- function(){
  s_means <- numeric(10000)
  for(i in seq_len(10000)) {
    s <- rexp(5, rate = 1)
    s_means[i] <- mean(s)
  }
  return(s_means)
} 
final_means <- myfunction()
ggplot(data=data.frame(final_means), aes(x=final_means))+
  geom_histogram(color = "red", fill = "blue")+
  labs(title = "Distribution of Means") 


## 2a) Repeat part 1 by using a map_*() function
map_function <- function(){
  s_means <- map_dbl(1:10000, ~mean(rexp(5, rate = 1)))
  return(s_means)
}  
final_means_2 <- map_function()

ggplot(data=data.frame(final_means_2), aes(x=final_means_2))+
  geom_histogram(color="red", fill = "blue")+
  labs(title = "Distribution of Means")

## 2b) Repeat part 1 by using the replicate() function
replicate_function <- function(){
  s_means <- replicate(10000, mean(rexp(5, rate = 1)))
  return(s_means)
} 
final_means_3 <- replicate_function() 

ggplot(data=data.frame(final_means_3), aes(x=final_means_3))+
  geom_histogram(color="red", fill = "blue")+
  labs(title = "Distribution of Means")

## 2c) Use a another for loop that will print out plots for sample sizes of 5, 10, and 20 observations (instead of just 5).
new_numbers <- c(5,10,20)
more_means <- function(new_numbers,n_iterations=10000) {
  s_means <- numeric(n_iterations)
  for(i in 1:n_iterations){
    s <- rexp(new_numbers, rate = 1)
    s_means[i] <- mean(s)
  }
  return(s_means)
} 
for (size in new_numbers)
  save_me <-more_means(size)
ggplot(data=data.frame(save_me), aes(x=save_me))+
  geom_histogram(color = "red", fill = "blue")+
  labs(title = "Distribution of Means") 
    
