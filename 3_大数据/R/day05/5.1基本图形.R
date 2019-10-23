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
pdf("mygraph.pdf")#将图标以pdf格式保存在工作空间中
dev.off(4)


#二、一个简单的例子
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

#横坐标，纵坐标，显示线条
plot(dose, drugA, type="b")

#三、图形参数
 #改变表示的图形
 #方法（一）
 #par(lty=2)#含有一个当前参数设置的列表

opar <- par(no.readonly=TRUE)#建立一个修改当前参数的列表
par(lty=2, pch=17)#线条类型，绘制点时使用的符号
#par(lty=2)
#par(pch=17)
plot(dose, drugA, type="b")
par(opar)
 
 #方法二 在高级绘图函数当中进行修改
#plot(dose, drugA, type="b", lty=2, pch=17)

#横，纵，显示线条，线条类型，线条宽度(默认1)，绘制点时使用的符号
plot(dose, drugA, type="b", lty=3, lwd=3, pch=15, cex=2)



 #3.1符号和线条

pch_type=0:25
x <- 1:26
y <- rep(6,26)#6重复26次

plot(x,y,col=1:26,pch=pch_type,cex=2)#cex 指符号的大小(默认1)

#text(x,y,col=1:10,pos=4,labels=paste("pch=",pch_type))
#文本标注
#text(location, "text to place", pos, ...)
#location 指文本的位置参数，pos 指文本相对于位置参数的方位，labels 指一个字符型向量，表示置于刻度线旁边的文字标签(如果为null，则将直接使用at中的值)
text(x,y,col=1:26,pos=4,labels=pch_type,srt=90)

x <- 1:10
y <- 1:10
ltytype <- 1:6

plot(x,y,col= 1:10,pch=16,type = "n")

#参考线
abline(h=3:8,lty=ltytype,col=3:8)

#文本标注
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

#pie 指扇形
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

