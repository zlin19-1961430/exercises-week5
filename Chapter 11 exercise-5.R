# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
install.packages("nycflights13")
library("nycflights13")
library("dplyr")
View(flights)

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(average = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
greatest_average_departure_delay <- filter(dep_delay_by_month, average == max(average, na.rm = TRUE)) %>%
  select(month)
# The July.
  
# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
arr_delay_by_month <- flights %>%
  group_by(dest) %>%
  summarize(average = mean(dep_delay, na.rm = TRUE)) %>%
  filter(average == min(average, na.rm = TRUE)) %>%
  select(dest)

# You can look up these airports in the `airports` data frame!
# The LEX.

# Which city was flown to with the highest average speed?
highest_ave_speed <- flights %>%
  group_by(origin) %>%
  summarize(average = mean(dep_delay, na.rm = TRUE)) %>%
  filter(average == max(average, na.rm = TRUE)) %>%
  select(origin)
# The EWR.
