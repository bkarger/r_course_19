library(faraway)
library(dplyr)
data("worldcup")

mean(worldcup$Saves)
#Mean saves of goalies
worldcup %>% 
  filter(Position == "Goalkeeper") %>% 
  summarize(mean_saves = mean(Saves))
#Mean saves among any other position
worldcup  %>% 
  filter(Position != "Goalkeeper") %>% 
  summarize(mean_saves2 = mean(Saves))
# Number of playyers for each position
worldcup %>% 
  group_by(Position) %>% 
  count()
#How many forwards on each team, which team's forwards scored the most.
worldcup %>% 
  filter(Position == "Forward") %>% 
  group_by(Team) %>% 
  summarize(num_forwards = n(),
            num_shots = sum(Shots)) %>% 
  arrange(desc(num_shots))
#Which team had the most defenders with blocks
worldcup %>% 
  filter(Position == "Defender") %>% 
  group_by(Team) %>% 
  summarize(num_defenders = n(),
            num_saves = sum(Saves)) %>% 
  arrange(desc(num_saves))
#Range of time players spent in game
arrange(worldcup, Time) %>% 
  select(Time) %>% 
  slice(1)
arrange(worldcup, desc(Time))%>% 
  select(Time) %>% 
  slice(1)
#Most time played
arrange(worldcup, desc(Time)) %>% 
  
