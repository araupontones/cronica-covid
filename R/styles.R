#styles
#https://fonts.google.com/specimen/Libre+Franklin?query=fran


color_daily_cases <- "#FFD4D3"
color_d_cases_line <- "#AA182C"
font_axis <- "Libre Franklin"
font_annotation <- "Libre Franklin Light"
color_axis <- "#B3B3B5"


tema_libro <- theme(text = element_text(family = font_axis),
                    #axis ------------------------------------------------
                    axis.text.x = element_text(angle=90, hjust = 1),
                    axis.text = element_text(color = color_axis),
                    axis.title = element_text(color = color_axis, size = 14),
                    axis.title.y = element_text(margin = margin(r=20)
                    ),
                    panel.background = element_rect(fill = "white"),
                    axis.ticks = element_blank()
)


