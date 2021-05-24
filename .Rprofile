message('Cronicas Covid')

Sys.setlocale("LC_ALL", "Spanish")
options("scipen"=100, "digits"=4)


library(glue)
library(COVID19)
library(ggplot2)
library(clock)
library(lubridate)
library(zoo) #roll mean
library(extrafont)
library(ggtext)
library(ggrepel)
library(rio)
library(sf)
library(dplyr)


dir_charts <- "charts"
dir_data <- "data"
dir_functions <- "functions"
dir_styles <- "styles"


load_functions <- function(dir){
  
  functions<- list.files(dir, pattern = ".R", full.names = T)
  
  for(x in functions){
    
    source(x, encoding = 'utf-8')
    
    
  }
}

load_functions(dir_functions)
load_functions(dir_styles)

#load fonts
#font_import(paths = "C:/Users/andre/AppData/Local/Microsoft/Windows/Fonts")

#loadfonts(device = 'win')



