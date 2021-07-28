# clean owid data

owid_raw <- import( "data/owid-covid-data.csv" )
#https://github.com/owid/covid-19-data/tree/master/public/data



owid_clean <- owid_raw %>% select(iso_code,
                                  continent,
                                  country = location, 
                                  date, 
                                  #casos
                                  total_cases,
                                  total_cases_per_million,
                                  new_cases,
                                  new_cases_smoothed,
                                  #muertes
                                  total_deaths,
                                  total_deaths_per_million,
                                  new_deaths,
                                  new_deaths_smoothed,
                                  #vacunas
                                  people_vaccinated,
                                  people_fully_vaccinated,
                                  population,
                                  total_vaccinations_per_hundred,
                                  #hospital
                                  hosp_patients,
                                  hosp_patients_per_million
) %>%
  mutate(date = ymd(date),
         total_cases_per_cienmil = total_cases_per_million / 10,
         cases_million_round = round(total_cases_per_million, 2),
         cases_cienmil_round = round(total_cases_per_cienmil, 2),
         
         total_deaths_per_cienmil = total_deaths_per_million / 10,
         deaths_cienmil_round = round(total_deaths_per_cienmil,2),
         #mutate for maps------------------------------------------
         #doing this to allow trend in map
         cases_cienmil_round = case_when(cases_cienmil_round < .02 ~ NA_real_,
                                         cases_cienmil_round > 2000 ~ 2000,
                                                T ~ cases_cienmil_round
                                         ),
         deaths_cienmil_round = case_when(deaths_cienmil_round < .02 ~ NA_real_,
                                          deaths_cienmil_round >= 150 ~ 150,
                                         T ~ deaths_cienmil_round
         )
) 

# owid_clean %>%
#   janitor::tabyl(country)


export(owid_clean, file.path(dir_data, "clean_owid.rds"))

#check that names match --------------------------------------------------
#sf <- rio::import(file.path(dir_data, "world_sf.rds"))






