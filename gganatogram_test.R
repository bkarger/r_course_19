library(tidyverse)
library(gganatogram)
library(gridExtra)
library(viridis)
###example dataframes
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
###example mouse and human graphs
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
###plotted 
combined_plots <- grid.arrange(human_CSU, mouse_CSU, nrow = 1) 


###Using gganatogram example data to highlight all organs with viridis magma option
gghuman <- gganatogram(data = hgMale_key, outline = T, fillOutline = "peachpuff2", 
                          organism = 'human', sex = "male", fill = "value") +
  ggtitle("Impact BAA (CSU, IDRI, OXFORD)",  subtitle = "Human ex.") +
  theme_void() +
  theme(panel.background = element_rect(fill = "black")) +
  scale_fill_viridis(option = "magma")

ggcell <- gganatogram(data=cell_key[['cell']], outline = T, fillOutline='lightgray', organism="cell",
            fill="value")  +theme_void() +  coord_fixed() +  scale_fill_viridis(option = "cividis")

gg_combined <- grid.arrange(ggcell, gghuman, nrow = 1)
 
