1、
###############################
#data format                  #
#CNVnumber CNVnumber          #
###############################
data1<-read.table("clipboard",header = TRUE)   #5、4
    head(data1);dim(data1)
    library(gcookbook)
    library(ggplot2)
    ggplot(data1, aes(x = ID12_1, y =ID12_1.1),width = 1)+#3geom_tile(aes(fill = fill))+
      #annotate("segment", x=0, xend=max(data$ID12_1)+0.5,y=0,yend=max(data$ID12_1.1*2)+1,linetype="dashed",size=1)+
      geom_smooth(aes(x = ID12_1, y =ID12_1.1),method='lm',se=F,linetype="dashed", col="grey",size=0.5)+
      geom_point( aes(col=fill),shape=21,size=3) +
      scale_color_manual(values = c("yellow","orange","red"))+ 
      scale_fill_manual(values=c("yellow","orange","red")) +
      scale_y_continuous(limits=c(1.5,5),breaks=seq(2,5,by=1),expand=c(0,0))+
      scale_x_continuous(limits=c(1.5,5),breaks=seq(2,5,by=1),expand=c(0,0))+
      #scale_x_continuous(limits=c(0,max(data$ID12_1)+0.5),breaks=seq(0,max(data$ID12_1)+0.5,by=0.5),expand=c(0,0))+
      theme_bw()+theme(panel.grid.minor=element_blank())+
      theme(panel.background=element_blank())+ theme(axis.text.x = element_text(colour = "black",size = 10))+
      theme(axis.text.y = element_text(colour = "black",size = 10))+
      theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+#coord_flip()+
      xlab("CNVplex Copy Number") +ylab("CNVcaller Copy Number") +
      ggtitle("Chr.3:204,129,401-204,158,600")+ # 添加图形的标题
      theme(plot.title = element_text(colour = "black", hjust=0.5),
            axis.title.x = element_text( colour = "black" ),
            axis.title.y = element_text( colour = "black", angle=90 ),
            #panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            panel.border=element_blank(), # 取消绘图区域四周的边框
            axis.line=element_line(colour="black" ,size=0.5), # 添加坐标轴（即x轴与y轴）的直线
            legend.position = c(0.1,0.75),
            legend.title = element_blank(),
            legend.text = element_text(size=8,colour="black"),
            legend.key.size = unit(0.5, "lines"),
            legend.key = element_blank(),
            legend.background = element_blank()   #去掉图例的背景
      )
2、
###############################
#data format                  #
#pos number                   #
###############################
qplot(pos, log10(number), colour=group ,data=data) + geom_line() +
  geom_point(aes(shape=label), size=2) +
  scale_x_continuous(breaks=seq(1,5,by=1),expand=c(0,0),limits=c(0.6,5.4),
                     labels = c("Human(86)","Maize(523)","Soybean(1191)","Sheep(5698)","Goat(29907)"))+
  scale_y_continuous( limits = c(0, 4), breaks=seq(0, 4, by = 1),expand = c(0,0),
                      labels = c("1","10","100","1000","10000"))+ 
  
  theme_set(theme_bw())+theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(panel.background=element_blank())+ 
  theme(axis.text.x = element_text(colour = "black",size = 10,angle = 30,hjust = 1))+
  theme(axis.text.y = element_text(colour = "black"))+scale_shape_manual(values=c(21,22,23,24,25)) +
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+
  xlab("Species (Number of unplaced scaffolds)") +ylab("Normalized processing time (Minute)") +
  #ggtitle("Individual operation time  (min/GB)")+ # 添加图形的标题
  theme(plot.title = element_text(colour = "black"),
        axis.title.x = element_text( colour = "black",size = 15),
        axis.title.y = element_text( colour = "black", angle=90,size = 15),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border=element_blank(), # 取消绘图区域四周的边框
        axis.line=element_line(colour="black",size = 0.5), # 添加坐标轴（即x轴与y轴）的直线
        legend.position = c(0.2,0.8),
        legend.title = element_blank(),
        legend.text = element_text(size=10,colour="black"),
        legend.key.size = unit(1, "lines"),
        legend.key = element_blank()
  )
3、
###############################
#data format                  #
#pos number                   #
###############################
data<-read.table("clipboard",header = TRUE)
head(data);dim(data)
library(gcookbook)
library(ggplot2)
value
ggplot(data, aes(x = pos, y = number, fill = group1),width = 1)+
  #geom_bar(stat = "identity", width = 0.1)+
  geom_bar(stat="identity", position="dodge", colour="black",width = 0.9) +  ##绘制边框
  #geom_text(label=data$number,colour = "black", vjust=00)  +
  scale_y_continuous(limits=c(0,15000),breaks=seq(0,15000,by=2500),expand=c(0,0))+
  scale_x_continuous(limits=c(0,6),breaks=seq(1,5,by=1),expand=c(0,0),
                     labels=c("soybean(1.0Gb)","maize(2.1Gb)","sheep(2.6Gb)","goat(2.9Gb)","human(3.1Gb)"))+
  scale_fill_manual(values=c("cornflowerblue","darkorange1","grey80","yellow")) +
  theme_set(theme_bw())+theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(panel.background=element_blank())+ theme(axis.text.x = element_text(colour = "black",size = 10,angle = 30,hjust = 1))+
  theme(axis.text.y = element_text(colour = "black",size = 10))+
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+#coord_flip()+
  xlab("Species (length of genome") +ylab("Max mamory (Mb)") +
  #ggtitle("Individual operation time  (min/GB)")+ # 添加图形的标题
  theme(plot.title = element_text(colour = "black"),
        axis.title.x = element_text( colour = "black",size = 15),
        axis.title.y = element_text( colour = "black", angle=90,size = 15),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border=element_blank(), # 取消绘图区域四周的边框
        axis.line=element_line(colour="black",size = 0.5), # 添加坐标轴（即x轴与y轴）的直线
        legend.position = c(0.2,0.8),
        legend.title = element_blank(),
        legend.text = element_text(size=10,colour="black"),
        legend.key.size = unit(1, "lines"),
        legend.key = element_blank()
  )
4、小提琴图 
############################################
#每一列一组数据                            #
############################################
install.packages("vioplot")
library(vioplot)
title("Violin Plots of Miles Per Gallon")
mydata<-read.table("clipboard",header = TRUE)
a<-read.table("clipboard",header = FALSE)
head(mydata)
x1<-read.table("clipboard",header = TRUE)
x2<-read.table("clipboard",header = TRUE)
x3<-read.table("clipboard",header = TRUE)
x4<-read.table("clipboard",header = TRUE)
x5<-read.table("clipboard",header = TRUE)
x6<-read.table("clipboard",header = TRUE)

x <- c(0,3)
y <- c(0,13.5)
par(mai=c(1,3,0.5,1))

plot(x, y, xlim=c(0,2.5), ylim=c(0,13.5),pch=21,col="white",xlab = "",ylab = "",yaxt="n",xaxt="n")
abline(v=1,lwd=0.0001,col="azure2",lty=2)
abline(v=2,lwd=0.0001,col="azure2",lty=2)
abline(h=0.5,lwd=0.0001,col="azure2",lty=2)
abline(h=1.5,lwd=0.0001,col="azure2",lty=2)
abline(h=2.5,lwd=0.0001,col="azure2",lty=2)
abline(h=4,lwd=0.0001,col="azure2",lty=2)
abline(h=5,lwd=0.0001,col="azure2",lty=2)
abline(h=6,lwd=0.0001,col="azure2",lty=2)
abline(h=7.5,lwd=0.0001,col="azure2",lty=2)
abline(h=8.5,lwd=0.0001,col="azure2",lty=2)
abline(h=9.5,lwd=0.0001,col="azure2",lty=2)
abline(h=11,lwd=0.0001,col="azure2",lty=2)
abline(h=12,lwd=0.0001,col="azure2",lty=2)
abline(h=13,lwd=0.0001,col="azure2",lty=2)
axis(1,las=1,labels = c("0","1","2"),at=c(0,1,2))
axis(side=2,at=c(0.5,1.5,2.5,4,5,6,7.5,8.5,9.5,11,12,13),
     labels=c("CNVcaller_Kmer.1F","CNVcaller_Kmer.2F","CNVcaller_Kmer.3F","CNVnator_Kmer.1F",
              "CNVnator_Kmer.2F","CNVnator_Kmer.3F","CNVcaller_Kmer.1M","CNVcaller_Kmer.2M",
              "CNVcaller_Kmer.3M","CNVnator_Kmer.1M","CNVnator_Kmer.2M","CNVnator_Kmer.3M"),las=1)
vioplot(x1$CNVcaller_Kmer.1F,col  ="yellow",horizontal=TRUE, at=0.5, add=TRUE,lty=1)
vioplot(x3$CNVcaller_Kmer.2F,col="yellow",horizontal=TRUE, at=1.5, add=TRUE,lty=1)  ###是否转置
vioplot(x5$CNVcaller_Kmer.3F,col ="yellow",horizontal=TRUE, at=2.5, add=TRUE,lty=1)
vioplot(x1$CNVnator_Kmer.1F,col="coral",horizontal=TRUE, at=4, add=TRUE,lty=1)
vioplot(x3$CNVnator_Kmer.2F ,col="coral",horizontal=TRUE, at=5, add=TRUE,lty=1)
vioplot(x5$CNVnator_Kmer.3F ,col="coral",horizontal=TRUE, at=6, add=TRUE,lty=1)
vioplot(x2$CNVcaller_Kmer.1M ,col="darkgreen",horizontal=TRUE, at=7.5, add=TRUE,lty=1)
vioplot(x4$CNVcaller_Kmer.2M ,col="darkgreen",horizontal=TRUE, at=8.5, add=TRUE,lty=1)
vioplot(x6$CNVcaller_Kmer.3M ,col="darkgreen",horizontal=TRUE, at=9.5, add=TRUE,lty=1)
vioplot(x2$CNVnator_Kmer.1M ,col="cornflowerblue",horizontal=TRUE, at=11, add=TRUE,lty=1)
vioplot(x4$CNVnator_Kmer.2M ,col="cornflowerblue",horizontal=TRUE, at=12, add=TRUE,lty=1)
vioplot(x6$CNVnator_Kmer.3M ,col="cornflowerblue",horizontal=TRUE, at=13, add=TRUE,lty=1)
rome.names<-c("a","b")
legend(x=10, y=-2,legend=rome.names, fill = "blue", bty = "n",xpd=T, x.intersp = 1, y.intersp =0.3,#title="dddd",
       text.width =2, trace = TRUE,ncol=4)  #####字体及位置
vioplot(a,col  ="yellow",horizontal=TRUE, add=TRUE,lty=1)

##################################################
数据集的合并和画图小提琴图
###################################################
x12<-read.table("clipboard",header = TRUE)
head(x12);dim(x12) 
data12<-as.matrix(x12)       ####转换为矩阵
dim(data12) <- c(100*66,1)    ####多列合并为一列
x22<-read.table("clipboard",header = FALSE)
dim(x22)
data22<-as.matrix(x22)
dim(data22) <- c(96*67,1)
dim(data22)
x <- c(0,200)
y <- c(0,200)
par(mai=c(1,1,0.5,1))   ####图的边界
par( mgp=c(1.2,0.3,0))
#par(bty="c", lwd=0.1)  #边界绘制
plot(x, y, xlim=c(0,10), ylim=c(0,10),pch=21,col="white",xlab = "",ylab = "")#,yaxt="n",xaxt="n")

vioplot(data12,col  ="grey",horizontal=FALSE, at=1.2, add=TRUE,lty=1,lwd = 1,wex = 3,range = 1.5,
        pchMed = 19,drawRect = TRUE)
vioplot(data22,col  ="grey",horizontal=FALSE, at=2.8, add=TRUE,lty=1)

axis(side=1,at=c(1.2,2.8), labels=c("blue","red"),las=1,tck=-0.0151)

axis(side=2,at=c(0,2,4,6,8),labels=c("0","2","4","6","8"),las=1,
     cex.axis=0.8,tck=-0.0151)
	 
5、分区图
###############
#data format
#data1 data2 data3
###############
mydata=read.table("clipboard", header=F)
colnames(mydata)=c("BodySize","Pop","Type")
mydata$Pop = factor(mydata$Pop)
mydata$Type = factor(mydata$Type)
colors <- c("green","red","orange","green","red","orange")
ggplot(mydata, aes(x = BodySize,fill = Type)) +
geom_density(alpha = 0.8) +  #透明度
facet_grid(Pop ~ .) +    #分层-图例在右面
theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(), 
panel.background = element_blank(),axis.line = element_line(colour = "black"))

6、
#####################################################
#20170507
#可以合起来画，但需要调整；如果分开画的话，最后用AI调试
#data format
#data1 data2
######################################
library(ReadImages)
library(ggplot2)
library(ellipse)
library(gridExtra)
library(plyr)
data<-read.table("clipboard",header=TRUE) 
head(data)
dim(data)  #3.8,4
threshold<-as.factor(data$x>0.395 & data$y > 0.1955 )
####画边框
scatter <- ggplot()+ scale_colour_manual(values = c("white","white"))+ 
  theme(legend.position='none')+geom_vline(xintercept = 0.395,linetype=2,col="grey")+  
  geom_hline(yintercept = 0.1955,linetype=2,col="grey")+xlab("ln ratio (π,wild/π,domestic)")+ylab("Fst")+labs(title =" ")+
  theme_bw() +theme(legend.key.size=unit(0.5,'cm'),legend.title=element_blank())+
  theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(legend.position = "none") +
  scale_x_continuous(limits=c(-2.2,3),breaks=seq(-2,2,by=1),expand=c(0,0),
                     labels = c("-2","-1","0","1","2"))+
  scale_y_continuous(limits=c(-0.04,0.84),breaks=seq(0,0.8,by=0.2),expand=c(0,0),
                     labels = c("0","0.2","0.4","0.6","0.8"))+
  theme(axis.text.x=element_text(color="black"),   #####坐标轴字体
        axis.text.y=element_text(color="black"))
#画点
threshold<-as.factor(data$x>0.395 & data$y > 0.1955 )
scatter <- ggplot()+geom_point(data=data,aes(x,y,color=threshold),size=0.1)+ scale_colour_manual(values = c("black","red"))+ 
  #geom_vline(xintercept = 0.395,linetype=2,col="grey")+  
  #geom_hline(yintercept = 0.1955,linetype=2,col="grey")+
  xlab(" ")+ylab(" ")+labs(title =" ")+
  theme_bw() +theme(legend.key.size=unit(0.5,'cm'),legend.title=element_blank())+
  theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(legend.position = "none") +
  scale_x_continuous(limits=c(-2.2,3),breaks=seq(-2,2,by=1),expand=c(0,0),
                     labels = c("-2","-1","0","1","2"))+
  scale_y_continuous(limits=c(-0.04,0.84),breaks=seq(0,0.8,by=0.2),expand=c(0,0),
                     labels = c("0","0.2","0.4","0.6","0.8"))+
  theme(axis.text.x=element_text(color="white"),   #####坐标轴字体
        axis.text.y=element_text(color="white"))+
  theme(panel.border = element_blank())  #移除边界线
  
 #上边界
 hist_top <- ggplot()+geom_histogram(aes(data$x),colour='#0E969E',fill='#0E969E',binwidth = 0.001)+
  labs(x="",y="Number of bins")+theme_classic()+
  theme(axis.text.x=element_text(color="white", size=0),
        axis.text.y=element_text(color="black"))+
  theme(
    axis.line.x = element_line(colour = "white"),
    axis.line.y = element_line(colour = "black")
  )+geom_vline(xintercept = 0.395,colour="grey",lty=2)+
  theme(axis.ticks.x = element_blank())+
  scale_y_continuous(limits=c(0,500),breaks=seq(0,500,by=100),expand=c(0,0))+
  scale_x_continuous(limits=c(-2.2,3),breaks=seq(-2,2,by=1),expand=c(0,0),
                     labels = c("-2","-1","0","1","2"))

#右边界
hist_right <- ggplot()+geom_histogram(aes(data$y),colour='#A2C31F',fill='#A2C31F',binwidth = 0.001)+
  labs(x="",y="Number of bins")+theme_classic()+theme(axis.text.x=element_text(color="black", angle = 90),
                                                      axis.text.y=element_text(color="white",size=0))+  ########去掉坐标轴的字体
  theme(
    axis.line.x = element_line(colour = "black"),
    axis.line.y = element_line(colour = "white"))+
  scale_x_continuous(limits=c(-0.04,0.84),breaks=seq(0,0.8,by=0.2),expand=c(0,0),
                     labels = c("0","0.2","0.4","0.6","0.8"))+
  scale_y_continuous(limits=c(0,2000),breaks=seq(0,2000,by=500),expand=c(0,0))+
  coord_flip()+geom_vline(xintercept = 0.1995,colour="grey",lty=2)+  
  theme(axis.ticks.y = element_blank()) 
 #补充空白图层
scale<-ggplot()+theme_classic()
par(mar = (c(3,4,2,2)+ 0.5), mgp=c(1.6,1,0))
grid.arrange(hist_top, scale, scatter, hist_right, ncol=2, nrow=2, widths=c(4,1),heights=c(1,4))

7、
########################
#data fromat
#numeric	Z	D_value	Z_score
#########################
#data2<-read.table("clipboard",header = TRUE)
ggplot(data2, aes(x = 12-data2$numeric,y=D_value,fill =Z))+
  annotate("rect", xmin=0.5,xmax=11.5,ymin=-0.0118,ymax=0.0118,alpha=0.6,fill="grey")+
  geom_bar(stat = "identity",width = 0.8,  position="dodge",aes(x = 12-numeric,y=D_value))+
  theme(legend.position = 'NA')+
  scale_fill_manual(values =values)+
  scale_y_continuous(limits=c(-0.02,0.04),breaks=seq(-0.02,0.04,by=0.02),expand=c(0,0))+
  scale_x_continuous(limits=c(0.5,11.5),breaks=seq(1,11,by=1),expand=c(0,0),
                     
                     labels=c(rev(paste(data2[,2],sep=",")))
  )+annotate("rect", xmin=0.5,xmax=11.5,ymin=-0.0118,ymax=0.0118,alpha=.1,fill="grey")+
  
  coord_flip()+
  theme_set(theme_bw())+theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(panel.background=element_blank())+ theme(axis.text.x = element_text(colour = "black"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+
  xlab("") +ylab("") +
  ggtitle("D(Muscovy duck(W), Pekin duck(X); JD(Y), Z)")+
  theme(plot.title = element_text(colour = "black",size = 8),
        axis.title.x = element_text( colour = "black"),
        axis.title.y = element_text( colour = "black", angle=90),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border=element_blank(), # 取消绘图区域四周的边框
        axis.line=element_line(colour="black"), # 添加坐标轴（即x轴与y轴）的直线
        legend.position = 'NA'
  )

8、
####################
#data format
#data1 data2
library(plotrix)
data<-read.table("clipboard",header=TRUE)
head(data)
dim(data)
xsize=max(data$x) 
ysize=max(data$y)
plot(0, 0,xlab="",ylab="",xlim=c(1,xsize+ysize),ylim=c(1,xsize+ysize))
for(i in 1:length(data$x)){ 
  draw.circle((data$y[i]+data$x[i])/2,0,(data$y[i]+data$x[i])/2) #(圆心横坐标,圆心纵坐标,半径)
  i=i+1
}

9、
###############
#data format
#labels data1 data2
###############
library(ggplot2)
#mydata<-read.table("clipboard",header=FALSE)
head(mydata)
colors<-c("#A50021","#FF33CC","#FF0066","#FF0066",
          "#FF0066","#FF7F00","#4DAF4A","#0000FF","#A65628","#0099E6",
          "#660066") #颜色按照图例的顺序给（图例扽顺序是按字母的先后顺序排列）
positions<-c("BEZ1","BEZ2","BEZ3","EUR",
             "AUS","IRI", "PAK", "BAN", "TIB",
             "CNN","CNS")
qplot(V3,V5,data=mydata[mydata[,4]=="AFR",],geom = "boxplot",
      col=V3,outlier.colour = NA,ylim = c(0,50000000))+  #outlier.colour = NA 去掉离群点
  scale_x_discrete(limits = positions)+
  labs(x=" ",y=" AFR ",title = " ") +
  scale_color_manual(values = colors)+
  theme(
    title = element_text(vjust = 0.5,size = 20, color = "black"),
    axis.title.y = element_text(vjust = 0.5, angle = 90,size =15),
    axis.title.x = element_text(hjust = 0.5, angle = 30, size = 15)) + 
  theme(axis.text.x = element_text(size=8,angle=30,color="black"))+ ##调整x轴标签的角度
  theme(axis.text.y = element_text(size=10,angle= 0,color="black"))+
  theme(legend.key.size=unit(0.5,'cm'),legend.title=element_blank())+
  theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())

10、
###########################
#data format
#data1 data2
###########################
library(gcookbook)
library(ggplot2)
values=c("BEZ1"="#FF0066","BEZ2"="#FF0066","BEZ3"="#FF0066",
         "AFR"="#C0BC00","EUR"="#0000FF","IRN"="#A65628",
         "PAK"="#0099E6","BAN"="#FF33CC","TIB"="#660066",
         "CNN"="#FF7F00","CNS"="#4DAF4A")
data1<-read.table("clipboard",header = TRUE)   #5、4
head(data1);dim(data1)
ggplot(data1, aes(x = x, y =y),width = 1)+
  geom_point( aes(col=col),shape=19,size=3 ) +
  scale_color_manual(values = values)+ 
  scale_fill_manual(values=c("darkorange1","cornflowerblue","red")) +
  annotate("segment", 
          x=min(data1$y)-max(data1$y)/6, xend=max(data1$y)+max(data1$y)/6,
          y=min(data1$y)-max(data1$y)/6,yend=max(data1$y)+max(data1$y)/6)+
  scale_y_continuous(limits=c(min(data1$y)-max(data1$y)/6,max(data1$y)+max(data1$y)/6),expand=c(0,0))+
  scale_x_continuous(limits=c(min(data1$x)-max(data1$x)/6,max(data1$x)+max(data1$x)/6),
                     expand=c(0,0))+
  theme_bw()+theme(panel.grid.minor=element_blank())+
  theme(panel.background=element_blank())+ theme(axis.text.x = element_text(colour = "black",size = 10))+
  theme(axis.text.y = element_text(colour = "black",size = 10))+
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+#coord_flip()+
  xlab("f4 (Test, BEZ1; BEZ3, Outgroup)") +ylab("f4 (Test, BEZ2; BEZ3, Outgroup)") +
  theme(plot.title = element_text(colour = "black", hjust=0.5),
        axis.title.x = element_text( colour = "black" ),
        axis.title.y = element_text( colour = "black", angle=90 ),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        #panel.border=element_blank(), # 取消绘图区域四周的边框
        axis.line=element_line(colour="black" ,size=0.5), # 添加坐标轴（即x轴与y轴）的直线
        legend.position = c(0.057,0.795),
        legend.title = element_blank(),
        legend.text = element_text(size=7,colour="black"),
        legend.key.size = unit(0.8, "lines"),
        #legend.key = element_blank(),
        #legend.background = element_blank()   #去掉图例的背景
        legend.background = element_rect(fill = 'white', colour = 'black')
  )

11、
#################
#http://ggplot2.tidyverse.org/reference/geom_path.html
#data format
#data1 data2
#################
library(scales)
library(plyr)
library(ggplot2)
library(gcookbook)
library(grid)
library(ggplot2)
library(splines)
Animals<-read.table("clipboard",header = FALSE)
head(Animals)
ggplot(Animals,aes(x=Animals[,1], y=Animals[,2])) +
geom_line(aes(x=Animals[,1], y=Animals[,2]))+ 
  geom_step()+annotation_logticks() +                             #绘制梯度
  #geom_line(aes(x=Animals[,1], y=Animals[,2]))+                  #绘制平滑曲线
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
               labels = trans_format("log10",math_format(10^.x)),
               minor_breaks = log10(1) + 0:3) +
  scale_y_log10(breaks = trans_breaks("log10",function(x) 10^x),
               labels = trans_format("log10",math_format(10^.x)),
               minor_breaks = log10(1) + 0:3) +
  coord_fixed() + theme_bw()

  
12、
##################
#外显子的起点、终点
#基因的起点、终点
#绘图的时候注意与基因的渗入区域对应上
##################
  a1<-read.table("clipboard",header = FALSE)
  head(a1);dim(a1)
  library(ggplot2)
  ggplot(a1,aes(a1[,4]))+
    geom_rect(xmin =start, xmax = end,
              ymin = -0.005, ymax = 0.005,fill = "red")+  #genes1
    geom_rect(xmin =start, xmax = end,
              ymin = -0.005, ymax = 0.005,fill = "red")+  #genes2  
    geom_rect(xmin =a1[,2], xmax = a1[,3], 
              ymin = -0.02, ymax = 0.02,fill = "black")+  #exon
    theme_bw()+ ylab(" ")+  xlab(" ")+
    scale_y_continuous(limits=c(-0.02,0.02),expand=c(0,0))+
    theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank(),
                                                  panel.border=element_blank())+
theme(axis.ticks= element_blank(), axis.text = element_blank())

##############
#参考代码（分层绘制）
##############
a1<-read.table("clipboard",header = TRUE)
head(a1);dim(a1)
library(ggplot2)
b<-rep(1:3,times=nrow(a1))[1:nrow(a1)]
a1<-cbind(a1,b)
ggplot(a1,aes(a1[,3],a1[,8]/10000+0.00002,label = rownames(a1)))+
  geom_rect(xmin =a1[,2], xmax = a1[,3]+1000, 
            ymin = a1[,8]/10000-0.00001, 
            ymax = a1[,8]/10000+0.0001,fill ="navyblue")+ 
  theme_bw()+ ylab(" ")+  xlab(" ")+
  geom_text(hjust = 0, nudge_x = 0.5)

13、
####################
#data format
#pos Fst Pi Tajima’s_D 
####################
library(ggplot2)
library(splines)
#Fst(5,2)
a<-read.table("clipboard",header=TRUE) 
head(a)
dim(a)
ggplot(a, aes(a[,10], a[,5]))+ geom_line(colour="blueviolet")+
  geom_hline(aes(yintercept = 0.082903),colour="red", linetype="dashed")+
  theme_bw()+ ylab("Fst")+  xlab(" ")+
  theme(axis.text.x=element_text(angle=0,color="black"),
        axis.text.y=element_text(angle=0,color="black"),
        title = element_text(hjust = 0.5, color = "black",face="bold.italic"),
        axis.title.y = element_text(vjust = 0, angle = 90, face = "bold"),
        axis.title.x = element_text(hjust = 0.5, angle = 0, face = "bold"))+
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank())+
  theme(axis.ticks.x = element_blank(), axis.text.x = element_blank())


#Pi
head(a)
dim(a)
ggplot(a,aes(a[,10]))+
  geom_line(aes(a[,10],a[,6]),colour="#83BE74")+
  geom_line(aes(a[,10],a[,8]),colour="#3C70AD")+
  geom_hline(aes(yintercept = 0.002302),colour="#83BE74", linetype="dashed")+
  geom_hline(aes(yintercept = 0.002351),colour="#3C70AD", linetype="dashed")+
  theme_bw()+ ylab("Pi")+  xlab(" ")+
  theme(axis.text.x=element_text(angle=0,color="black"),
        axis.text.y=element_text(angle=0,color="black"),
        title = element_text(hjust = 0.5, color = "black",face="bold.italic"),
        axis.title.y = element_text(vjust = 0, angle = 90, face = "bold"),
        axis.title.x = element_text(hjust = 0.5, angle = 0, face = "bold"))+
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank())+
  theme(axis.ticks.x = element_blank(), axis.text.x = element_blank())
  

#Tajima’s D 
head(a)
dim(a)
ggplot(a,aes(a[,10]))+
  geom_line(aes(a[,10],a[,7]),colour="#83BE74")+
  geom_line(aes(a[,10],a[,9]),colour="#3C70AD")+
  geom_hline(aes(yintercept = -0.554940),colour="#83BE74", linetype="dashed")+
  geom_hline(aes(yintercept = -0.744900),colour="#3C70AD", linetype="dashed")+
  theme_bw()+ ylab("Tajima’s D")+  xlab(" ")+
  theme(axis.text.x=element_text(angle=0,color="black"),
        axis.text.y=element_text(angle=0,color="black"),
        title = element_text(hjust = 0.5, color = "black",face="bold.italic"),
        axis.title.y = element_text(vjust = 0, angle = 90, face = "bold"),
        axis.title.x = element_text(hjust = 0.5, angle = 0, face = "bold"))+
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank())+
  #theme(axis.ticks.x = element_blank(), axis.text.x = element_blank())+
  

  scale_x_continuous(limits=c(0,500000),breaks=seq(0,500000,by=100000),expand=c(0,0),
                     labels=c("32000000","32100000","32200000","32300000","32400000","32500000"))
					 
					 
14、
####################
#data format
#labels D_stat sd x y
#结合AI修图
####################
 mydata1<-read.table("clipboard",header=TRUE)
head(mydata1)
p<-ggplot(mydata1,aes(order,D_stat),fill=mydata1$pop3)
p+geom_pointrange(aes(ymin =mydata1$D_stat-mydata1$sd,ymax=mydata1$D_stat+mydata1$sd,
                      fill=mydata1$pop3))+ 
  geom_pointrange(aes(ymin =x,ymax=y),size=1)+coord_flip() +

  scale_x_continuous(limits=c(0,22),breaks=seq(1,21,by=1),expand=c(0,0),
                     labels=c(paste(paste(mydata1$pop2,mydata1$pop3,sep="-"),sep=",")))+
  scale_y_continuous(limits=c(-0.01,0.005),breaks=seq(-0.01,0.005,by=0.005),expand=c(0,0))+
  xlab("") +ylab("") +  ggtitle("")+
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+
  theme(plot.title = element_text(colour = "black",size = 8),
        axis.title.x = element_text( colour = "black"),
        axis.title.y = element_text( colour = "black", angle=90),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border=element_blank(), # 取消绘图区域四周的边框
        axis.line=element_line(colour="black"), # 添加坐标轴（即x轴与y轴）的直线
        legend.position = 'NA'
  )

15、绘制分组的热图
library(pheatmap)  
#创建数据集test测试矩阵  
test = matrix(rnorm(200), 20, 10)  
test[1:10, seq(1, 10, 2)] = test[1:10, seq(1, 10, 2)] + 3  
test[11:20, seq(2, 10, 2)] = test[11:20, seq(2, 10, 2)] + 2  
test[15:20, seq(2, 10, 2)] = test[15:20, seq(2, 10, 2)] + 4  
colnames(test) = paste("Test", 1:10, sep = "")  
rownames(test) = paste("Gene", 1:20, sep = "")  
# 用pheatmap函数画热图  
head(test);dim(test)
pheatmap(test)  

#pheatmap还可以显示行或列的分组信息，支持多种分组；  
annotation_col = data.frame(CellType = factor(rep(c("CT1", "CT2"), 5)), Time = 1:5)  
head(annotation_col);dim(annotation_col)
rownames(annotation_col) = paste("Test", 1:10, sep = "")  

annotation_row = data.frame(GeneClass = factor(rep(c("Path1", "Path2", "Path3"), c(10, 4, 6))))  
head(annotation_row);dim(annotation_row)
rownames(annotation_row) = paste("Gene", 1:20, sep = "")  

pheatmap(test, annotation_col = annotation_col, annotation_row = annotation_row)  


附件图
##################
#data format
#pos  number
##################
library(ggplot2)
  a<-read.table("clipboard",header=FALSE) 
  head(a)
  dim(a)
  c <- ggplot(a, aes(a[,1], a[,6]))+ylim(0,4.5)
  c + geom_line(colour="black",size=0.5)+
    theme_bw()+ ylab(" ")+  xlab(" ")+
    theme(axis.ticks = element_blank())+
    theme(axis.text = element_blank(),plot.margin=unit(c(1,1,1,1),"cm"))+
    theme(panel.grid.major=element_blank())+  #去掉主要网格线
    theme(panel.grid.minor=element_blank())+   #去掉次要网格线
    geom_hline(yintercept = 0,colour="grey50",lty=1,size=0.3) +
    geom_hline(yintercept = 1.8,colour="cyan",lty=1,size=0.3) +
    geom_hline(yintercept = 2,colour="grey50",lty=1,size=0.3) +
    geom_hline(yintercept = 2.2,colour="cyan",lty=1,size=0.3) +
    geom_hline(yintercept = 4,colour="grey50",lty=1,size=0.3) 
	
#########################
#核密度图自带数据库
#########################
set.seed(123)
require(magrittr)
n <- 1000
mean_s <- c(1,7)
y <- sample(c("head", "tail"), size = n, replace = TRUE, prob = c(0.25, 0.75))
x <- rnorm(n = 100000, mean = mean_s[1],sd=5)
tails <- y %in% c("tail")
x[tails] <- rnorm(sum(tails), mean = mean_s[2])
data <- data.frame(x = x, y = y)
head(data)
max(data$x)
min(data$x)

require(lattice)
ggplot(data, aes(x = x),colors="cadetblue3") + geom_density(fill = "cadetblue3")+
  scale_x_continuous(limits = c(5,10))+
  #scale_y_continuous(limits = c(0.1,0.5))+
  theme(panel.grid.major=element_blank())+theme_bw()+
  #theme(axis.ticks = element_blank())+
  theme(#axis.text.x=element_text(face="bold",color="white",size=0), 
        axis.text.y=element_text(face="bold",color="white",size=0),
        plot.margin=unit(c(1,1,1,1),"cm"))+
  theme(panel.grid.major=element_blank())+
  theme(panel.grid.minor=element_blank())+
  theme(legend.key.size=unit(0.5,'cm'),legend.title=element_blank())+
  
  
  theme(panel.background = element_blank())+
  theme(axis.text.y = element_text(size=10,angle= 0,color="black"))+
  theme(legend.key.size=unit(0.5,'cm'),legend.title=element_blank())
  #theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())
    
##########################
附件1、曲线的拟合
##################################
library(ggplot2)
library(splines)

a<-read.table("clipboard",header=FALSE) 
head(a)
dim(a)
pdf("1500475Mrsfast.pdf",width = 4.69,height =2.74)
c <- ggplot(a, aes(a[,5], a[,3]))+ylim(0,6)


c + geom_point(colour="darkgrey") + stat_smooth(method = MASS::rlm, formula= y ~ ns(x,40),fill="blue", colour="darkblue", size=2, alpha = 0.2)+
  ylab("read depth")+
  xlab("1500475Mrsfast(bp)")+geom_rect(xmin = 70, xmax = 106, ymin = -0.1, ymax = 0,fill = "deeppink")+
  geom_rect(xmin = 244, xmax = 284, ymin = -0.1, ymax = 0,fill = "deeppink")+
  
  theme(axis.text=element_text(size=14),axis.title=element_text(size=14,face="bold"))+
  theme_bw()+
  theme(#axis.text.x=element_text(face="bold",color="blue",size=8),
    plot.margin=unit(c(1,1,1,1),"cm"))

	
	



16）箱线图（6、5）
library(ggplot2)
mydata<-read.table("clipboard",header=FALSE)
head(mydata);dim(mydata)
mydata1<-as.matrix(mydata[,c(2:6)])
head(mydata1,n=10);dim(mydata1)
dim(mydata1)<- c(12*5,1)
mege_name<-data.frame(rep(mydata$V1,length(mydata1[,1])/length(mydata$V1)))
merge_number<-data.frame(mydata1)
merge_data<-cbind(mege_name,merge_number);head(merge_data,n=10)
colors<-c("black","black","black","black",
          "black","black","black","black",
          "black","black","black","black")
#颜色按照图例的顺序给（图例扽顺序是按字母的先后顺序排列）
positions<-head(merge_data[,1],n=length(mydata[,1]))
library(ggplot2)
qplot(mege_name,mydata1,  data=merge_data,geom = "boxplot",
      col=mege_name,outlier.colour = NA,
      ylim = c(min(merge_data[,2]),25))+
  scale_x_discrete(limits = positions)+
  labs(x=" ",y=" S/P ratio ",title = " ") +
  scale_color_manual(values = colors)+ theme_bw()+theme(
    title = element_text(vjust = 0.5,size = 15, color = "black"),
    axis.title.y = element_text(vjust = 0.5, angle = 90,size =12),
    axis.title.x = element_text(hjust = 0.5, angle = 0, size = 15)) + 
  theme(axis.text.x = element_text(size=10,angle=0,color="black"))+ ##调整x轴标签的角度
  theme(axis.text.y = element_text(size=10,angle= 0,color="black"))+
  #theme(legend.key.size=unit(0.5,'cm'),legend.title=element_blank())+
  theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(legend.position='none')

  
  #16.1 参考
  library(reshape2)
library(ggplot2)
data<-read.table("clipboard",header = T)
labels<-rep(data$taxa,dim(data[-1])[2]);length(labels)
dim(data);head(data)
df.data <- reshape2::melt(data[-1], id.vars = NULL)   #把矩阵生成绘图格式
tail(df.data);dim(df.data)
data.ok<-cbind(df.data,labels)
head(data.ok)

p= ggplot(data.ok) #(8,4)
p+geom_bar(aes(x=variable,y=value,fill = labels),stat ="identity",
           width = 0.8, binwidth = NULL)+ theme_bw()+#############控制图的宽度
  
  scale_y_continuous(limits=c(0,0.7),breaks=seq(0,0.6,by=0.2),expand=c(0,0))+
  #scale_x_continuous(limits=c(0.5,6.5),breaks=1:6,expand=c(0,0),labels=c("H_0","H_4","H_7","L_0","L_4","L_7"))+
  scale_fill_manual(values=c( "antiquewhite","cadetblue", "cornflowerblue","coral",
                              "seagreen3","grey60","yellowgreen", "orange","darkgreen","red","blue")) +
  #scale_fill_manual(values=c( "grey60","yellowgreen", "orange","darkgreen","red","blue")) +
  # labels=c("IRS","Discordence with aCGH","Hunam Mendelian Error","Sheep Mendelian Error"))+
  theme_set(theme_bw())+theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(panel.background=element_blank())+ theme(axis.text.x = element_text(colour = "black"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+
  xlab(" ") +ylab("Metabolism abundence") +
  theme(legend.position = "right")+ guides(fill=guide_legend(reverse=FALSE))
  
  
  17）散点图加线性拟合（结合软件拼接）
  data<-read.table("clipboard",header = T)
head(data);dim(data)
#a1<-subset(data,data$col == c("anagen_2"))
 ggplot(data = data, aes(x = repeat_number, y = depth)) +  
  geom_point( aes(col=col),shape=19,size=1 ) +
  scale_color_manual(values = c("cornflowerblue"))+ 
  #scale_fill_manual(values=c("darkorange1","cornflowerblue","red")) +
  geom_smooth(method = "lm", se=FALSE, color="cornflowerblue",size=0.5, formula = y ~ x) +
  scale_x_continuous(limits=c(1.5,1.9),expand=c(0,0))+
  scale_y_continuous(limits=c(14,26),expand=c(0,0))+
  theme_bw()+theme(panel.grid.minor=element_blank())+ theme(panel.background=element_blank())+ 
  theme(axis.text.x = element_text(colour = "black",size = 10))+
  theme(axis.text.y = element_text(colour = "black",size = 10))+
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+#coord_flip()+
  
  xlab("repeat number (kb)") +ylab("Read depth") +
  theme(plot.title = element_text(colour = "black", hjust=0.5),
        axis.title.x = element_text( colour = "black" ),
        axis.title.y = element_text( colour = "black", angle=90 ),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        #panel.border=element_blank(), # 取消绘图区域四周的边框
        axis.line=element_line(colour="black" ,size=0.5), # 添加坐标轴（即x轴与y轴）的直线
        legend.position = c(0.85,0.2),
        legend.title = element_blank(),
        legend.text = element_text(size=7,colour="black"),
        legend.key.size = unit(0.8, "lines"),
        #legend.key = element_blank(),
        #legend.background = element_blank()   #去掉图例的背景
        legend.background = element_rect(fill = 'white', colour = 'black'),
  )+
  theme(legend.position='none')
model.lm <- lm(repeat_number ~ depth, data = data)
summary(model.lm)

l <- list(a = format(coef(model.lm)[1], digits = 4),
          b = format(abs(coef(model.lm)[2]), digits = 4),
          r2 = format(summary(model.lm)$r.squared, digits = 4),
          p = format(summary(model.lm)$coefficients[2,4], digits = 4))

eq <- substitute(italic()  ~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)

C <- p + geom_text(aes(x = max(repeat_number)/1.5, y = max(data$depth),
                       label = as.character(as.expression(eq))), parse = TRUE)
C
r2 = format(summary(model.lm)$r.squared, digits = 4);r2
p = format(summary(model.lm)$coefficients[2,4], digits = 4);p


18）circos图的绘制（数据即代码见附件）


19）栓坐标+误差线
#双坐标
############
#data format
#days	PRL	sd1	PP	sd2
1	124.56 	16.45 	6.93	1.68
2	119.31 	16.93 	7.22	1.68
3	129.74 	18.92 	6.88	1.45
4	161.95 	16.05 	7.15	1.62
5	206.77 	17.63 	7.3	1.61
6	205.96 	19.95 	7.91	1.88
7	230.60 	15.63 	7.58	1.64
############
library(ggplot2)
library(gtable)
library(grid)
grid.newpage()
a<-read.table("clipboard",header=T)
pd <- position_dodge(0.1)
p1<-ggplot(a,aes(a[,1],a[,2]))+geom_line(colour="blue")+theme_bw()+
  geom_errorbar(aes(ymin=a[,2]-sd1, ymax=a[,2]+sd1), width=.5, colour="blue")+
  geom_point(position=pd, size=2, shape=21, fill="white")+
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank())+
  scale_x_continuous(limits=c(0.5,26.5),breaks=1:26,expand=c(0,0),labels=c(1:26))+
  theme(legend.position = "top")
p2<-ggplot(a,aes(a[,1],a[,4]))+geom_line(colour="red")+theme_bw()+
  geom_errorbar(aes(ymin=a[,4]-sd2, ymax=a[,4]+sd2), width=.5,colour="red", position=pd)+  #%+replace% 
  theme(panel.background = element_rect(fill = NA))+
  geom_point(position=pd, size=2, shape=21, fill="white")+
  theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank())+
  scale_x_continuous(limits=c(0.5,26.5),breaks=1:26,expand=c(0,0),labels=c(1:26))
g1<-ggplot_gtable(ggplot_build(p1))
g2<-ggplot_gtable(ggplot_build(p2))

pp<-c(subset(g1$layout,name=="panel",se=t:r))
g<-gtable_add_grob(g1,g2$grobs[[which(g2$layout$name == "panel")]],pp$t,pp$l,pp$b,pp$l)
#4\axis tweaks
ia<-which(g2$layout$name == "axis-l")
ga<-g2$grobs[[ia]]
ax<-ga$children[[2]]
ax$widths<-rev(ax$widths)
ax$grobs <-rev(ax$grobs)
ax$grobs[[1]]$x <- ax$grobs[[1]]$x - unit(1,"npc") + unit(0.15,"cm")
g<-gtable_add_cols(g,g2$widths[g2$layout[ia,]$l],length(g$widths)-1)
g<-gtable_add_grob(g,ax,pp$t,length(g$widths)-1,pp$b)
ia<-which(g2$layout$name == "ylab")
ga<-g2$grobs[[ia]]
ga$rot<-270
g<-gtable_add_cols(g,g2$widths[g2$layout[ia, ]$l],length(g$widths)-1)
g<-gtable_add_grob(g,ga,pp$t,length(g$widths)-1,pp$b)
#draw it
grid.draw(g)  #(8,4)

20）曼哈顿plot


21) 曲线组合图
#data format

group	group1	group2	group3	group4	pos
0d	4.34 	3.99 	4.86 	4.44 	1
3d	4.37 	3.58 	4.52 	4.15 	2
7d	4.11 	3.76 	4.51 	4.05 	3
14d	4.25 	4.03 	4.69 	4.2	4
21d	4.29	3.99	4.65	4.12	5

############
library(ggplot2)
data<-read.table("clipboard",header=T)
head(data);dim(data)
cols2 <- c("#ff4d4d", "#3399ff","darkred","darkblue")
ggplot(data, aes(x = pos)) +
  geom_point(aes(y = group1, color = "Linear"), size = 1, alpha = 1, color = cols2[1]) + 
  geom_point(aes(y = group2, color = "Linear"), size = 1, alpha = 1, color = cols2[2]) + 
  geom_point(aes(y = group3, color = "Linear"), size = 1, alpha = 1, color = cols2[3]) + 
  geom_point(aes(y = group4, color = "Linear"), size = 1, alpha = 1, color = cols2[4]) + 
  stat_smooth(aes(x = pos, y = group1, linetype = "group1"), method = "lm",formula = y ~ poly(x,4), se = T, size = 0.5, color = cols2[1])+ 
  stat_smooth(aes(x = pos, y = group2, linetype = "group2"), method = "lm",formula = y ~ poly(x,4), se = F, size = 0.5, color = cols2[2])+ 
  stat_smooth(aes(x = pos, y = group3, linetype = "group3"), method = "lm",formula = y ~ poly(x,4), se = F, size = 0.5, color = cols2[3])+
  stat_smooth(aes(x = pos, y = group4, linetype = "group4"), method = "lm",formula = y ~ poly(x,4), se = F, size = 0.5, color = cols2[4])+
  
  scale_x_continuous(breaks=seq(,6,by=1),expand=c(0,0),limits=c(0,6))+
  scale_y_continuous( limits = c(3.5, 5), breaks=seq(3.5, 8, by = 0.5),expand = c(0,0))+
  theme_set(theme_bw())+theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(panel.background=element_blank())+ 
  theme(axis.text.x = element_text(colour = "black",size = 10,hjust = 1))+
  theme(axis.text.y = element_text(colour = "black"))+scale_shape_manual(values=c(21,22,23,24,25)) +
  theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+
  xlab("Species") +ylab("Normalized") +
  #ggtitle("Individual operation time  (min/GB)")+ # 添加图形的标题
  theme(plot.title = element_text(colour = "black"),
        #axis.title.x = element_text( colour = "black",size = 15),
        #axis.title.y = element_text( colour = "black", angle=90,size = 15),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border=element_blank(), # 取消绘图区域四周的边框
        axis.line=element_line(colour="black",size = 0.5), # 添加坐标轴（即x轴与y轴）的直线
        legend.position = "top",
        legend.title = element_blank(),
        legend.text = element_text(size=10,colour="black"),
        legend.key.size = unit(1, "lines"),
        legend.key = element_blank()
  )

