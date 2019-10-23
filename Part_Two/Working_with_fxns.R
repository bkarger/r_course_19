library(stringr)
library(stringi)
library(readr)
library(purrr)
library(dplyr)
paste0(str_sub("ling", start = 4, end = 4), str_sub("ling", start = 1, end = 3))

move_letter <- function(string){
  new_word <-paste0(str_sub(string, start = 4, end = 4), 
                    str_sub(string, start = 1, end = 3))
  return(new_word)
}

words <- read_csv("words.txt", col_names = "word_s")

check_words <- c('ling', 'scat', 'soil')

(check_words %in% words$word_s)

is_word <- function(string, df){
  lgl_vector_if_true_word <- (string %in% df)
  return(lgl_vector_if_true_word)
}

is_word(check_words, words$word_s)
