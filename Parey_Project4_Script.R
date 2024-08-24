getwd()

#ALY 6000 SUMMER 2024
#Aditya Parey

library(ggplot2)
library(dplyr)
library(janitor)
library(lubridate)
library(readr)
library(tidyr)
library(testthat)

bike <- read.csv("bike.csv")
bike
summary(bike)

bike <- clean_names(bike)
names(bike)

bike <- na.omit(bike)
summary(bike)

# Remove specified columns
bike_cleaned <- bike %>% select(-instant, -dteday)

# Check the new structure of the dataset
summary(bike_cleaned)


# Compute descriptive statistics for 'cnt' column
mean_cnt <- mean(bike$cnt, na.rm = TRUE)
median_cnt <- median(bike$cnt, na.rm = TRUE)
sd_cnt <- sd(bike$cnt, na.rm = TRUE)

# Print the computed statistics
mean_cnt
median_cnt
sd_cnt

# Histogram of 'cnt'
ggplot(bike_cleaned, aes(x = cnt)) +
  geom_histogram(binwidth = 50, fill = "blue", color = "white") +
  labs(title = "Histogram of Total Bike Rentals", x = "Total Bike Rentals", y = "Frequency")


# Line plot of 'cnt' over 'hr'
ggplot(bike_cleaned, aes(x = hr, y = cnt)) +
  geom_line(stat = "summary", fun = "mean", color = "blue") +
  labs(title = "Average Hourly Bike Rentals", x = "Hour of the Day", y = "Average Total Bike Rentals")

# Boxplot of 'cnt' by 'season'
ggplot(bike_cleaned, aes(x = factor(season), y = cnt)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Total Bike Rentals by Season", x = "Season", y = "Total Bike Rentals") +
  scale_x_discrete(labels = c("1" = "Winter", "2" = "Spring", "3" = "Summer", "4" = "Fall"))

# Scatter plot of 'temp' vs 'cnt'
ggplot(bike_cleaned, aes(x = temp, y = cnt)) +
  geom_point(alpha = 0.5, color = "blue") +
  labs(title = "Total Bike Rentals vs. Temperature", x = "Temperature (Normalized)", y = "Total Bike Rentals")

# Bar plot of 'cnt' by 'workingday'
ggplot(bike_cleaned, aes(x = factor(workingday), y = cnt)) +
  geom_bar(stat = "summary", fun = "mean", fill = "lightblue") +
  labs(title = "Average Bike Rentals on Working Days vs. Non-Working Days", x = "Working Day", y = "Average Total Bike Rentals") +
  scale_x_discrete(labels = c("0" = "Non-Working Day", "1" = "Working Day"))


















