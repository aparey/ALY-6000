#Aditya Parey
#"Mon Jul 22 13:18:59 2024"


#install.packages("tidyverse")
#install.packages("pacman")
#library(tidyverse)
#library(testthat)
#library(pacman)


#Question 1
data_2015 <- read.csv("2015.csv")
head(data_2015)

#Question 2
names(data_2015)

#Question 3
view(data_2015)

#Question 4
glimpse(data_2015)

#Question 5

#install.packages("janitor")
library(janitor)
data_2015 <- clean_names(data_2015) 
data_2015

#Question 6

library(dplyr)
# Select the required columns and store them in a new data frame
happy_df <- data_2015 %>% select( country, region, happiness_score, freedom)
head(happy_df)

#Question 7
top_ten_df <- slice(happy_df,1:10)
top_ten_df

#Question 8
no_freedom_df <- filter(happy_df, freedom < 0.20)
no_freedom_df

#Question 9
best_freedom_df <- arrange(happy_df, desc(freedom))
head(best_freedom_df)

#Question 10 
data_2015 <- data_2015 %>% mutate(gff_stat = family + freedom + generosity)
head(data_2015)


#Question 11
regional_stats_df <- happy_df %>%
  group_by(region) %>%
  summarise(
    country_count = n(),
    mean_happiness = mean(happiness_score, na.rm = TRUE),
    mean_freedom = mean(freedom, na.rm = TRUE)
  )
  
regional_stats_df


###---------------------------###

#Question 12

baseball <- read.csv("baseball.csv")
head(baseball)


#Question 14

baseball <- baseball %>% filter(AB != 0)
head(baseball)
print(nrow(baseball))


#Question 15


baseball <- baseball %>% mutate(BA = H / AB)
head(baseball)
print(nrow(baseball))
# For testing purposes, we can print BA for any player
#print(baseball$BA[8])


#Question 16

baseball <- baseball %>% mutate(OBP = (H + BB) / (AB + BB))
head(baseball)
print(nrow(baseball))
 
# For testing purposes, we can print OBP of any player
#print(baseball$OBP[25])



#Question 17

strikeout_artist <- baseball %>% arrange(desc(SO)) %>% head(10)
strikeout_artist


###method 2
#strikeout_artist <- baseball %>% arrange(desc(SO)) %>% filter(row_number()<= 10)


#Question 18


eligible_df <- baseball %>% filter(AB >= 300 | G >= 100)
eligible_df
print(nrow(eligible_df))



#Question 19
library(ggplot2)
ggplot(eligible_df, aes(x = BA)) +
  geom_histogram(binwidth = 0.01, fill = "black", color = "yellow") +
  labs(title = "Histogram of Batting Averages for Eligible Players",
       x = "Batting Average (BA)",
       y = "Frequency")


#Project Testing
test_file("project2_tests.R")
date()










