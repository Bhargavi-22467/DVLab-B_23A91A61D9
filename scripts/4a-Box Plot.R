#Load the data
data(iris)

#Understand the data
str(iris)
View(iris)
class(iris)
?iris

#Basic box plot
boxplot(iris$Sepal.Length)
#Add title and labels
boxplot(iris$Sepal.Length,
        main = "Box Plot for Sepal Length",
        ylab = "Sepal_Length",
        col = 'skyblue')

#Grouped Box Plot (by species)
boxplot(Sepal.Length~Species,
        data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = c('pink','green','skyblue'))

#Multi-Variable Box
boxplot(iris$Sepal.Length,
        main = "Box Plot for Sepal Length",
        ylab = "sepal_Length",
        col = "skyblue")

boxplot(iris[,1:4],
        main = "Multi Variable Box Plot",
        col = c('pink','green','skyblue','orange'))

#Using Custom color palette
species_colors <- c("setosa"="red",
                    "versicolor"="steelblue",
                    "virginica"="green")
boxplot(Sepal.Length~Species,
        data = iris,
        col = species_colors,
        main = "Sepal Length by Species(Custom Color Palette")

#GG Plot2
library(ggplot2)
ggplot(iris,
       aes(x=Species,y=Sepal.Length))+
  geom_boxplot()

#Colored box plot by species
ggplot(iris,
       aes(x=Species,y=Sepal.Length))+
  geom_boxplot()+
  theme_minimal()

#Using Manual Color Palette
ggplot(iris,
       aes(x=Species,y=Sepal.Length,fill=Species))+
  geom_boxplot()+
  scale_fill_manual(
    values=c("setosa"="red",
             "versicolor"='steelblue',
             "virginica"='green'))+
  theme_bw()