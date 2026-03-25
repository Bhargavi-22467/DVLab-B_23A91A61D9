#Load and Understand the HairEyeColor dataset
#Load the dataset
data(HairEyeColor)
#Check Structure
str(HairEyeColor)
View(HairEyeColor)
?HairEyeColor

#Very basic Mosaic plot(Base R)
mosaicplot(HairEyeColor)

#add Titles and colors
mosaicplot(HairEyeColor, main="Mosaic Plot:Hair,Eye Color and Sex",
           color=TRUE)

#Two-variable mosaic plot
HairEye2D <- margin.table(HairEyeColor,c(1,2))
mosaicplot(HairEye2D, main="Hair vs Eye Color Mosaic Plot",
           color=TRUE)

#Mosaic plots by sex
par(mfrow=c(1,2))
mosaicplot(HairEyeColor[,,"Male"],main="Male",color=TRUE)
mosaicplot(HairEyeColor[,,"Female"],main="Female",color=TRUE)
par(mfrow=c(1,1))

#Custom colors
mosaicplot(HairEye2D,col=c("brown","black","red","yellow"),
           main="Hair vas Eye Color(Custom Colors)")

#Advanced Mosaic plot using 'vcd'
install.packages("vcd")
library(vcd)
mosaic(HairEyeColor,shade=TRUE,legend=TRUE,
       main="Shaded Mosaic Plot(vcd)")

#Convert dataset into data frame(for ggplot)
hair_eye_df <- as.data.frame(HairEyeColor)
head(hair_eye_df)

#ggplot Alternative (Proportional mosiac-style plot)
library(ggplot2)
ggplot(hair_eye_df,aes(x=Hair,y=Freq,fill=Eye))+
  geom_bar(stat="identity",position="fill")+
  facet_wrap(~Sex)+
  labs(
    title="Proportional Distribution of Eye color by Hair",
    y="Proportion"
  )+
  theme_minimal()

#Advanced mosaic with Residual shading
mosaic(~Hair+Eye+Sex, data=hair_eye_df,shade=TRUE,legend=TRUE)