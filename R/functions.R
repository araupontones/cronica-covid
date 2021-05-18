
#function to get value in data based on date
get_val <- function(data, x, y, fecha){
  
  
  data %>%
    ungroup()%>%
    dplyr::filter(date == fecha) %>%
    ungroup() %>%
    select({{y}}) %>%
    pull(1)
  
  
  
}



#to annotate events
annotate_evento <- function(data, x,y,fecha,label, hjust = 0, vjust = 1.5, ...){
  
  annotate(geom = 'text',
           x = as.Date(fecha),
           y = get_val(data = data, x = x, fecha = fecha, y = y),
           label = label,
           hjust= hjust,
           vjust = vjust,
           color = '#313131',
           family = "Libre Franklin Light",
           angle = 90)
}
# geom_segment(y = mx_clean$casos_14[mx_clean$date == "2021-01-25"],
#              yend =15000,
#              x = as.Date("2021-03-25"),
#              xend = as.Date("2021-03-25"),
#              color = color_axis
# )

}