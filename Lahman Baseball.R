# Install and load the Lahman library. This library contains a variety of 
# datasets related to US professional baseball. We will use this library for 
# the next few questions and will discuss it more extensively in the Regression course. 
# For now, focus on wrangling the data rather than understanding the statistics.

# The Batting data frame contains the offensive statistics for all 
# baseball players over several seasons.  Filter this data frame to define top as 
# the top 10 home run (HR) hitters in 2016:

library(Lahman)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()

# Also Inspect the Master data frame, which has demographic information for all players:

Master %>% as_tibble()


# Use the correct join or bind function to create a combined table of the names 
# and statistics of the top 10 home run (HR) hitters for 2016. 
# This table should have the player ID, first name, last name, and number of 
# HR for the top 10 players. Name this data frame top_names.

top_names <- top %>% left_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)

# Inspect the Salaries data frame. Filter this data frame to the 2016 salaries, 
# then use the correct bind join function to add a salary column to the 
# top_names data frame from the previous question. Name the new data frame top_salary.

top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names)%>%
  select(nameFirst, nameLast, teamID, HR, salary)

# Inspect the AwardsPlayers table. Filter awards to include only the year 2016.
# How many players from the top 10 home run hitters won at least one award in 2016?

Top_Awards_2016<- AwardsPlayers %>% filter(yearID == 2016) %>%
  inner_join(top_names)%>%
  select(nameFirst, nameLast, awardID)

# How many players won an award in 2016 but were not one of the 
# top 10 home run hitters in 2016?
Awards_2016<- AwardsPlayers %>% filter(yearID == 2016)

length(unique(Awards_2016$playerID))

setdiff(Top_Awards_2016, Awards_2016)





