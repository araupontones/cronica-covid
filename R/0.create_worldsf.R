
library("rnaturalearth")
library("rnaturalearthdata")
library(sf)
library(ggplot2)
library(dplyr)



#save world in a data set to use as reference in a function
world <- ne_countries(scale = "medium", returnclass = "sf")




world_sf <- world %>%
  st_transform('ESRI:54030') %>%
  rename(country = admin,
         iso2 = iso_a2,
         iso_code = iso_a3) %>%
   select(country, 
          iso_code,
          iso2,
          geometry)
  #filter(!country %in% c("Antarctica", "Greenland"))

rio::export(world_sf, file.path(dir_data, "world_sf.rds"))


#world bbox----------------------------------------------------------------------
load(url("https://github.com/valentinitnelav/RandomScripts/blob/master/NaturalEarth.RData?raw=true"))
PROJ <- "+proj=robin +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs" 
# or use the short form "+proj=robin"
NE_box_rob  <- spTransform(NE_box, CRSobj = PROJ)



rio::export(NE_box_rob, file.path(dir_data, "world_bbox.rds"))



#example to map
 ggplot(world_sf)+
   geom_sf(color = "white", fill = low_casos) +
   geom_polygon(data=NE_box_rob, aes(x=long, y=lat), colour="gray", fill="transparent", size = 0.25) +
   #coord_sf(crs = 'ESRI:54030') 

     theme_void()
   
