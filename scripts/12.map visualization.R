#Install the required packages
install.packages("maps")
install.packages("mapdata")
install.packages("mapproj")
#Load the libraries
library(maps)
library(mapdata)
library(mapproj)
#Basic world Map(Base R)
map("world")
#Map with Title and colors
map("world",
    col = "lightblue",
    fill = TRUE,
    bg = "white",
    main = "World Map Visualization")
#Map of a Specific country(Ex: India)
map("world",
    regions = "India",
    fill = TRUE,
    col = "green",
    main = "Map of India")
#Map with points (Locations)
#Example: Major cities in India
map("world", fill = TRUE, col = "lightgray")
points(
  x = c(77.2090,72.8777,80.2707),
  y = c(28.6139,19.0760,13.0827),
  col = "red",
  pch = 19
)
#Cities plotted
#city coordinates
#Delhi  (77.2090, 28.6139)
#Mumbai (72.8777,19.0760)
#Chennai (80.2707,13.0827)
#Labeling Locations
map("world", fill = TRUE, col="lightyellow")
points(77.2090,28.6139,pch=19,col="red")
text(
  77.2090,
  28.6139,
  labels = "Delhi",
  pos = 4
)