getwd()

#Aditya Parey ALY 6000 Summer 2024
#date()


library(ggplot2)
library(dplyr)
library(janitor)
library(lubridate)
library(readr)
library(tidyr)
library(testthat)

n <- 7
p <- 0.65

#Question 1

# Parameters
n <- 7  
p <- 0.65 
k <- 5  
prob1_result <- dbinom(k, size = n, prob = p)
prob1_result

#Question 2
possible_wins <- 0:7


probabilities <- sapply(possible_wins, function(wins) dbinom(wins, size = n, prob = p))

prob2_result <- data.frame(wins = possible_wins, probability = probabilities)
prob2_result

#Question 3

prob3_result <- pbinom(4, size = n, prob = p)
prob3_result

#Question 4

prob4_result <- pbinom(5, size = n, prob = p) - pbinom(2, size = n, prob = p)
prob4_result

#Question 5

prob5_result <- 1 - pbinom(4, size = n, prob = p)
prob5_result

#Question 6
# Theoretical expected value
prob6_result <- n * p
prob6_result

#Question 7

prob7_result <- n * p * (1 - p)
prob7_result

#Question 8
set.seed(10)  
random_wins <- rbinom(1000, size = n, prob = p)
random_wins

#Question 9

prob9_result <- mean(random_wins)
prob9_result

#Question 10
prob10_result <- var(random_wins)
prob10_result

#### Call Centre ###

#Question 11
# Parameters
cc <- 7 
prob11_result <- dpois(6, lambda = cc)
prob11_result

#Question 12

cc_8_hours <- cc * 8
prob12_result <- ppois(40, lambda = cc_8_hours)
prob12_result

#Question 13

cc_5_employees <- cc_8_hours * 5

prob13_result <- 1 - ppois(274, lambda = cc_5_employees)
prob13_result

#Question 14

cc_4_employees <- cc_8_hours * 4

prob14_result <- 1 - ppois(274, lambda = cc_4_employees)
prob14_result

#Question 15

prob15_result <- qpois(0.9, lambda = cc_8_hours)
prob15_result

#Question 16
set.seed(15) 

random_calls <- rpois(1000, lambda = cc_8_hours)
random_calls


#Question 17

prob17_result <- mean(random_calls)
prob17_result

#Question 18

prob18_result <- var(random_calls)
prob18_result


### Light Bulbs ###

#Question 19

mean_lifespan <- 2000
sd_lifespan <- 100
prob19_result <- pnorm(2200, mean = mean_lifespan, sd = sd_lifespan) - pnorm(1800, mean = mean_lifespan, sd = sd_lifespan)
prob19_result

#Question 20

prob20_result <- 1 - pnorm(2500, mean = mean_lifespan, sd = sd_lifespan)
prob20_result

#Question 21 

prob21_result <- ceiling(qnorm(0.10, mean = mean_lifespan, sd = sd_lifespan))
prob21_result

#Question 22
set.seed(25)  
random_lifespans <- rnorm(10000, mean = mean_lifespan, sd = sd_lifespan)
random_lifespans

#Question 23

prob23_result <- mean(random_lifespans)
prob23_result

#Question 24 

prob24_result <- sd(random_lifespans)
prob24_result

#Question 25

set.seed(1) 

sample_means <- replicate(1000, mean(sample(random_lifespans, 100)))
prob25_result <- sample_means
prob25_result

#Question 26

sample_means_df <- data.frame(sample_mean = prob25_result)

ggplot(sample_means_df, aes(x = sample_mean)) +
  geom_histogram(binwidth = diff(range(sample_means_df$sample_mean)) / 30, fill = "mediumblue", color = "lightpink") +
  labs(title = "Histogram of Sample Means", x = "Sample Mean", y = "Frequency") +
  theme_minimal()

#Question 27


prob27_result <- mean(prob25_result)
prob27_result

### Penguins ###
### Sources ###
###https://allisonhorst.github.io/palmerpenguins/###
install.packages("palmerpenguins")
library(palmerpenguins)

names(penguins)
summary(penguins)
head(penguins)


#Question 28
adelie_penguins <- subset(penguins, species == "Adelie")

ggplot(adelie_penguins, aes(x = flipper_length_mm)) +
  geom_histogram(aes(y = ..density..), binwidth = 2, fill = "skyblue", color = "black") +
  geom_density(alpha = 0.2, fill = "red") +
  labs(title = "Distribution of Flipper Length for Adélie Penguins", x = "Flipper Length (mm)", y = "Density") +
  theme_minimal()

#Question 29

gentoo_penguins <- subset(penguins, species == "Gentoo")



ggplot(gentoo_penguins, aes(x = flipper_length_mm, y = bill_depth_mm)) +
  geom_point(aes(color = species), size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Flipper Length vs Beak Depth for Gentoo Penguins", x = "Flipper Length (mm)", y = "Beak Depth (mm)") +
  theme_minimal()




test_file("project6_tests.R")


