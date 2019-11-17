library(tidyverse)
library(gganatogram)
organ_plot <- data.frame(organ = c("heart", "aorta", "lymph_node", "liver", "lung", "spleen"),
                         colour = c("red", "red", "green", "brown", "blue", "purple"),
                         type = c("circulation", "circulation", "immune", "digestion", "respiratory", "immune"),
                         value = c(2, 5, 1, 8 , 2, 7),
                         stringsAsFactors = F)

ga <- gganatogram(data = organ_plot, outline = T, fillOutline = "#a6bddb", 
            organism = 'mouse', sex = "male", fill = "colour") +
  ggtitle("Impact BAA (CSU, IDRI, OXFORD)",  subtitle = "Mouse ex.") +
  theme_void()
ga

