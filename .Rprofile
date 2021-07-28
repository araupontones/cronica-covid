cli::cli_alert_info("Cronicas Covid. Santiago Arau")

suppressMessages({
  
  Sys.setlocale("LC_ALL", "Spanish")
  options("scipen"=100, "digits"=4)
  
})



#define libraries
libraries <- c(
  
  #covid
  "COVID19",
  
  #vis
  "ggplot2", "extrafont",
  
  #time
  "clock", "lubridate","ggtext", "ggrepel",
  
  #analysis
  "zoo", 
  
  #map
  "sf",
  
  #cleaning
  
  "janitor","stringr",
  #other
  
  "glue", "rio", "dplyr", "gmdacr"
)



#define directories -----------------------------------------
dir_charts <- "charts"
  dir_charts_intro <- file.path(dir_charts, "intro")
dir_data <- "data"
dir_functions <- "functions"
dir_styles <- "styles"



#============================================================================
#check if packages are installed
gmdacr::check.installed(libraries)


#load packages
suppressWarnings({
  options(defaultPackages=c(getOption("defaultPackages"),
                            
                            libraries
  )
  )
})




gmdacr::load_functions(dir_functions)
gmdacr::load_functions(dir_styles)

#load fonts
#font_import(paths = "C:/Users/andre/AppData/Local/Microsoft/Windows/Fonts")

#loadfonts(device = 'win')



