
#linea del tiempo Casos confirmados MX


#import data -----------------------------------------------------------
mx_raw <- covid19(country= "Mexico",
                  level = 1,
                  start = "2020-01-01",
                  end = Sys.Date())





#crear indicadores clave --------------------------------------------------------
mx_clean <- mx_raw %>%
  mutate(daily_cases = confirmed -lag(confirmed,1),
         casos_14 = rollmean(daily_cases, 14, NA)
  )




#crear grafica -----------------------------------------------------------------
ggplot(mx_clean,
       aes(x = date,
           y = casos_14)
)+
  #barras casos diarios ---------------------------------------------------
  geom_col(aes(y= daily_cases),
           width = .7,
           fill = color_daily_cases,
  )+
  #linea incidencia acumulada ------------------------------------------------
  geom_line(aes(y = casos_14),
            color = color_d_cases_line,
            size = 1
  )+
  
  #Label de eje y -------------------------------------------------------------
  annotate(geom = 'text',
           x = min(mx_clean$date),
           y = 25000,
           label = "Casos",
           hjust =.5,
           vjust = .4,
           color = color_axis,
           family = "Libre Franklin Light"
          
  )+
  
  #Jornada Sana distancia --------------------------------------------------------
  annotate_evento(data = mx_clean, 
                  x = date, 
                  y= "casos_14",
                  fecha = "2020-03-23",
                  label = "Jornada Sana Distancia",
                  hjust = -.4,
                  vjust = 0)+
 
  geom_segment(y = get_val(data = mx_clean, x = date, fecha = "2020-03-23", y = "casos_14"),
               yend = 3000,
               x = as.Date("2020-03-23"),
               xend = as.Date("2020-03-23"),
               color = color_axis
               )+
  #Semaforo rojo cdmx -----------------------------------------------------------
  annotate_evento(data = mx_clean, 
                  x = date, 
                  y= "casos_14",
                  fecha = "2020-11-08",
                  label = "Semáforo rojo en cdmx",
                  hjust = -.4,
                  vjust = 0)+
  geom_segment(y = get_val(data = mx_clean, x = date, fecha = "2020-11-08", y = "casos_14"),
               yend = 9000,
               x = as.Date("2020-11-08"),
               xend = as.Date("2020-11-08"),
               color = color_axis
  )+
  
  #AMlLO ------------------------------------------------------------------------
  annotate_evento(data = mx_clean, 
                  x = date, 
                  y= "casos_14",
                  fecha = "2021-01-25",
                  label = "AMLO da positivo"
                  )+
  
  #scale axis -------------------------------------------------------------------
  scale_x_date(date_labels = "%b.",
               date_breaks = "1 month") +
  scale_y_continuous(labels = function(x){prettyNum(x, ",")},
                     breaks = seq(0,70000, 5000),
                     expand = c(0,0)
  ) +
  #labs ----------------------------------------------------------------------
  labs(y = "Incidencía Acumulada 14 días",
       x = "",
       caption = "Datos de covid19.analytics | libro Crónica COVID Santiago Arau | 2021"
       )+
  #tema --------------------------------------------------------------------
  tema_libro


exfile <- file.path(dir_charts, "linea_temp_casos_MX.png")

ggsave(exfile,
       last_plot())  
