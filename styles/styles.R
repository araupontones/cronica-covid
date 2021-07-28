#styles
#https://fonts.google.com/specimen/Libre+Franklin?query=fran
#extrafont::loadfonts(dev = 'win')

color_daily_cases <- "#FFD4D3"
color_d_cases_line <- "#AA182C"
font_axis <- "Libre Franklin"
font_annotation <- "IBM Plex Mono"
color_axis <- "#B3B3B5"

#pallete casos
low_casos <- '#FEE0E0'
high_casos <- "#2C0001"

tema_libro <- ggplot2::theme(text = element_text(family = font_axis),
                    #axis ------------------------------------------------
                    axis.text.x = element_text(angle=90, hjust = 1),
                    axis.text = element_text(color = color_axis),
                    axis.title = element_text(color = color_axis, size = 14),
                    axis.title.y = element_text(margin = margin(r=20)
                    ),
                    panel.background = element_rect(fill = "white"),
                    axis.ticks = element_blank()
)


tema_mapa <- tema_libro +
  ggplot2::theme(axis.text.x = element_blank(),
        legend.position = 'none',
        plot.title = element_markdown(),
        plot.subtitle = element_markdown(color = '#525252'))
