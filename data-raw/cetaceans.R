library(tidyverse)
library(lubridate)

cetaceans_raw <- read_csv("data-raw/allCetaceanData.csv")

cetaceans <- cetaceans_raw %>%
  mutate(
    status_date = if_else(is.na(statusDate), ymd("2017-05-17"), statusDate),
    age = year(status_date) - birthYear,
    event = if_else(status %in% c("Died", "Escaped (Found Dead)", "Miscarriage", "Stillbirth"), 1, 0)
  ) %>%
  filter(!is.na(age), !is.na(event)) %>%
  filter(age > 0) %>%
  mutate(
    birth_decade = floor(birthYear / 10) * 10,
    born_in_captivity = if_else(acquisition %in% c("Born", "Miscarriage", "Stillborn"), TRUE, FALSE),
    time_in_captivity = (year(status_date) - year(originDate)) / age,
    origin_location = case_when(str_detect(originLocation, "Unknown") ~ "Unknown",
                                str_detect(originLocation, "Gulf of Mexico") ~ "Gulf of Mexico",
                                str_detect(originLocation, "Atlantic Ocean") ~ "Atlantic Ocean",
                                str_detect(originLocation, "Pacific Ocean") ~ "Pacific Ocean",
                                str_detect(originLocation, "SeaWorld") ~ "SeaWorld",
                                TRUE ~ as.character(originLocation)),
    transfers = str_count(transfers, " to "),
    transfers = if_else(is.na(transfers), 0L, transfers),
    current_location = if_else(str_detect(currently, "SeaWorld"), "SeaWorld", currently)
  ) %>%
  select(
    age, event,
    species,
    sex,
    birth_decade,
    born_in_captivity,
    time_in_captivity,
    origin_location,
    transfers,
    current_location
  )

usethis::use_data(cetaceans, overwrite = TRUE)
