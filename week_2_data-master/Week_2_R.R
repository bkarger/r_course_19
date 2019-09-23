library(readr)
library(dplyr)
library(readxl)
library(haven)


shipwreck_url <- paste0("[https://github.com/geanders],
                        [/RProgrammingForResearch/blob],
                        [/master/data/AWOIS_Wrecks_KnownYear.tab]")

shipwrecks <- read_tsv("AWOIS_Wrecks_KnownYear.tab")
                         
ebola <- read_csv("week_2_data-master/country_timeseries.csv")
icd_10 <- read_excel("week_2_data-master/icd-10.xls")
icu_sas <- read_sas("week_2_data-master/icu.sas7bdat")
ld_gen <- read_tsv("week_2_data-master/ld_genetics.txt")

ca_measles <- read_tsv("week_2_data-master/measles_data/02-09-2015.txt", col_names = c("city", "count"))
