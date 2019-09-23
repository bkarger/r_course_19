library(dplyr)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(faraway)
library(dlnm)
data("chicagoNMMAPS")
data("worldcup")

worldcup <- worldcup %>%
  tibble::rownames_to_column(var = "Player")
head(worldcup, 2)

top_player <- worldcup %>% 
  top_n(n = 1, wt = Shots)

worldcup %>% 
  mutate(top_4 = Team %in% c("Spain", "Germany", "Netherlands", "Uraguay")) %>%
  ggplot(aes(x = Time, y = Shots, color = top_4)) +
  theme_tufte() +
  labs(x = "Time (seconds)", y = "The Number of shots by each player", 
       color = "Team's Final\nRank") +
  geom_point(size = 0.8, alpha = 0.8) +
  geom_vline(xintercept = 270, linetype = 2) +
  geom_text(data = top_player, label = "Best Player")
