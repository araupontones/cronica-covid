gmr <- "https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv"

MX_mob <-Global_Mobility_Report %>%
  filter(country_region == "Mexico",
         sub_region_1 == "Mexico City") %>%
  rename(transit = `transit_stations_percent_change_from_baseline`,
         retail = "retail_and_recreation_percent_change_from_baseline",
         grocery = "grocery_and_pharmacy_percent_change_from_baseline",
         residence = residential_percent_change_from_baseline) %>%
  mutate(transit_7 = rollmean(transit, 15, NA),
         residence_7 = rollmean(residence,30,NA))


names(MX_mob)

ggplot(data = MX_mob,
       aes(x = date,
           y = residence))+
  geom_col(width = .4) +
  geom_line(aes(y = residence_7),
            size = 1
            )+
  geom_smooth()
geom_hline(yintercept = 0,
           color = "red")
  
  tema


str(MX_mob)

unique(MX_mob$sub_region_1)
