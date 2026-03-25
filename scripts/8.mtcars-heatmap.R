#Load and understand the "mtcars" dataset
#Load dataset
data(mtcars)
#Inspect structure
str(mtcars)
#View first few rows
head(mtcars)
#Basic heat map(Base R)
heatmap(as.matrix(mtcars),Colv=NA,Rowv=NA)
#Improved heatmap with labels
heatmap(as.matrix(mtcars), main="Heatmap of mtcars dataset",
        Colv=NA,Rowv=NA)
#Heat map with custom colors
colors <- colorRampPalette(c("blue","yellow","red"))(50)
heatmap(as.matrix(mtcars),col=colors, main="Custom color Heatmap",
        Colv=NA,Rowv=NA)

#Correlation heatmap
corr_matrix <- cor(mtcars)
heatmap(corr_matrix,col=colorRampPalette(c("blue","yellow","red"))(50),
        main="Correlation Heatmap of mtcars",
        Colv=NA,Rowv=NA)

#GGplot2 heatmap
library(reshape2)
mtcars$Car<-rownames(mtcars)
mtcars_long <- melt(mtcars,id.vars="Car")
View(mtcars_long)
library(ggplot2)
ggplot(mtcars_long,aes(x=variable,y=Car,fill=value))+
  geom_tile()

#Styled ggplot heatmap
ggplot(mtcars_long,aes(x=variable,y=Car,fill=value))+
  geom_tile()+
  scale_fill_gradient(low="white",high="red")+
  theme_minimal()+
  labs(title="Heatmap of mtcars dataset")

#Another way
ggplot(mtcars_long,aes(x=variable,y=Car,fill=value))+
  geom_tile()+
  scale_fill_viridis_c()+
  theme_minimal()

#Correlation in Hearmap with ggplot2
corr_matrix <- cor(mtcars[,sapply(mtcars,is.numeric)])
corr_long <- melt(corr_matrix)
ggplot(corr_long,aes(x=Var1,y=Var2,fill=value))+
  geom_tile()+
  scale_fill_gradient2(low = "blue", mid="white",high="red",midpoint=0)+
  theme_minimal()+
  labs(title="Correlation Heatmap of mtcars")

#Heatmap with values displayed
ggplot(corr_long,aes(x=Var1,y=Var2,fill=value))+
  geom_tile()+
  geom_text(aes(label=round(value,2)))+
  scale_fill_gradient2(low = "blue", mid="white",high="red",midpoint=0)+
  theme_minimal()

#Advanced Heatmap using 'pheatmap
install.packages("pheatmap")
library(pheatmap)
pheatmap(cor(mtcars[,sapply(mtcars,is.numeric)]),
         display_numbers=round(corr_matrix,2),
         main="Advanced Correlation Heatmap",
         )