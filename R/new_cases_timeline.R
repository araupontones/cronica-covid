



owid_clean <- import(file.path(dir_data, "clean_owid.rds"))



fechas <- c("2020-02-01",
            "2020-04-01",
            "2020-06-01",
            "2020-08-01",
            "2020-10-01",
            "2021-02-01"
            
            )

for(fecha in fechas){
  
  owid_chart <- data_owid_chart(owid_clean, fecha = fecha)
  
  
  
  chart_linea_fecha(owid_chart,
                    y_col = casos_nuevos,
                    y_line = casos_nuevos__14,
                    fecha = fecha,
                    y_label = "Casos nuevos")
  
  exfile <- file.path(dir_charts, paste0("casos_nuevos_", fecha,".png"))
  
  ggsave(exfile,
         last_plot())
  
  
  
}





  
  





