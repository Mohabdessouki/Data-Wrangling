co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()
library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)

dat_tidy<- spread(dat, gender, admitted)


tmp <- gather(admissions, key, value, admitted:applicants)
tmp

# Combine the key and gender and create a new column called column_name to get 
# a variable with the following values: admitted_men, admitted_women, applicants_men 
# and applicants_women. Save the new data as tmp2

tmp2 <- unite(tmp, column_name, c(key, gender))