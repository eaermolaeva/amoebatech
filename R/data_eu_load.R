# create a data_eu_load.R script inside th package

library(tidyverse)

data_eu <- 
  readr::read_csv("data-raw/data_eu.csv") %>%
  #lowercase all the columns and replace spaces with underscore
  rename_with(., ~ tolower(gsub(" ", "_", .x, fixed = TRUE))) %>%
  #uppercase species groups names (optional)
  #rename_with(., toupper, contains("_")) %>%
  #rename typos occured in the origibal dataset
  rename(phy_gri = psy_gri, pla_car = neb_car) %>%
  #order species groups alphabetically
  select(person, country, site, sample, lat, long, wtd, ph, sort(tidyselect::peek_vars()))

# export the data as an .rda file to the data/ folder

usethis::use_data(data_eu, overwrite = TRUE)
