
#示例婴儿体重和年龄的关系

age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
weight
mean(weight)
sd(weight)
cor(age,weiget)
plot(age,weight)


getwd()
setwd("C:/Users/11095/Desktop/R代码/2创建数据集")

install.packages("vcd")
library(vcd)
help(package="vcd")


#综合示例：
help.start()
#install.packages("vcd")
#help(package="vcd")
#library(vcd)
help(Arthritis)
Arthritis
example(Arthritis)
q()



#例1 创建向量
a <- c(1,2,5,3,6,-2,4) #数值型向量
b <- c("one","two","three") #字符型向量
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #逻辑型向量
#例2 访问向量元素，下标从1开始
a[3]
a[c(1,3,5)]
a[2:6]#此处使用冒号不需要使用c 

#冒号也可用于生成一个数值序列。例如，a <- c(2:6)等价于a <- c(2,3, 4, 5, 6)
a1 <- c(2:6)

#例3 创建矩阵
y <- matrix(1:20,nrow = 5,ncol = 4)
mymatrix <- matrix(c(1,26,24,68),nrow = 2,ncol = 2,byrow = TRUE,dimnames = list(c("R1","R2"),c("C1","C2")))

#等同代码如下cells <- c(1,26,24,68) rnames <- c("R1","R2") cname <- c("C1","C2")
#mymatrix <- matrix(cells,nrow = 2,ncol = 2,byrow = TRUE,dimnames = list(rnames,cname))

#例4 访问矩阵元素
x <- matrix(1:10,nrow = 2)
x[2,]
x[,2]
x[1,4]
x[1,c(4,5)] #选择位于第1行第4、第5列的元素

#例5 创建数组 4个2行3列
dim1 <- c("A1","A2")
dim2 <- c("B1","B2","B3")
dim3 <- c("C1","C2","C3","C4")
z <- array(1:24,c(2,3,4),dimnames=list(dim1,dim2,dim3))
z[1,2,3]