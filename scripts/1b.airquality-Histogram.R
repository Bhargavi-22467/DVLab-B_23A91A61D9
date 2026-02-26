# Load the built-in airquality dataset
airquality
# Check the class/type of the dataset
class(airquality)
hist(airquality$Temp)
View(airquality)

# Create a customized histogram using base R
hist(airquality$Temp,
     breaks = 5,
     main = "Basic Histogram of Air Quality",
     xlab = "Temperature",
     ylab = "Range",
     labels = TRUE,
     col = "lightblue",
     border = "darkblue"
)

# Load ggplot2 library for advanced visualization
library(ggplot2)

# Create histogram using ggplot2
ggplot(
  airquality,
  aes(x = Temp)
) +
  geom_histogram(
    bins = 12,
    fill = "lightblue",
    col = "darkblue"
  ) +
  facet_wrap(~ Month) +
  labs(
    title = "Monthly Temperature Distribution",
    x = "Temperature",
    y = "Frequency"
  ) +
  
  # Apply light theme to the plot
  theme_light()