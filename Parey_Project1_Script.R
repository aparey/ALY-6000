getwd()
library(testthat)
# Aditya Parey Project 1 ALY 6000
"Tue Jul 16 13:59:42 2024"

#problem 1

123*453

5^2*40

TRUE & FALSE

TRUE | FALSE

75 %% 10

75/10


#problem 2

first_vector <- c(17,12,-33,5)
first_vector

#problem 3
counting_by_fives <- c(5,10,15,20,25,30,35)
counting_by_fives

#problem 4
second_vector <- c(20:1)
second_vector

#problem 5
counting_vector <- c(5:15)
counting_vector

#problem 6
grades <- c(96, 100, 85, 92, 81, 72)
grades

#problem 7
bonus_points_added <- c(grades + 3)
bonus_points_added

#problem 8
one_to_one_hundred <- c(1:100)
one_to_one_hundred 

#problem 9
second_vector + 20 #adds 20 to each value
second_vector * 20 #multiplies all the value by 20
second_vector >= 20 #displays all the values greater than or equal to 20
second_vector != 20 # != means "not equal"
#write explanations

#problem 10
total <- sum(1:100)
total

#problem 11
average_value <- mean(1:100)
average_value

#problem 12
median_value <- median(1:100)
median_value

#problem 13

max_value <- max(one_to_one_hundred)
max_value

#problem 14
min_value <- min(one_to_one_hundred)
min_value

#problem 15
first_value <- second_vector[1]
first_value

#problem 16
first_three_values <- second_vector[1:3]
first_three_values

#problem 17
vector_from_brackets <- second_vector[c(1,5,10,11)]
vector_from_brackets

#problem 18
vector_from_boolean_brackets <- first_vector[c(FALSE, TRUE, FALSE, TRUE)]
vector_from_boolean_brackets


#problem 19
second_vector >= 10


#problem 20
one_to_one_hundred[one_to_one_hundred >= 20]

#problem 21
lowest_grades_removed <- grades[grades > 85]
lowest_grades_removed

#problem 22
middle_grades_removed <- grades[-c(3,4)]
middle_grades_removed

#problem 23
fifth_vector <- second_vector[-c(5,10)]
fifth_vector

#problem 24
set.seed(5)
random_vector <- runif(n=10, min = 0, max = 1000)
random_vector

#problem 25
sum_vector <- sum(random_vector)
sum_vector

#problem 26
cumsum_vector <- cumsum(random_vector)
cumsum_vector

#problem 27
mean_vector <- mean(random_vector)
mean_vector

#problem 28
sd_vector <- sd(random_vector)
sd_vector

#problem 29
round_vector <- round(random_vector)
round_vector

#problem 30
sort_vector <- sort(random_vector)
sort_vector

#problem 31,32,33
first_dataframe <-read.csv("ds_salaries.csv")
summary(first_dataframe)


test_file("project1_tests.R")



