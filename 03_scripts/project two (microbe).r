1、unique-gene
 ###########test(6,5)
  library(plotrix)
  data<-read.table("clipboard",header = TRUE)
  x <- data[data$number<3000,]   #fanwei-number
  max(x)
  
  h <- hist(x, breaks = 23) #zhuzi-number
  head(h)
  x1 <- h$mids       #tongji-number
  y1 <- h$counts       
  x2 <- seq(min(x), max(x), by = 0.01)
  x2 <- x1
  y2 <- h$density
  
  twoord.plot(lx = x1, ly = y1, rx = x2, ry = y2, type=c('bar','l'), lcol = 'steelblue', rcol = 'red', 
              ylab = 'Frequence', rylab = 'Density', main = '5-L UniqGene Length Distribution',xlab = 'ORF Length (bp)',
              halfwidth=50,axislab.cex = 0.6, mar=c(5,4,4,4),
              lylim = c(0,max(y1)), rylim = c(0,max(y2)),xlim=c(0,3000))
			  
2、基因差异数目箱线图
  x1<-read.table("clipboard",header = TRUE)     #####按照剪切板分别兑取不同行数的数据
  x2<-read.table("clipboard",header = TRUE)
  x <- c(0,3)
  y <- c(0,400000)
  par(mai=c(1,1,1,1)) #(bowteen,left,top,right)
  plot(x, y, xlim=c(0,2), ylim=c(0,400000),pch=21,col="white",xlab = "",ylab = "Number of genes(M)",yaxt="n",xaxt="n",
       mgp=c(2,0.5,0) ) #坐标轴到标线的距离，必要时用AI
  library(vioplot)
  vioplot(x1$number,col  ="deepskyblue",horizontal=FALSE, at=0.5, add=TRUE,lty=1,lwd = 1,#wex = 3,range = 1.5,
          pchMed = 19,drawRect = TRUE)
  vioplot(x2$number,col  ="brown2",horizontal=FALSE, at=1.5, add=TRUE,lty=1,lwd = 1,#wex = 2,range = 10,
          pchMed = 19,drawRect = TRUE)
  axis(side=2,las=1,labels = c("0","0.2","0.4"),at=c(0,200000,400000),las=1,lwd.ticks = 0.5)    ####坐标轴刻度及位置，las=1字体方向
  axis(side=1,at=c(0.5,1.5),labels=c("H","L"))
  
3、#veen图
  
  #读入数据
  data1<-read.table("clipboard",header = TRUE)
  data2<-read.table("clipboard",header = TRUE)
  data3<-read.table("clipboard",header = TRUE)
  data4<-read.table("clipboard",header = TRUE)
  data5<-read.table("clipboard",header = TRUE)
  data6<-read.table("clipboard",header = TRUE)
  data7<-read.table("clipboard",header = TRUE)
  data8<-read.table("clipboard",header = TRUE)
  data9<-read.table("clipboard",header = TRUE)
  #将数据转化为向量
  data0_1<-data1$X0_1;data0_2<-data2$X0_2;data0_3<-data3$X0_3;
  data4_1<-data4$X4_1;data4_2<-data5$X4_2;data4_3<-data6$X4_3;
  data7_1<-data7$X7_1;data7_2<-data8$X7_2;data7_3<-data9$X7_3;
  #将数据合并为三大组
  data0_12<-union(data0_1,data0_2);length(data0_12)
  data00<-union(data0_12,data0_3);length(data00)
  data4_12<-union(data4_1,data4_2);length(data4_12)
  data44<-union(data0_12,data4_3);length(data44)
  data7_12<-union(data7_1,data7_2);length(data7_12)
  data77<-union(data7_12,data7_3);length(data77)
  #分别计算各个部分
  only_0<-setdiff(data00,data44)
  only_00<-length(setdiff(only_0,data77))
  only_4<-setdiff(data44,data00)
  only_44<-length(setdiff(only_4,data77))
  only_7<-setdiff(data77,data44)
  only_77<-length(setdiff(only_7,data00))
  
  only_0_4<- intersect(data00,data44)
  only_00_44<-length(setdiff(only_0_4,data77))
  only_0_7<- intersect(data00,data77)
  only_00_77<-length(setdiff(only_0_7,data44))
  only_4_7<- intersect(data44,data77)
  only_44_77<-length(setdiff(only_4_7,data00))
  
  only_0_4_7<-intersect(data00,data44)
  only_00_44_77<-length(intersect(only_0_4_7,data77))
  ###绘图
  library(devtools)
  library(Vennerable)
  vignette("Venn") 
  
  a<-Venn(SetNames=c("data00","data44","data77"),
          Weight=c(`100`=only_00,`010`=only_44,`110`=only_00_44,`001`=only_77,`101`=only_00_77,`011`=only_44_77,`111`=only_00_44_77))
  plot(a, doWeights = TRUE)  #doWeights = TRUE大小不一样 ；doWeights = FALSE大小不一样
  
  #回肠-h
  library(devtools)
  library(Vennerable)
  vignette("Venn") 
  a<-Venn(SetNames=c("H_0g","4g","7g"),Weight=c(`100`=65786,`010`=328,`110`=9238,`001`=13811,`101`=1452,`011`=244,`111`=4144))
  plot(a, doWeights = FALSE)  
  
  
  #veen图
  library(VennDiagram)
  draw.quintuple.venn(
  area1 = 301,area2 = 321,area3 = 311,area4 = 321,area5 = 301,n12 = 188, n13 = 191, n14 = 184,n15 = 177,
  n23 = 194,n24 = 197,n25 = 190,n34 = 190,n35 = 173,n45 = 186,n123 = 112, n124 = 108, n125 = 108, n134 = 111,
  n135 = 104, n145 = 104, n234 = 111, n235 = 107, n245 = 110, n345 = 100, n1234 = 61, n1235 = 60, n1245 = 59,
  n1345 = 58, n2345 = 57, n12345 = 31,category = c("A", "B", "C", "D", "E"),
  fill = c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
  cat.col = c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
  cat.cex = 2,margin = 0.05,
  cex = c(1.5, 1.5, 1.5, 1.5, 1.5, 1, 0.8, 1, 0.8, 1, 0.8, 1, 0.8, 1, 0.8,
          1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 1, 1, 1, 1, 1.5),
  ind = TRUE
)

##################################################################################veen图five-pie
#测试数据
A <- sample(1:1000, 400, replace = FALSE);
B <- sample(1:1000, 600, replace = FALSE);
C <- sample(1:1000, 350, replace = FALSE);
D <- sample(1:1000, 550, replace = FALSE);
E <- sample(1:1000, 375, replace = FALSE);

#读入数据
data1<-read.table("clipboard",header = FALSE)
data2<-read.table("clipboard",header = FALSE)
data3<-read.table("clipboard",header = FALSE)
data4<-read.table("clipboard",header = FALSE)
data5<-read.table("clipboard",header = FALSE)
A = data1$V1;B = data2$V1;C = data3$V1;D = data4$V1;E = data5$V1;
#安装软件
install.packages("VennDiagram")
library(VennDiagram)
#绘图
venn.plot <- venn.diagram(
  x = list(
    A = A,
    B = B,
    C = C,
    D = D,
    E = E
  ),
  filename = "Venn_5set_pretty.tiff",
  col = "black",
  fill = c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
  alpha = 0.50,
  cex = c(1.5, 1.5, 1.5, 1.5, 1.5, 1, 0.8, 1, 0.8, 1, 0.8, 1, 0.8,
          1, 0.8, 1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 1, 1, 1, 1, 1.5),
  cat.col = c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
  cat.cex = 1.5,
  cat.fontface = "bold",
  margin = 0.05
);
#######################################################################################################

  4、样本丰度柱状图（6、5）
   
  data<-read.table("clipboard",header = TRUE)
  head(data);dim(data)
  library(ggplot2)
  par(mai=c(1,1,0.5,1)) 
  par( mgp=c(1.2,0.3,0))
  p= ggplot(data)
  
  p+geom_bar(aes(x=pos,y=percentages,fill = labels),stat ="identity",
             width = 0.8, binwidth = NULL)+ theme_bw()+#############控制图的宽度
    
    #scale_y_continuous(limits=c(0,1),breaks=0:1,expand=c(0,0))+
    scale_x_continuous(limits=c(0.5,6.5),breaks=1:6,expand=c(0,0),labels=c("H_0","H_4","H_7","L_0","L_4","L_7"))+
    scale_fill_manual(values=c(
       "grey80","antiquewhite","cadetblue", "bisque4","brown",
                               "blue", "cyan3","darkgoldenrod1",
                               "chartreuse4", "brown2")) +
    # labels=c("IRS","Discordence with aCGH","Hunam Mendelian Error","Sheep Mendelian Error"))+
    theme_set(theme_bw())+theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
    theme(panel.background=element_blank())+ theme(axis.text.x = element_text(colour = "black"))+
    theme(axis.text.y = element_text(colour = "black"))+
    theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+
    xlab(" ") +ylab("Percentage of base changes(%)") +
    theme(legend.position = "right")+ guides(fill=guide_legend(reverse=TRUE))+
    #theme(legend.title=element_blank())+
    theme(plot.title = element_text(colour = "black", hjust=0.5),
          axis.title.x = element_text( colour = "black" ),
          axis.title.y = element_text( colour = "black", angle=90 ),
          #panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border=element_blank(), # 取消绘图区域四周的边框
          axis.line=element_line(colour="black" ,size=0.5), # 添加坐标轴（即x轴与y轴）的直线
          #legend.position = c(0.1,0.75),
          legend.title = element_blank(),
          legend.text = element_text(size=10,colour="black"),
          legend.key.size = unit(0.6, "lines"),
          legend.key = element_blank(),
          legend.background = element_blank()   #去掉图例的背景
    )
	
###2
#http://blog.sciencenet.cn/blog-3406804-1166733.html
library(ggplot2)
data<-read.table("clipboard",header = T)
barplot(as.matrix(100 * data), col = c('blue', 'orange', 'green', 'yellow', 'red', 
                                       'hotpink', 'cyan','purple', 'burlywood1', 'skyblue',
                                       'hotpink', 'cyan','purple', 'burlywood1', 'skyblue',
                                       'gray'),
        legend = rownames(data), 
        cex.axis = 2, cex.names = 2, ylim = c(0, 100), las = 1, width = 0.5, space = 0.5, beside = FALSE,
        args.legend = list(x = 'right', bty = 'n', inset = -0.18, cex = 0.2, y.intersp = 1.2, x.intersp = 0.7, text.width = 0.1))
mtext('Relative Abundance(%)', cex = 2, side = 2, line = 4)	
	
############################
#  p+geom_bar(aes(x=pos,y=percentages1,fill = labels1),stat ="identity",
#          width = 0.8, binwidth = NULL)+theme_bw()+#############控制图的宽度
#   scale_y_continuous(limits=c(0.98,1),breaks=seq(0.98,1,by=0.02),expand=c(0,0))
# 
#   scale_y_continuous(limits=c(0,0.021),breaks=seq(0,0.02,by=0.005),
#                      labels=c("0.98","0.985","0","","1"),expand=c(0,0))
############################
  5、功能注释
  data<-read.table("clipboard",header = TRUE)
  head(data);dim(data)
  library(gcookbook)
  library(ggplot2)
  value=c(""="",)
  p= ggplot(data)
  
  p+geom_bar(aes(x=43-order,y=number,fill = group),stat ="identity",
             width = 0.8, binwidth = NULL)+ theme_bw()+#############控制图的宽度
      scale_y_continuous(limits=c(0,0.02),breaks=seq(0,0.02,by=0.005),expand=c(0,0))+
    #labels = c("1","10","100","1000","1000"))+
    scale_x_continuous(limits=c(0,42),breaks=seq(4,40,by=6),expand=c(0,0),
                       labels=c("Phosphorus Metabolism","Metabolism of Aromatic Compounds",
                                "Iron acquisition and metabolism","Nitrogen Metabolism",
                                "Metabolite damage and its repair or mitigation","Nucleosides and Nucleotides",
								"Protein Metabolism"))+
    scale_fill_manual(values=c("burlywood","coral","brown1","deepskyblue","blue","green")) +
    coord_flip()+
    # labels=c("IRS","Discordence with aCGH","Hunam Mendelian Error","Sheep Mendelian Error"))+
    theme_set(theme_bw())+theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
    theme(panel.background=element_blank())+ theme(axis.text.x = element_text(colour = "black",size = 10))+
    theme(axis.text.y = element_text(colour = "black",size = 10))+
    theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+#coord_flip()+
    xlab(" ") +ylab("Ratio of reads") +#ggtitle("Memory  fooprint for multiple samples ")+
    #ggtitle("Individual operation time  (min/GB)")+ # 添加图形的标题
    theme(plot.title = element_text(colour = "black"),
          axis.title.x = element_text( colour = "black",size = 10),
          axis.title.y = element_text( colour = "black", angle=90,size = 0),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border=element_blank(), # 取消绘图区域四周的边框
          axis.line=element_line(colour="black",size = 0.5), # 添加坐标轴（即x轴与y轴）的直线
          #legend.position = "bottom",
          legend.title = element_blank(),
          legend.text = element_text(size=10,colour="black"),
          legend.key.size = unit(1, "lines"),
          legend.key = element_blank()
    )

  
 