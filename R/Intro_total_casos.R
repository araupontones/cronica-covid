owid_raw <- rio::import(file.path(dir_data, "clean_owid.rds"))


data_plot <- owid_raw %>%
  filter(!str_detect(iso_code, "OWID_")) %>%
  filter(date <="2020-03-11") %>%
  group_by(date) %>%
  summarise(total_cases = sum(total_cases, na.rm = T), .groups = 'drop') %>%
  filter(total_cases>0) %>%
  arrange(date) %>%
  mutate(rol_mean = zoo::rollmean(total_cases, 7, fill = NA))


13e4/10

75e4
2.5e5
seq(0,13e4, 13e3)


ggplot(data = data_plot,
       aes(x = date,
           y = total_cases)) +
  # geom_col(width = .5,
  #          fill = color_daily_cases) +
  geom_line(color = '#CA2628',
            size = 1.5) +
  geom_point(fill = '#CA2628',
             color = '#CA2628',
             size = 2,
             shape = 21) +
  scale_x_date(breaks = seq(as.Date("2020-01-22"), as.Date("2020-03-11"), by="12 day"),
               limits = c(as.Date("2020-01-22"), as.Date("2020-03-20")),
               date_labels = "%e de %B, %Y",
               expand = c(0,0)
  ) +
  scale_y_continuous(expand = c(0,0),
                     #breaks = c(0,15e5),
                     limits = c(0,13.2e4),
                     breaks = seq(0,12.5e4, 2.5e4),
                     labels = c(prettyNum(seq(0,75e4, 2.5e5),big.mark = ","), "1 millón", "1.25 millones")
                     #labels = seq(0,12.5e4, 2.5e4)
  )+
  annotate("rect",
           xmin = as.Date("2020-03-12"), xmax = as.Date("2020-03-20"), 
           ymin = -Inf, ymax = Inf,  fill = "white")+
  labs(x = "",
       y = "",
       title = "Total de casos confirmados en el mundo.",
       #subtitle = "Hasta el 11 de marzo del 2020.",
       caption = "Datos: OurWorldinData.org/coronavirus",
       )+
  
  theme(text = element_text(family = "Playfair Display", color = "#555555"),
        plot.title.position="plot" ,
        axis.text = element_text(size = 16),
        axis.text.x = element_text(angle = 0, hjust = 0),
        axis.ticks = element_blank(),
        panel.background = element_rect(fill = "white", color = "white"),
        plot.background = element_rect(fill = "white", color = "white"),
        panel.grid.major.y = element_line(linetype = "dotted", size = .6,color="grey80"),
        plot.title = element_text(size = 32, margin = margin(t = 15)),
        plot.subtitle = element_text(size = 24),
        plot.caption = element_text(size = 12, margin = margin(b =10, t = 10), hjust = .95)
        
  )

exfile <- file.path(dir_charts_intro, "casos confirmados.png")

ggsave(exfile, 
       last_plot(),
       width = 12,
       height = 9,
       dpi = 360
       )
