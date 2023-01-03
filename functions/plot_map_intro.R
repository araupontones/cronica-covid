#'creates maps for the intro of the book
#'@param fecha date to filter the date
#'@param indicador indicador to map
#'@param tipo c("casos", "muertes) to set parameters for each (color, limits, breaks)



plot_map_intro <- function(fecha,
                           indicador,
                           tipo = c("casos", "muertes"),
                           ...){
  
  font <- "Playfair Display"
  rojo <- '#CA2628'
  
    #"IBM Plex Mono"
  #'#F8100C'
  
  #define parameters of date =====
  fecha_date <- as.Date(fecha)
  date_label <-  glue('{day(fecha_date)} de {month(fecha_date, label = T, abbr = F)}, {year(fecha_date)}')
  png_name <- glue("{tipo}_{fecha}.png")
  
  #define parameters of map
  if(tipo == "casos"){
    
    color_on <- rojo
    
    # limites <- c(0.0, 2000)
    # breaks <- seq(0,2000, 500)
    # labels <- c(prettyNum(seq(0,1500,500), big.mark = ","), "+2,000")
    
    
  } else {
    #parameters of muertes
    # color_low <- '#8B8B8B'
    # color_high <- '#000000'
    color_on <- '#000000'
    
    # limites <- c(0.0, 150)
    # breaks <- seq(0,150, 25)
    # labels <- c(prettyNum(seq(0,125,25), big.mark = ","), "+150")
    
    
  }
  
  
  #indicators of defined date
  owid_date <- owid_raw %>%
    select(date, iso_code, country,{{indicador}}) %>%
    #drop aggregated locations (contients and world)
    filter(!str_detect(iso_code, "OWID_")) %>%
    filter(date == fecha_date) 
  
  
  #join with map
  owid_map <- sf %>%
    left_join(owid_date, by = "iso_code") %>%
    mutate(turn_on = case_when(!is.na({{indicador}}) ~ "ON",
                               T ~ "OFF")
           )
  
  
  #map
  plot <- ggplot(owid_map)+
    geom_sf(aes(fill = turn_on),
            color = "grey80") +
    geom_polygon(data=NE_box_rob, aes(x=long, y=lat), colour="grey80", fill="transparent", size = .5) +
    scale_fill_manual(values = c("#F5F4EF", color_on)) +
    
    # scale_fill_gradient(low = color_low, high = color_high, limits = limites, 
    #                     na.value = "#F5F4EF", name = "", 
    #                     breaks = breaks,
    #                     labels = labels
    
    #labels = c(prettyNum(seq(0,8500,2500), big.mark = ","), "+10,000")
    
    labs(title = date_label,
         caption = "Datos: OurWorldinData.org/coronavirus") +
    theme_void() +
    theme(legend.position = 'botomm',
          legend.key.width = unit(4, 'cm'),
          legend.text = element_text(family = , hjust = .5, size = 14),
          plot.title = element_text(family = font, hjust = .5, size = 28, margin = margin(b = -12)),
          plot.caption =  element_text(family = font, size = 14, hjust = .85,margin = margin(t = 0)),
          plot.background = element_rect(fill ="white", color = "white"),
          
    )
  
  #"IBM Plex Mono"
  
  exfile <- file.path(dir_charts_intro, png_name)
  
  
  ggsave(exfile,
         plot,
         height = 16,
         width = 16,
         dpi = 360)
  
  
  cli::cli_alert_info(date_label)
  
  return(plot)
  
}
