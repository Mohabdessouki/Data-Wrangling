# Load the following web page, which contains information about 
# Major League Baseball payrolls

library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)

# We learned that tables in html are associated with the table node.  
# Use the html_nodes() function and the table node type to extract the first table. 
# Store it in an object nodes:

nodes <- html_nodes(h, "table")

# The html_nodes() function returns a list of objects of class xml_node. 
# We can see the content of each one using, for example, the html_text() function. 
# You can see the content for an arbitrarily picked component like this:


html_text(nodes[[8]])


# If the content of this object is an html table, we can use the html_table() 
# function to convert it to a data frame:

html_table(nodes[[8]])


# Inspect the last three nodes

length(nodes)
html_table(nodes[[19]])
html_table(nodes[[20]])
html_table(nodes[[21]])

# Create a table called tab_1 using entry 10 of nodes. 
# Create a table called tab_2 using entry 19 of nodes

tab_1<- html_table(nodes[[10]])
tab_2<- html_table(nodes[[19]])

# Drop the No. column from tab_1

tab_1<- tab_1[-1]

# change the column names for each table to c("Team", "Payroll", "Average"). 
# Use a full_join() by the Team to combine these two tables.

columns_names<- c("Team", "Payroll", "Average")
names(tab_1)<- columns_names
names(tab_2)<- columns_names

full_join(tab_1, tab_2, by = "Team")












