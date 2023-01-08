#install packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("GenomicFeatures")
BiocManager::install("ggbio")
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")
install.packages("ggpubr")
#run
library(ggplot2)
library(GenomicFeatures)
library(ggbio)
library(grid)
library("ggplot2")
library("readxl")
library("CMplot")
library(ggpubr)

for (chr in number_chr) {
  for (pos_start in number1_start) { 
    for (pos_end in number2_end) {
      ##plot snp and indel
      setwd("path")
      data_snp_indel <- read.csv(file = 'gwas.snp.indel.csv', sep = '\t',header = F)
      data<-data_snp_indel[which((data_snp_indel$V1 == chr) & 
                                   (data_snp_indel$V2 >= pos_start) & (data_snp_indel$V2 <= pos_end)), ]
      head(data)
      plot_gwas_snp_indel <- ggplot(data, aes(x = V2, y =-log10(V3), color = V4),width = 1)+
        geom_point( shape=19,size=2) +
        geom_hline(yintercept = 9, colour = "red") +
        scale_color_manual(values = c('red', 'black'), limits = c('MISS', 'NO')) +  #自定义点的颜色
        theme_bw()+
        theme(panel.grid.minor=element_blank())+
        theme(panel.background=element_blank())+ 
        theme(axis.text.x = element_text(colour = "black",size = 10))+
        theme(axis.text.y = element_text(colour = "black",size = 10))+
        theme(plot.margin=unit(c(1,1,1.5,1.5), "lines"),axis.ticks.margin=unit(0.25,"lines"))+#coord_flip()+
        ylab("SNP -Log10(P)") +
        theme(
          panel.grid.minor = element_blank(),
          legend.title = element_blank(),
          legend.text = element_text(size=8,colour="black"),
          legend.key.size = unit(0.5, "lines"),
          legend.key = element_blank(),
          legend.position = "none"
        )
      ##plot gene
      txdb<-makeTxDbFromGFF(file = "path/ref.gff", format = "gff3")
      plot_gwas_gene <- autoplot(txdb,
                                 which=GRanges(chr, IRanges(pos_start, pos_end)),label.color = "black",
                                 names.expr = "gene_id",fill="blue")+
        ylab('Gene') + xlab('bp')+ 
        theme(panel.background = element_rect(fill= "white", colour = "white"),
              axis.line.y.left = element_line(color = 'black'), 
              axis.line.x.bottom = element_line(color = 'black'))+
        theme_bw()
    }
  }
}

#Linear Alignment
tracks(plot_gwas_snp_indel, plot_gwas_gene)