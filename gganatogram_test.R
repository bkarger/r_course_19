library(tidyverse)

organ_plot <- data.frame(organ = c("heart", "leukocyte", "liver", "lung", "spleen"),
                         colour = c("red", "green", "red", "blue", "green"),
                         type = c("circulation", "immune", "circulation", "respiratory", "immune"),
                         value = c(2, 5, 1, 8 , 2),
                         stringsAsFactors = F)
head(organ_plot)
gganatogram(data = mmMale_key, outline = T, fillOutline = "#a6bddb", 
            organism = 'mouse', sex = "male", fill = "colour")

