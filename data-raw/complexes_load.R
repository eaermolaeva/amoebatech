library(tidyverse)

complexes <- 
  readr::read_csv("data-raw/complexes.csv") %>%
  mutate(code = str_to_lower(code)) %>%
  
  # delete synonimys species which are already present in the table
  filter(species != "sphenoderia_lenta/fissirostris") %>%
  filter(species != "euglypha_ciliata/compressa") %>%
  
  # when synonyms are given with "/", add each of species, and delete the "/" version
  
  add_case(species = "difflugia_oviformis", code = "dif.lab", scale = "complex") %>%
  add_case(species = "difflugia_labiosa", code = "dif.lab", scale = "complex") %>%
  filter(species != "difflugia_oviformis/labiosa") %>%
  
  add_case(species = "difflugia_gassowski", code = "dif.obl", scale = "complex") %>%
  add_case(species = "difflugia_longicollis", code = "dif.obl", scale = "complex") %>%
  filter(species != "difflugia_gassowski/longicollis") %>%
  
  #order by code
  
  arrange(code)

usethis::use_data(complexes, overwrite = TRUE)  

