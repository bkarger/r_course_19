library(tidyverse)


daily_show <- read_csv("https://raw.githubusercontent.com/geanders/RProgrammingForResearch/master/data/daily_show_guests.csv", skip = 4)

daily_show <- rename(daily_show, 
                     year = YEAR,
                     job = GoogleKnowlege_Occupation,
                     date = Show,
                     category = Group,
                     guest_name = Raw_Guest_List)

select(daily_show, category, guest_name)
slice(daily_show, 30:50)

sample_n(tbl = daily_show, size = 1)

arrange(daily_show, desc(category))
science <- filter(daily_show, category == "Science")
science

daily_show <- mutate(daily_show,
       job = str_to_title(job))
daily_show <- mutate(daily_show,
                     last_initial = str_sub(job,1,1))

#Load Necessary packages for functions used to explore the data
library(package = "haven")
library(package = "forcats")
library(package = "stringr")
#Read in SAS file using Readr package from Tidyverse
icu <- read_sas(data_file = "week_2_data-master/icu.sas7bdat")
#Selecting columns from ICU set based on ICU, ID, Age, Gender column names
icu <- select(.data = icu, ID, AGE, GENDER)
#changing names of column names to more workable labels
icu <- rename(.data = icu, 
              id = ID,
              age = AGE,
              gender = GENDER)
#
icu <- mutate(.data = icu,
              gender = as_factor(x = gender),
              gender = fct_recode(.f = gender,
                                  Male = "0",
                                  Female = "1"),
              id = str_c(id)) 

icu




ebola_liberia <- read_csv("week_2_data-master/country_timeseries.csv") %>% 
  select(Date,
         Cases_Liberia,
         Deaths_Liberia) %>%
  mutate(date = Date,
         cases = Cases_Liberia,
         deaths = Deaths_Liberia) %>%
  filter(!is.na(x = cases)) %>% 
  mutate(ratio = deaths/cases) %>% 
  print()

library(magrittr)
daily_show %>%
  slice(c(1:2)) %>%
  select(c(3,4))%>%
  print()

library(package = "haven")
icu <- read_sas("week_2_data-master/icu.sas7bdat") %>% 
  select(ID, AGE, GENDER) %>% 
  rename(id = ID,
         age = AGE, 
         gender = GENDER) %>% 
  mutate(gender = as_factor(x = gender),
         gender = fct_recode(.f = gender, 
                             Male = "0",
                             Female = "1"),
         id = str_c(id)) %>% 
  arrange(age) %>% 
  slice(1:10)

icu
