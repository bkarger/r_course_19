library(tidyverse)
library(lubridate)
beijing_pm_raw <- read_csv("Beijing_2017_HourlyPM25.csv", skip = 3,
                           na = '-999')
beijing_pm <- beijing_pm_raw %>% 
  rename(sample_time =  `Date (LST)` ,
         value = Value,
         qc =  `QC Name` ) %>% 
  select(sample_time, value, qc) %>% 
  mutate(aqi = cut(value,breaks = c(0, 50, 100, 150, 200, 300, 500, Inf),
                   labels = c("Good", "Moderate","Unhealthy for Sensitive Groups",
                              "Unhealthy", "Very Unhealthy",
                              "Hazardous", "Beyond Index"))) %>%
  mutate(sample_time = mdy_hm(sample_time)) %>%
  mutate(heating = sample_time < mdy("03/15/2017"))

slice(beijing_pm, (1:3))

ggplot(beijing_pm) +
  geom_point(aes(x = sample_time, y = value, 
                 color = aqi))

library(faraway)
data("worldcup")
  

worldcup %>%
  filter(Team, Spain)
  ggplot(aes(x = Shots, y = tackles,
             color = Position))

worldcup %>% 
  filter(Team %in% c("Spain", "Germany", "Netherlands", "Uraguay"))%>%
  ggplot(aes(x = Shots, y = Tackles, color = Position, shape = Team)) +
  geom_point() +
  geom_text(aes(x = Shots, y = Tackles, color = Position, label = Name), size = 2.5)

worldcup %>% 
  mutate(top_4 = Team %in% c("Spain", "Germany", "Netherlands", "Uraguay")) %>% 
  ggplot(aes(x = Time, y = Passes, color = top_4)) +
  geom_point()


ggplot(worldcup) +
  geom_point(aes(x = Time, y = Passes, color = Position), 
             alpha = 0.5) +
  labs(x = "Time (mins)", y = "Number of Passes") +
  ggtitle("World Cup Stats",
          subtitle = "2010 WC")

ggplot(worldcup) +
  geom_histogram(aes(x = Time))

worldcup %>% 
  ggplot(aes(x = Time)) +
  geom_histogram()




