#'@param date A string "yyyy-mm-dd" with the date to mao
#'@return A map 

crear_mapa_casos <- function(date = "2020-01-5") {
  
  #leer shapefile
  world_sf <- import(file.path(dir_data, "world_sf.rds"))
  
  #leer datos covid de ese dia (date) ----------------------------------------
  datos_dia <- covid19(start = date,
                       end = date) %>%
    ungroup() %>%
    rename(country = administrative_area_level_1,
           iso2 = iso_alpha_2) %>%
    filter(confirmed > 0) %>%
    select(iso2, confirmed, deaths)
  
  #checar que paises de ese dia estan en el mapa ------------------------------
  check <- setdiff(unique(datos_dia$iso2), world_sf$iso2)
  if(length(check) < 1){
    
    message(glue('No estan en shapefile: {check}'))
    message("Limpiar en world sf")
    
  }
  
  
  #crear labels para mapa -------------------------------------------------
  
  casos_hasta_hoy <- prettyNum(sum(datos_dia$confirmed), big.mark = ",")
  muertes_hasta_hoy <- prettyNum(sum(datos_dia$deaths), big.mark = ",")
  date_label <-  glue('{day(date)} de {month(date, label = T, abbr = F)} del {year(date)}')
  
  
  #juntar datos covid con mapa ------------------------------------- 
  
  datos_mapa <- select(world_sf, iso2, geometry) %>%
    left_join(datos_dia, by =c("iso2")) %>%
    #crear variable status
    mutate(con_casos = case_when(confirmed >0  ~ T,
                                 is.na(confirmed) ~ F,
                                 T ~ F),
           con_muertos = case_when(deaths >0 ~ T,
                                   is.na(deaths) ~ F,
                                   T ~ F),
           status = case_when(con_casos == T & con_muertos == F ~ "Con casos",
                              con_muertos == T ~ "Con muertos",
                              T ~ "Sin casos"
           ),
           status = factor(status,
                           levels = c("Sin casos", "Con casos", "Con muertos"),
                           ordered = T)
           
           
    )
  
  
  #map ---------------------------------------------------------------
  map <- ggplot(data = datos_mapa,
                aes(fill = status,
                    color = status),
  ) +
    geom_sf(size =.5) +
    scale_fill_manual(values = c("white", color_daily_cases,  "black")) +
    scale_color_manual(values = c(color_axis, color_d_cases_line, "white"))+
    
    labs(title = glue('{date_label}'),
         subtitle = glue('Casos confirmados acomulados: {casos_hasta_hoy}<br>Muertes: {muertes_hasta_hoy}'),
         caption = "Datos de R package COVID19 | libro Quédate en Casa de Santiago Arau | 2021"
    ) +
    tema_mapa
  
  
  
  exfile <- file.path(dir_charts, paste0("mapa_", date, ".png"))
  ggsave(exfile,
         last_plot())
  
  #return(map)
  return(map)
  
  
}
