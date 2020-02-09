# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
View(flights)

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
arr_delay_by_des <- flights %>%
  group_by(dest) %>%
  summarize(ave_arr_delay = mean(dep_delay, na.rm = TRUE))
  
joined_df <- left_join(flights, arr_delay_by_des, by = "dest")
View(joined_df)

largest_ave_arr_delay <- filter(arr_delay_by_des, ave_arr_delay == max(ave_arr_delay, na.rm = TRUE)) %>%
  select(dest)
# CAE airport had the largest average arrival delay.

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
delay_delay_by_airline <- flights %>%
  group_by(carrier) %>%
  summarize(ave_arr_delay_airline = mean(dep_delay, na.rm = TRUE))

joined_df2 <- left_join(flights, delay_delay_by_airline, by = "carrier")

smallest_ave_arr_delay <- filter(delay_delay_by_airline, ave_arr_delay_airline == min(ave_arr_delay_airline, na.rm = TRUE)) %>%
  select(carrier)
# The US airline had the smallest average arrival delay.