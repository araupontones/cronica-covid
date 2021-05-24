# clean owid data

owid_raw <- import( "data/owid-covid-data.csv" )


owid_clean <- owid_raw %>% select(iso_code,
                                  continent,
                                  location, 
                                  date, 
                                  total_cases,
                                  new_cases,
                                  new_cases_smoothed,
                                  total_deaths,
                                  new_deaths,
                                  new_deaths_smoothed,
                                  people_vaccinated,
                                  people_fully_vaccinated,
                                  population
) %>%
  mutate(date = ymd(date))

export(owid_clean, file.path(dir_data, "clean_owid.rds"))
