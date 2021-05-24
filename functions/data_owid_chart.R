#crear datos de owid para chart
#'@param db A tibble with the clean data of owid (import clean_owid.rds)
#'@param fecha A tiblle with the date in which the cut will be implemented


data_owid_chart <- function(db,
                            fecha){
  
  db %>%
    group_by(date) %>%
    summarise(casos_nuevos = sum(new_cases, na.rm = T), .groups = 'drop',
              confirmed = sum(total_cases, na.rm = T),
              deaths = sum(total_deaths, na.rm = T)) %>%
    mutate(casos_nuevos__14 = rollmean(casos_nuevos, 14, NA),
           #variable to identify color
           until = date >= fecha)
  
}
