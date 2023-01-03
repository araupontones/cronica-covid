#load the data ---------------------------------------------------------------

owid_raw <- rio::import(file.path(dir_data, "clean_owid.rds"))
sf <- rio::import(file.path(dir_data, "world_sf.rds"))
NE_box_rob <- rio::import(file.path(dir_data, "world_bbox.rds"))

names(owid_raw)


#define days ================================================================
first_day <- as.Date("2020-01-22")
last_day <- as.Date("2020-03-11")

days_study = seq(from = first_day, to = last_day, by = 'day')
(length(days_study) - 1) / 4

length(days_study)


second_date <- first_day + 12.25
third_date <- first_day + (12.25*3)
last_date <- first_day + (138*4)

second_date
third_date


dates <- c(
  
  "2020-01-22",
  "2020-02-03",
  "2020-02-27",
  "2020-03-11"
  
  
)

        


plot_map_intro(fecha ="2020-03-11",
               indicador = total_deaths,
               tipo = "muertes")

#create maps ===================================================================
#casos
for(d in dates){
  plot_map_intro(fecha =d,
                 indicador = total_cases,
                 tipo = "casos")
  
}

#muertes

for(d in dates){
  plot_map_intro(fecha =d,
                 indicador = total_deaths,
                 tipo = "muertes")
  
}




 


 


