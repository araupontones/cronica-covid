
#datos enero (cmbiar a datos world in data a partir de febrero)



date = "2020-01-5"

load_functions(dir_functions)

dates <- c("2020-01-05",
           "2020-01-20",
           "2020-02-02",
           "2020-02-11",
           "2020-02-28",
           "2020-03-15",
           "2020-03-30",
           "2020-04-15",
           "2020-04-30",
           "2020-05-15",
           "2020-05-31",
           "2021-03-15",
           "2021-04-01"
           )


for(date in dates){
  
  crear_mapa_casos(date = date)
  
}






