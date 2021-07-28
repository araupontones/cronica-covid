#load the data ---------------------------------------------------------------

owid_raw <- rio::import(file.path(dir_data, "clean_owid.rds"))
sf <- rio::import(file.path(dir_data, "world_sf.rds"))
NE_box_rob <- rio::import(file.path(dir_data, "world_bbox.rds"))



#define days ================================================================
first_day <- as.Date("2020-01-22")
last_day <- as.Date("2021-07-27")

days_study = seq(from = first_day, to = last_day, by = 'day')
(length(days_study) - 1) / 4




second_date <- first_day + 138
third_date <- first_day + (138*3)
last_date <- first_day + (138*4)



dates <- c(
  
  "2020-01-22",
  "2020-06-08",
  "2021-03-11",
  "2021-07-27"
  
  
)

        


#create maps ===================================================================
#casos
for(d in dates){
  plot_map_intro(fecha =d,
                 indicador = cases_cienmil_round,
                 tipo = "casos")
  
}

#muertes

for(d in dates){
  plot_map_intro(fecha =d,
                 indicador = deaths_cienmil_round,
                 tipo = "muertes")
  
}




 


 


