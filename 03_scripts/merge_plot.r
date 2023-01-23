setwd("")
library(ggplot2)
library("readxl")
library(ggpubr)
library(GenomicFeatures)
library(ggbio)
library(grid)

#phenotype
data <- read_excel("table.xlsx", sheet = "phenotype");head(data)
pdf("phenotype.pdf", width = 8, height = 4) #paper="a4"
grid.newpage()
pushViewport(viewport(layout = grid.layout(2,3)))
vplayout<-function(x,y)
  viewport(layout.pos.row = x,layout.pos.col = y)

plot1 <- ggscatter(data, x = "phenotype1", y = "phenotype2", add = "reg.line",conf.int = TRUE, size = 1,
                   cor.coef = TRUE) 
plot2 <- ggscatter(data, x = "phenotype1", y = "phenotype3", add = "reg.line",conf.int = TRUE, size = 1,
                   cor.coef = TRUE) 
plot3 <- ggscatter(data, x = "phenotype1", y = "phenotype4", add = "reg.line",conf.int = TRUE, size = 1,
                   cor.coef = TRUE) 
plot4 <- ggscatter(data, x = "phenotype1", y = "phenotype5", add = "reg.line",conf.int = TRUE, size = 1,
                   cor.coef = TRUE) 
plot5 <- ggscatter(data, x = "phenotype1", y = "phenotype6", add = "reg.line",conf.int = TRUE, size = 1,
                   cor.coef = TRUE) 
plot6 <- ggscatter(data, x = "phenotype1", y = "phenotype7", add = "reg.line",conf.int = TRUE, size = 1,
                   cor.coef = TRUE) 

print(plot1,vp=vplayout(1,1))
print(plot2,vp=vplayout(1,2))
print(plot3,vp=vplayout(1,3))
print(plot4,vp=vplayout(2,1))
print(plot5,vp=vplayout(2,2))
print(plot6,vp=vplayout(2,3))

dev.off()