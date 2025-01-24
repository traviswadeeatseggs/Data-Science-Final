library(ggplot2)
library(dplyr)
library(sf)
library(ggspatial)
library(ggmap)
library(leaflet)

df<-read.csv("C:/Users/Travis/Downloads/LosAngeles_Earthquake_Dataset.csv")
glimpse(df)
df<- janitor::clean_names(df)
glimpse(df)
leaflet() %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap)

color_pal <- colorNumeric(palette = "Reds", domain = c(0, 5))


p1<-leaflet() %>% 
  addProviderTiles(providers$CartoDB.Positron) %>%
  setView(lng = -120.199735, lat = 34.906543, zoom = 5) %>% 
  addCircles(data = df, lng = ~longitude, lat = ~latitude, color = ~color_pal(mag),
             radius = 100, opacity = .7, fillOpacity = 1)
p1