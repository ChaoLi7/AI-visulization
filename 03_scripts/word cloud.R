#world cloud
library(wordcloud2)  
data<-read.table("clipboard",header = T,sep = "\t")
head(data)
wordcloud2(data,minRotation = -pi/4, maxRotation = -pi/4, 
           rotateRatio = 0,  color = 'random-dark',
           size = 0.3,shape = 'circle')  