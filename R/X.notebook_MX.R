#quick check of Mexico
#import data -----------------------------------------------------------
# mx_raw <- covid19(country= "Mexico",
#                   level = 1,
#                   start = "2020-01-01",
#                   end = Sys.Date())





#crear indicadores clave --------------------------------------------------------
# mx_clean <- mx_raw %>%
#   mutate(daily_cases = confirmed -lag(confirmed,1),
#          casos_14 = rollmean(daily_cases, 14, NA)
#   )

view(mx_clean)

max_day <- mx_clean %>%
  filter(daily_deaths == max(daily_deaths, na.rm = T))

max(mx_clean$daily_deaths)
