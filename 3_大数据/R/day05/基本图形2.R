#一、条形图
install.packages("vcd")
library(grid)
library(vcd)
counts <- table(Arthritis$Improved)#table 函数对应的就是统计学中的列联表，是一种记录频数的方法.

head(Arthritis)#查看数据集
data(Arthritis)
str(Arthritis)

# 简单条形图
barplot(counts, 
        main="Simple Bar Plot",
        xlab="Improvement", ylab="Frequency")
# 水平条形图   
barplot(counts, 
        main="Horizontal Bar Plot", 
        xlab="Frequency", ylab="Improvement", 
        horiz=TRUE)

#若类别型变量是因子，等同于如下的代码

plot(Arthritis$Improved, main="Simple Bar Plot",
     xlab="Improved", ylab="Frequency")
plot(Arthritis$Improved, horiz=TRUE, main="Horizontal Bar Plot",
     xlab="Frequency", ylab="Improved")

#堆砌条形图和分组条形图
library(vcd)
counts <- table(Arthritis$Improved, Arthritis$Treatment)

# 堆砌条形图
barplot(counts, 
        main="Stacked Bar Plot",
        xlab="Treatment", ylab="Frequency", 
        col=c("red", "yellow","green"),            
        legend=rownames(counts)) 

# 分组条形图                       
barplot(counts, 
        main="Grouped Bar Plot", 
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"),
        legend=rownames(counts), beside=TRUE)

#均值条形图
states <- data.frame(state.region, state.x77)
head(state.x77)
head(states)

means <- aggregate(states$Illiteracy, by=list(state.region), FUN=mean)
means

means <- means[order(means$x),]  
means

barplot(means$x)

barplot(means$x, names.arg=means$Group.1) 
title("Mean Illiteracy Rate")  

#微调的垂直直方图
opar <- par(no.readonly=TRUE)
par(mar=c(5,8,4,2))
par(las=2)
library(vcd)
counts <- table(Arthritis$Improved)

barplot(counts,
        main="Treatment Outcome",
         cex.names=0.8,
        names.arg=c("No Improvement", "Some Improvement",
                    "Marked Improvement"))
par(opar)
#棘状图
library(vcd)
attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main="Spinogram Example")
detach(Arthritis)

#二、饼图
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2)) #一个图版显示2行,2列                            
slices <- c(10, 12,4, 16, 8) 
lbls <- c("US", "UK", "Australia", "Germany", "France")

pie(slices, labels = lbls, 
    main="Simple Pie Chart")

pct <- round(slices/sum(slices)*100)  

lbls <- paste(lbls, pct) #字符串连接函数paste
lbls <- paste(lbls,"%",sep="")

pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart with Percentages")

#install.packages("plotrix")

library(plotrix)                                               
pie3D(slices, labels=lbls,explode=0.1,
      main="3D Pie Chart ") #表示两块扇形图是结合在一起
#pie3D(slices, labels=lbls,
 #     main="3D Pie Chart ")

mytable <- table(state.region)#统计频次                                 
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls, 
    main="Pie Chart from a dataframe\n (with sample sizes)")

par(opar)

#扇形图
library(plotrix)
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slices, labels = lbls, main="Fan Plot")