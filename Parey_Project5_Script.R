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

#Question 1 
ball <- read.csv("ball-dataset.csv")
ball


#Question 2
freq_color <- ball %>%
  count(color, name = "count")
freq_color

#Question 3
freq_label <- ball %>%
  count(label, name = "count")
freq_label

# Question 4
ggplot(freq_color, aes(x = color, y = count, fill = color)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("blue", "green", "red", "yellow"))+
  labs(title = "Counts of Different Ball Colors",
       x = "Ball Color",
       y = "Count") +
  theme_minimal()


#Question 5
freq_label <- ball %>%
  count(label, name = "count")
freq_label

ggplot(freq_label, aes(x = label, y = count, fill = label)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("A" = "blue", "B" = "green", "C" = "red", "D" = "yellow", "E" = "purple")) +
  labs(title = "Counts of Different Ball Labels",
       x = "Label",
       y = "Count") +
  theme_minimal()


#Question 6
prob6_result <- prob6_result <- nrow(filter(ball, color == "green")) / 1000
prob6_result

#Question 7
prob7_result <- nrow(filter(ball, color %in% c("blue", "red"))) / 1000
prob7_result

#Question 8
prob8_result <- nrow(filter(ball, label %in% c("A", "C"))) / 1000
prob8_result

#Question 9
prob9_result <- nrow(filter(ball, color == "yellow" & label == "D")) / 1000
prob9_result

#Question 10
prob10_result <- nrow(filter(ball, color == "yellow" | label == "D")) / 1000
prob10_result

#Question 11
prob_blue <- nrow(filter(ball, color == "blue")) / 1000
prob_red_after_blue <- nrow(filter(ball, color == "red")) / (1000 - 1)
prob11_result <- prob_blue * prob_red_after_blue
prob11_result

#Question 12
green_balls <- nrow(filter(ball, color == "green"))
prob1 <- green_balls / 1000
prob2 <- (green_balls - 1) / (1000 - 1)
prob3 <- (green_balls - 2) / (1000 - 2)
prob4 <- (green_balls - 3) / (1000 - 3)
prob12_result <- prob1 * prob2 * prob3 * prob4
prob12_result



#Question 13

total_balls <- nrow(ball)
red_balls <- nrow(filter(ball, color == "red"))
prob_red_first <- red_balls / total_balls
label_b_balls <- nrow(filter(ball, label == "B"))
prob_b_after_red <- label_b_balls / (total_balls - 1)
prob13_result <- prob_red_first * prob_b_after_red
prob13_result

#Question 14
my_factorial <- function(n) {
  if (n == 0) {
    return(1)  # The factorial of 0 is defined as 1
  } else {
    result <- 1
    for (i in 1:n) {
      result <- result * i
    }
    return(result)
  }
}
my_factorial(0)  
my_factorial(3)  
my_factorial(5)  

#Question 15
outcomes <- c("H", "T")
coin_outcomes <- as_tibble(t(replicate(2^4, sample(outcomes, 4, replace = TRUE))))
colnames(coin_outcomes) <- c("flip1", "flip2", "flip3", "flip4")
coin_outcomes

#Question 16
set.seed(123)  
outcomes <- expand.grid(flip1 = c("H", "T"), flip2 = c("H", "T"), flip3 = c("H", "T"), flip4 = c("H", "T"))

outcomes <- outcomes %>%
  mutate(probability = prob_heads^(rowSums(across(starts_with("flip")) == "H")) * 
           prob_tails^(rowSums(across(starts_with("flip")) == "T")))

outcomes <- outcomes %>%
  mutate(num_heads = rowSums(across(starts_with("flip")) == "H"))

probability = 1 / nrow(coin_outcomes)

outcomes


#Question 17

num_heads_prob <- outcomes %>%
  group_by(num_heads) %>%
  summarise(probability = sum(probability))
num_heads_prob


#Question 18

num_heads_prob %>% filter(num_heads == 3)
prob18_result <- num_heads_prob %>%
  filter(num_heads == 3) %>%
  pull(probability)
prob18_result


#Question 19

prob19_result <- num_heads_prob %>%
  filter(num_heads == 2 | num_heads == 4) %>%
  summarise(probability = sum(probability)) %>%
  pull(probability)
prob19_result


#Question 20

prob20_result <- num_heads_prob %>%
  filter(num_heads <= 3) %>%
  summarise(probability = sum(probability)) %>%
  pull(probability)
prob20_result

#Question 21


coin_outcomes <- coin_outcomes %>%
  mutate(outcome = paste0(flip1, flip2, flip3, flip4))

ggplot(coin_outcomes, aes(x = outcome, y = probability)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(title = "Probability of Each Coin Flip Outcome",
       x = "outcome",
       y = "probability") +
  theme_minimal()

#Question 22

mysim <- function () {
  home <- ifelse(runif(5) < 0.75,1,0)
  away <- ifelse(runif(5) < 0.50,1,0)
  series <- c(home,away)
  return (sum(series))
  
}
mysim()


n_simulations <- 100000
results <- replicate(n_simulations, mysim())
prob22_result <- mean(results == 10)
prob22_result


#Question 23

mysim <- function() {
  home <- ifelse(runif(5) < 0.75, 1, 0) 
  away <- ifelse(runif(5) < 0.50, 1, 0)  
  series <- c(home, away)
  return(sum(series))  
}
n_simulations <- 100000
results <- replicate(n_simulations, mysim())
prob23_result <- mean(results > 1)
prob23_result


#Question 24

#Number of ways = (5/3)*(5/2)
ways_home <- choose(5, 3)
ways_away <- choose(5, 2)
prob24_result <- ways_home * ways_away
prob24_result



test_file("project5_tests.R")

date()





















