
# Final Project 


movies <- read.csv("class_data/netflix_titles.csv")
library(tidyverse)
library(RColorBrewer)

#Show amount of movies vs tv shows

movies %>%
  group_by(type) %>%
  summarise(count = n())

#Turn date_added into date object

movies$date_added <- mdy(movies$date_added)


#Turn rating into factor object

movies$rating <- factor(movies$rating,
                        levels = c("TV-Y", "TV-Y7", "TV-G", "TVPG", "TV-14", "TV-MA","G", "PG", "PG-13", "R"))

#Answering 1st question:
#What time of the year are the most movies/TV shows released?

ggplot(movies)+
  geom_histogram(aes(x = release_year, fill = rating))+
  scale_fill_brewer("Ratings", palette = "Spectral")+
  labs(x = "Year")+
  ggtitle("Amount of Films released each year")

