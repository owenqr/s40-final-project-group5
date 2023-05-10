
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


#Answering 1st question:
#What time of the year are the most movies/TV shows released?

ggplot(movies)+
  geom_histogram(aes(x = release_year, fill = rating))+
  scale_fill_brewer("Ratings", palette = "Spectral")+
  labs(x = "Year")+
  ggtitle("Amount of Films released each year")

#Turn rating into factor object
movies$tv_rating <- factor(movies$rating,
                           levels = c("TV-Y","TV-Y7", "TV-G", "TV-PG", "TV-14", "TV-MA"))

movies$movie_rating <- factor(movies$rating,
                              levels = c("G", "PG", "PG-13","R"))

#Creating pie charts to show distribution of ratings
tv_chart <- table(movies$tv_rating)
pie(tv_chart)

movie_chart <- table(movies$movie_rating)
pie(movie_chart)

