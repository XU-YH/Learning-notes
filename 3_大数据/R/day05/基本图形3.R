#三、直方图
# simple histogram                                                       
range(mtcars$mpg)
#length(mtcars$mpg)
hist(mtcars$mpg)

# colored histogram with specified number of bins        
hist(mtcars$mpg, 
     breaks=12, 
     col="red", 
     xlab="Miles Per Gallon", 
     main="Colored histogram with 12 bins")

# colored histogram with rug plot, frame, and specified number of bins 
hist(mtcars$mpg, 
     freq=FALSE, #freq=FALSE表示根据概率密度
     breaks=12, 
     col="red", 
     xlab="Miles Per Gallon", 
     main="Histogram, rug plot, density curve")  

rug(jitter(mtcars$mpg))#rug在坐标轴上标出元素出现的频数
lines(density(mtcars$mpg), col="blue", lwd=2)

# histogram with superimposed normal curve (Thanks to Peter Dalgaard)  
x <- mtcars$mpg 
h<-hist(x, 
        breaks=12, 
        col="red", 
        xlab="Miles Per Gallon", 
        main="Histogram with nSormal curve and box") 
xfit<-seq(min(x),max(x),length=40) 

yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 

yfit <- yfit*diff(h$mids[1:2])*length(x) # 频数=频率/组距*组距*总数~密度*组距*总数
lines(xfit, yfit, col="blue", lwd=2)
box()


#四、核密度图
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,1))
d <- density(mtcars$mpg)

plot(d)

d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
rug(mtcars$mpg, col="brown")
par(opar)


#五、箱线图
#par(mfrow=c(1,1))
boxplot(mtcars$mpg, main="Box plot", ylab="Miles per Gallon")

boxplot.stats(mtcars$mpg)

#研究四缸、六缸、八缸发动机对每加仑汽车行驶英里数的影响。
boxplot(mpg ~ cyl, data=mtcars,
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

#含凹槽的箱线图
boxplot(mpg ~ cyl, data=mtcars,
        notch=TRUE,
        varwidth=TRUE,
        col="red",
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")


#六、点图

dotchart(mtcars$mpg, labels=row.names(mtcars), cex=.7,
         main="Gas Mileage for Car Models",
         xlab="Miles Per Gallon")

#点图2
x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
str(x)
head(x)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon")

