# The Wikipedia page on opinion polling for the Brexit referendum, 
# in which the United Kingdom voted to leave the European Union in June 2016, 
# contains several tables. One table contains the results of all polls regarding 
# the referendum over 2016:

library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
ht <- read_html(url)

# Assign tab to be the html nodes of the "table" class.

tab <- html_nodes(ht, "table")

# How many tables are in this Wikipedia page?

length(tab)

# Inspect the first several html tables using html_table() with the argument fill=TRUE
# What is the first table number to have 9 columns where the first column 
# is named "Date(s) conducted"?

html_table(tab[[1]], fill = TRUE)
html_table(tab[[2]], fill = TRUE)
html_table(tab[[3]], fill = TRUE)
html_table(tab[[4]], fill = TRUE)
html_table(tab[[5]], fill = TRUE)







