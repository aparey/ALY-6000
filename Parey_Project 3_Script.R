getwd()

#Aditya Parey ALY 6000 Summer 2024
date()



library(ggplot2)
library(dplyr)
library(janitor)
#install.packages("lubridate")
library(lubridate)
library(readr)
library(tidyr)
library(testthat)



# Question 1
# Read the CSV file into a data frame
books <- read.csv("books.csv")
books
summary(books)

# Standardize column names using clean_names
books <- clean_names(books)
names(books)

# Question 2
# Convert the first_publish_date column to date type using mdy
books$first_publish_date <- mdy(books$first_publish_date)
#books$first_publish_date
summary(books$first_publish_date)



# Question 3
# Extract the year from first_publish_date and place it in a new column named year
books <- books %>% mutate(year = year(first_publish_date))
#books$first_publish_date
head()

# Question 4
# Filter the dataset to include books published between 1990 and 2020 (inclusive)
books <- books %>% filter(year >= 1990 & year <= 2020)
#books
summary(books)

# Question 5
# Remove the specified columns from the books data frame

books <- books %>% select(-c(publish_date, edition, characters, price, genres, setting, isbn))
names(books)


# Question 6
# Keep only books that are fewer than 700 pages
books_filtered <- books %>% filter(pages < 700)
book_titles <- books_filtered %>% select(title)
nrow(book_titles)



# Question 7
# Remove any rows that contain NAs
books <- books %>% drop_na()
nrow(books)


#Question 8
glimpse(books)

#Question 9
summary(books)

#Question 10

ggplot(books, aes(x = rating)) +
  geom_histogram(binwidth = 0.25, fill = "red", color = "yellow") +
  labs(title = "Books Histogram",
       x = "Rating",
       y = "Number of Books")


#Question 11


ggplot(books, aes(x = pages)) +
  geom_boxplot( fill = "red", color = "yellow") +
  labs(title = "Box Plot of Page Counts",
       x = "Frequency",
       y = "Pages") 




#Question 12

by_year <- books %>%
  group_by(year) %>%
  summarize(total_books = n())

by_year

#Question 13


# Filter by_year to include only years from 1990 to 2020
by_year_filtered <- by_year %>%
  filter(year >= 1990 & year <= 2020)

# Create the plot
ggplot(by_year_filtered, aes(x = year, y = total_books)) +
  geom_line() +
  geom_point() +
  labs(title = "Total Number of Books Rated Per Year",
       x = "Year",
       y = "Total Books") +
  theme_minimal()


#Question 14

book_publisher <- books %>%
  group_by(publisher) %>%
  summarize(book_count = n(), .groups = 'drop')

book_publisher



#Question 15

book_publisher <- book_publisher %>%
  filter(book_count >= 125)

book_publisher

#Question 16
book_publisher <- book_publisher %>%
  arrange(desc(book_count))
book_publisher

#Question 17
book_publisher <- book_publisher %>%
  mutate(cum_counts = cumsum(book_count))
book_publisher

#Question 18
book_publisher <- book_publisher %>%
  mutate(rel_freq = book_count / sum(book_count))
book_publisher

#Question 19
book_publisher <- book_publisher %>%
  mutate(cum_freq = cumsum(rel_freq))
book_publisher

#Question 20
book_publisher <- book_publisher %>%
  mutate(publisher = factor(publisher, levels = publisher))
book_publisher

#Question 21

ggplot(book_publisher, aes(x = publisher, y = book_count)) +
  geom_bar(stat = "identity", fill = "cyan") +  # Bar chart with cyan bars
  geom_line(aes(y = cum_counts), color = "blue", size = 1) +  # Add cumulative count line
  geom_point(aes(y = cum_counts), color = "blue") +  # Add points for cumulative counts
  labs(title = "Book Counts (1990 - 2020)",
       x = "Publisher",
       y = "Number of Books") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels
  scale_y_continuous(sec.axis = sec_axis(~., name = "Cumulative Counts"))


#Question 22

# Plot cumulative frequency line chart
ggplot(book_publisher, aes(x = reorder(publisher, -cum_freq), y = cum_freq, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "blue") +
  labs(title = "Cumulative Frequency of Books by Publisher",
       x = "Publisher",
       y = "Cumulative Frequency") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



#Project Testing
test_file("project3_tests.R")
date()

