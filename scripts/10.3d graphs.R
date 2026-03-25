#Load and understand the dataset
data(iris)
str(iris)

#Basic 3D scatter plot 
install.packages("scatterplot3d")
library(scatterplot3d)

#Basic 3d plot
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Petal.Length
)
#Labelled 3d scatter plot
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Petal.Length,
  main="3D Scatter Plot of Iris Data",
  xlab="Sepal Length",
  ylab="Sepal Width",
  zlab="Petal Length",
  pch = 16
)

#Colored 3D Scatter Plot by Species 
colors <- as.numeric(iris$Species)
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Petal.Length,
  color=colors,
  pch=16,
  main="3D Scatter Plot by Species"
)

legend(
  "topright",
  legend = levels(iris$Species),
  col = 1:3,
  pch=16
)
#3D plot using cloud()
#Load lattice package
library(lattice)

#Basic 3d cloud plot
cloud(
  Petal.Length ~ Sepal.Length * Sepal.Width,
  data=iris
)
#Colored cloud plot
cloud(
  Petal.Length ~ Sepal.Length * Sepal.Width,
  data=iris,
  groups = Species,
  auto.key=TRUE,
  main = "3D  Cloud Plot of Iris Data"
)

#Multi-panel scatter using xyplot()
#Although xyplot is not true 3d, it allows multi-dimensional comarision
xyplot(Petal.Length ~ Sepal.Length | Species,
       data = iris,
       pch = 16,
       col = "blue",
       layout = c(3,1)
)

#Interactive 3d plot using plotly
#Install plotly
install.packages("plotly")
library(plotly)
#intercative 3d scatter
plot_ly(iris,
       x = ~Sepal.Length,
       y = ~Sepal.Width,
       z = ~Petal.Length,
       color = ~Species,
       type = "scatter3d",
       mode = "markers")

#3D plot  wth size encoding
plot_ly(iris,
        x = ~Sepal.Length,
        y = ~Sepal.Width,
        z = ~Petal.Length,
        color = ~Species,
        size = ~Petal.Width,
        type = "scatter3d",
        mode = "markers")