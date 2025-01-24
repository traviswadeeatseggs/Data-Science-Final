library(ggplot2)
library(dplyr)
library(sf)
library(ggspatial)
library(ggmap)
library(leaflet)

df2<-read.csv("C:/Users/Travis/Downloads/dfq1.csv")

df2$elapsed_time<-signif(df2$elapsed_time, digits=2)

theme_set(theme_bw())

p2=ggplot(df2, aes(x = mag, y = count, fill = earthquakes_last_30_days)) + 
  geom_bar(stat = "identity", width = 0.5, color = "black") + 
  scale_fill_viridis_c(option = "D") +  
  labs(title = "Los Angeles Earthquakes", 
       subtitle = "Earthquake Strength's correlation to frequency", 
       caption = "source: kaggle") + 
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6))

p2

#p3, which is trying to show earthquake length, would not show how I wated it to, but I got the info I needed.
df2 <- df2|> filter(elapsed_time < 900000)
df2 <- df2|> filter(elapsed_time > 800000)

p3=ggplot(df2, aes(x = elapsed_time, y = mag, fill = earthquakes_last_30_days)) + 
  geom_bar(stat = "identity", width = 100, color = "black") + 
  scale_fill_viridis_c(option = "D") +  
  labs(title = "Ordered Bar Chart", 
       subtitle = "Make Vs Avg. Mileage", 
       caption = "source: mpg") + 
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6))

p3
