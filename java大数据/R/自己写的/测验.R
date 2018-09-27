#install.packages("vcd")
library(grid)
library(vcd)
counts <- table(Arthritis$Improved)#table 函数对应的就是统计学中的列联表，是一种记录频数的方法.

head(Arthritis)#查看数据集
data(Arthritis)
str(Arthritis)

dev.new()

x <- c(1,2,3,4,5,6)

barplot(x, 
        main="条形图",
        xlab="x", ylab="y")

dev.new()

boxplot(x, main="箱线图", ylab="y")

boxplot.stats(mtcars$mpg)

dev.new()

dotchart(x, cex=.7, main="点图", xlab="x")

dev.new()
#install.packages("plotrix")
library(plotrix)
lbls <- c("a", "b", "c", "d", "e", "f")
fan.plot(x, labels = lbls, main="扇形图")

dev.new()
hist(x,xlab = "x",col = "yellow",border = "blue")

R <- function(x, print=TRUE){
  if(print){
    center <- mean(x);
    print(center)
  }else{
    print("nothing")
  }
}
set.seed(1111)
x <- rnorm(10)
y <- R(x)
z <- R(x, print=FALSE)

a <- c(1,2,3,4,5,6)

b <- matrix(1:6, nrow = 3)

c1 <- c("A1","A2","A3")
c2 <- c("B1","B2","B3")
c3 <- c("C1","C2","C3","C4")
arr <- array(1:36,c(3,3,4),dimnames=list(c1,c2,c3))

c1 <- c("A1","A2","A3")
c2 <- c("B1","B2","B3")
c3 <- c("C1","C2","C3","C4")
list1 <- list(c1,c2,c3)
