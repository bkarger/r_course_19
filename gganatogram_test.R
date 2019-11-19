library(tidyverse)
library(gganatogram)
library(gridExtra)
mouse_organ <- data.frame(organ = c("heart", "aorta", "lymph_node", "liver", "lung", "spleen"),
                         colour = c("green", "green", "gold", "green", "gold", "green"),
                         type = c("circulation", "circulation", "immune", 
                                  "digestion", "respiratory", "immune"),
                         value = c(2, 5, 1, 8 , 2, 7),
                         stringsAsFactors = F)
human_organ <- data.frame(organ = c("heart", "aorta", "lymph_node", "liver", "lung", "spleen"),
                         colour = c("green", "green", "gold", "green", "gold", "green"),
                         type = c("circulation", "circulation", "immune", 
                                  "digestion", "respiratory", "immune"),
                         value = c(2, 5, 1, 8 , 2, 7),
                         stringsAsFactors = F)

mouse_CSU <- gganatogram(data = mouse_organ, outline = T, fillOutline = "peachpuff2", 
            organism = 'mouse', sex = "male", fill = "colour") +
  ggtitle("Impact BAA (CSU, IDRI, OXFORD)",  subtitle = "Mouse ex.") +
  theme_void()+
  theme(panel.background = element_rect(fill = "black"))

human_CSU <- gganatogram(data = human_organ, outline = T, fillOutline = "peachpuff2", 
                         organism = 'human', sex = "male", fill = "colour") +
  ggtitle("Impact BAA (CSU, IDRI, OXFORD)",  subtitle = "Human ex.") +
  theme_void() +
  theme(panel.background = element_rect(fill = "black"))


combined_plots <- grid.arrange(human_CSU, mouse_CSU, nrow = 1) 
  