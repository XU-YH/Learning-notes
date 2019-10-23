#一、使用图形
attach(mtcars)
plot(wt,mpg)
#lm函数能够做线性拟合，lm(a~b)就是对a=k*b+c进行线性拟合
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)


#将pdf()夹在开启设备和关闭设备的语句之间
dev.new()
plot(mtcars$wt,mtcars$mpg)
pdf("mygraph.pdf")
dev.off(4)


#二、一个简单的例子
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

plot(dose, drugA, type="b")

#三、图形参数
 #改变表示的图形
 #方法（一）
 #par(lty=2)#含有一个当前参数设置的列表

opar <- par(no.readonly=TRUE)#建立一个修改当前参数的列表
par(lty=2, pch=17)
#par(lty=2)
#par(pch=17)
plot(dose, drugA, type="b")
par(opar)
 
 #方法二 在高级绘图函数当中进行修改
#plot(dose, drugA, type="b", lty=2, pch=17)

plot(dose, drugA, type="b", lty=3, lwd=3, pch=15, cex=2)



 #3.1符号和线条

pch_type=0:25
x <- 1:26
y <- rep(6,26)

plot(x,y,col=1:26,pch=pch_type,cex=2)

#text(x,y,col=1:10,pos=4,labels=paste("pch=",pch_type))
text(x,y,col=1:26,pos=4,labels=pch_type,srt=90)

x <- 1:10
y <- 1:10
ltytype <- 1:6

plot(x,y,col= 1:10,pch=16,type = "n")


abline(h=3:8,lty=ltytype,col=3:8)

text(3:8,3:8,labels = ltytype)

 #type设置图形中数据的显示类型，常见的有：
 #type="p " 在图形中数据显示为点；
 #type="l " 在图形中数据显示为线；
 #type="b" 在图形中数据显示为点和连接线；
 #type="o" 在图形中数据点覆盖在线上；
 #type="h" 在图形中数据显示为从点到x轴的垂直线；
 #type="s" 在图形中数据显示为阶梯图；
 #type="n"在图形中数据不显示；

 #3.2颜色
 
 colors()#返回所有可用颜色的名称

 #连续型颜色函数
n <- 7
mycolors <- rainbow(n)

pie(rep(1, n), labels=mycolors, col=mycolors) 

mygrays <- gray(0:n/n)
pie(rep(1, n), labels=mygrays, col=mygrays)

 #par(font.lab=3,cex.lab=1.5,font.main=4,cex.main=2)
 
 #3.3文本属性

 #3.4 图形尺寸和边界尺寸
rm(dose)
rm(drugA)
rm(drugB)
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

 #例：使用图形参数控制图形外观
opar <- par(no.readonly=TRUE)

par(pin=c(2, 3))#生成2英寸宽，3英寸高的图形
par(lwd=2, cex=1.5) #线条宽度和符号大小
par(cex.axis=.75, font.axis=3)#坐标轴文字为斜体，大小为0.75

plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
par(opar)



 #四、添加文本、自定义坐标轴和图例
  #引入  lty线条类型 pch 符号  lwb 线条宽度 b同时绘制点和线
plot(dose, drugA, type="b",
     col="red", lty=2, pch=2, lwd=2,
     main="Clinical Trials for Drug A",
     sub="This is hypothetical data",
     xlab="Dosage", ylab="Drug Response",
     xlim=c(0, 60), ylim=c(0, 70))

 #4.1标题
 #title()函数使用参看后面综合示例
 #4.2坐标轴
x <- c(1:10)
y <- x
z <- 10/x

opar <- par(no.readonly=TRUE)
par(mar=c(5, 4, 4, 8) + 0.1)


plot(x, y, type="b",
     pch=21, col="red",
     yaxt="n", lty=3, ann=FALSE)#ann=FALSE移除默认标签 #yaxt="n"禁用y轴
lines(x, z, type="b", pch=22, col="blue", lty=2)

axis(2, at=x, labels=x, col.axis="red", las=2)#las=2垂直于坐标轴

axis(4, at=z, labels=round(z, digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.01)#tck=-.01刻度线长度

#mtext在图形边缘加文字，side=4右侧，line=3文字与图形边界距离 cex.lab坐标轴名称放大倍数
mtext("y=10/x", side=4, line=3, cex.lab=1, las=2, col="blue")

title("An Example of Creative Axes",
      xlab="X values",
      ylab="Y=X")
par(opar)

 #4.3参考线
 #abline()
 #4.4图例
#install.packages("Hmisc")

dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

opar <- par(no.readonly=TRUE)
par(lwd=2, cex=1.5, font.lab=2)


plot(dose, drugA, type="b",
     pch=15, lty=1, col="red", ylim=c(0, 60),
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")


lines(dose, drugB, type="b",
      pch=17, lty=2, col="blue")

abline(h=c(30), lwd=1.5, lty=2, col="gray")

library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=0.5)

 #inset=.05 图例边距
legend("topleft", inset=.05, title="Drug Type", c("A","B"),
       lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))
par(opar)

 #4.5文本标注
attach(mtcars)
plot(wt, mpg,
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")

text(wt, mpg,
     row.names(mtcars),
     cex=0.6, pos=4, col="red")

detach(mtcars)

#五、图形的组合
 #例1
attach(mtcars)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2))

plot(wt,mpg, main="Scatterplot of wt vs. mpg")

plot(wt,disp, main="Scatterplot of wt vs disp")

hist(wt, main="Histogram of wt")

boxplot(wt, main="Boxplot of wt")

par(opar)
detach(mtcars)

 #例2
attach(mtcars)
opar <- par(no.readonly=TRUE)
par(mfrow=c(3,1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

 #例3
attach(mtcars)
opar <- par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

#例4
attach(mtcars)
opar <- par(no.readonly=TRUE)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE),widths = c(3,1),heights=c(1,2))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)



