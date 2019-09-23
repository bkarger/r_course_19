library(readr)
library(dplyr)

beijing_pm <- read_csv("Beijing_2017_HourlyPM25.csv", skip = 3)

beijing_pm <- beijing_pm %>%
  rename(sample_time = `Date (LST)`, value = Value,
         qc = `QC Name`) %>% select(sample_time, value, qc)
head(beijing_pm, n = 3)

beijing_pm <- beijing_pm %>% 
  mutate(aqi = cut(value,
                   breaks = c(0, 50, 100, 150, 200, 
                              300, 500, Inf),
  labels = c("Good", "Moderate", 
             "Unhealthy for Sensitive Groups",
             "Unhealthy", "Very Unhealthy",
             "Hazardous", "Beyond Index")))
head(beijing_pm, n = 3)                                                         

beijing_pm %>% 
  group_by(aqi) %>% 
  count()

beijing_pm %>% 
  group_by(aqi) %>% 
  summarize(mean_pm = mean(value))

beijing_pm %>% 
  mutate(qc = as.factor(qc))

beijing_pm %>% 
  group_by(qc) %>% 
  summarize(mean_pm = mean(value))
