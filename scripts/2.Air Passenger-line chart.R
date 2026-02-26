#Week 2a
AirPassengers

#Verify the data set
class(AirPassengers)

#Covert the data set into dataframe
ap_df <- data.frame(
  year = time(AirPassengers),
  passengers = as.numeric(AirPassengers)
)
ap_df

ap_df_months <- data.frame(
  year = floor(time(AirPassengers)),
  month = cycle(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)

ap_df_months
plot(AirPassengers)

plot(AirPassengers,
     type = 'l',
     lwd = 2,
     main = "Air Passengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col  = "darkblue")

points(AirPassengers,
       type = 'o',
       pch = 17,
       col = 'pink')
grid()

library(ggplot2)
ggplot(
  ap_df,
  aes(x=year,y=passengers)
)+
  geom_line(col = "darkblue", linewidth=1)+
  labs(
    title= "Air Passengers Trend Analysis",
    caption = "Using Air Passengers data",
    subtitle = "From 1949-1960",
    x = "Months",
    y = "No.of Passengers"
  )+
  geom_point(
    alpha = 1,
    colour = "pink"
  )+
  geom_smooth(se=FALSE,colour="green")
  theme_minimal()