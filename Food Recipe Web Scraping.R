# knowing which selector to use can be quite complicated. 
# To demonstrate this we will try to extract the recipe name, 
# total preparation time, and list of ingredients from this guacamole recipe. 
# Looking at the code for this page, it seems that the task is impossibly complex. 
# However, selector gadgets actually make this possible. SelectorGadget is piece 
# of software that allows you to interactively determine what CSS selector you need 
# to extract specific components from the webpage. If you plan on scraping data 
# other than tables, we highly recommend you install it.

# For the guacamole recipe page, we already have done this and determined 
# that we need the following selectors:

h <- read_html("http://www.foodnetwork.com/recipes/alton-brown/guacamole-recipe-1940609")
recipe <- h %>% html_node(".o-AssetTitle__a-HeadlineText") %>% html_text()
prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()


# You can see how complex the selectors are. 
# In any case we are now ready to extract what we want and create a list:

guacamole <- list(recipe, prep_time, ingredients)
guacamole

# Since recipe pages from this website follow this general layout, 
# we can use this code to create a function that extracts this information:

get_recipe <- function(url){
  h <- read_html(url)
  recipe <- h %>% html_node(".o-AssetTitle__a-HeadlineText") %>% html_text()
  prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
  ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()
  return(list(recipe = recipe, prep_time = prep_time, ingredients = ingredients))
} 

# and then use it on any of their webpages:


get_recipe("http://www.foodnetwork.com/recipes/food-network-kitchen/pancakes-recipe-1913844")

