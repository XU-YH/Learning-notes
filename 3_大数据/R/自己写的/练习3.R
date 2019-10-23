dev.new()
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Werght")
detach(mtcars)

dev.new()
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

#plot(dose, drugA, type = "b")

opar <- par(no.readonly = TRUE)
par(lty=2, pch=17)
plot(dose, drugA, type="b")
par(opar)


pch_type=0:25
x <- 1:26
y <- rep(6,26)
ltytype <- 1:6

plot(x,y,col=1:26,pch=pch_type,cex=2)
abline(h=3:8,lty=ltytype,col=3:8)
text(3:8,3:8,labels = ltytype)

dev.new()
n <- 7
mycolors <- rainbow(n)

pie(rep(1, n), labels=mycolors, col=mycolors) 

mygrays <- gray(0:n/n)
pie(rep(1, n), labels=mygrays, col=mygrays)

#3.4 图形尺寸和边界尺寸
rm(dose)
rm(drugA)
rm(drugB)
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

dev.new()

#例：使用图形参数控制图形外观
opar <- par(no.readonly=TRUE)

par(pin=c(2, 3))#生成2英寸宽，3英寸高的图形
par(lwd=2, cex=1.5) #线条宽度和符号大小
par(cex.axis=.75, font.axis=3)#坐标轴文字为斜体，大小为0.75

plot(dose, drugA, type="b", pch=19, lty=2, col="red")
lines(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")

par(opar)

