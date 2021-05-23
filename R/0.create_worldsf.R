
library("rnaturalearth")
library("rnaturalearthdata")

#save world in a data set to use as reference in a function
world <- ne_countries(scale = "medium", returnclass = "sf")
world_sf <- world %>%
  st_transform(3395) %>%
  rename(country = admin,
         iso2 = iso_a2) %>%
  filter(!country %in% c("Antarctica", "Greenland"))

export(world_sf, file.path(dir_data, "world_sf.rds"))
