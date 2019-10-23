#一、数学函数
x <- c(4,-16,25)

y <- abs(x)

z <- sqrt(y)

ceiling(3.521) #返回不小于x的最小整数

floor(3.574)#返回不大于x的最大整数

trunc(6.88)#向0的方向截取的X的整数部分

round(3.475, digits=2)#将x舍入为指定为的小数

signif(3.475, digits=2)#将x舍入为指定指定有效数字位数

cos(2)#余弦函数

acos(-0.416)#反余弦函数

sinh(2)#双曲正弦函数

asinh(3.627)#反双曲正弦函数

log10(10)#取以10为底的对数

exp(2.3026)#指数函数

#二、统计函数

x <- c(1, 2, 3, 4, 5, 6, 7, 8)

mean(x)

median(x)

sd(x)

var(x)

mad(c(2,3,4,5,6))

y <- 11:18
quantile(y)

range(x)

sum(x)

diff(x)

min(x)
max(x)

mean(x)
sd(x)

n <- length(x)
meanx <- sum(x)/n

css <- sum((x - meanx)**2)           
sdx <- sqrt(css / (n-1))
meanx
sdx


#三、概率函数

x <- pretty(c(-3,3),30)

y <- dnorm(x)

plot(x,y)

plot(x,y,type = "l",xlab = "我是x轴",ylab = "我是y轴",yaxs="i")

pnorm(1.96)
qnorm(0.9,mean = 500,sd=100)

rnorm(50,mean = 50,sd=100)

runif(5)


set.seed(1234) #设定种子
runif(5)

  #
install.packages("MASS")
library(MASS)
mean <- c(230.7, 146.7, 3.6)                                           
sigma <- matrix( c(15360.8, 6721.2, -47.1,                              
                   6721.2, 4700.9, -16.5,
                   -47.1,  -16.5,   0.3), nrow=3, ncol=3)
set.seed(1234)
mydata <- mvrnorm(500, mean, sigma) 

mydata <- as.data.frame(mydata)  

names(mydata) <- c("y", "x1", "x2") 

dim(mydata)  

head(mydata, n=10) 

 #四、字符处理函数
x <- c("ab", "cde", "fghij")
length(x) 

nchar(x[3])#计算x中的字符数量 

x <- "abcdef"
substr(x, 2, 4) #提取或替换一个字符向量中的子串 

substr(x, 2, 4) <- "222"
  #在x中搜索某种模式。若fixed=FALSE，则pattern为一个正则表达式。
  #若fixed=TRUE，则pattern为一个文本字符串。 返回值为匹配的下标 

grep("A", c("b","A","c"), fixed=TRUE) 
  #在x中搜索pattern，并以文本replacement将其替换
  #。若 fixed=FALSE，则pattern为一个正则表达式。若fixed=TRUE， 则pattern为一个文本字符串 

  #sub("\\s",".","Hello There") #空格替换为， "\s"是一个用来查找空白的正则表达式

y <- strsplit("abc", "")#在split处分割字符向量x中的元素
                      #将返回一个含有1个成分、3个元素的列表

paste("x", 1:3, sep="") #连接字符串，分隔符为sep 

paste("x",1:3,sep="M")

toupper("abc")#大写转换

tolower("ABC")#小写转换

#五、其他实用函数
x <- c(2, 5, 6, 9)
length(x)#对象x的长度 


indices <- seq(1,10,2) #生成一个序列，从1到10，间隔是2

y <- rep(1:3, 2)#将1到3重复2次

firstname <- c("Jane")
cat("Hello" ,firstname, "\n") #连接...中的对象，并将其输出到屏幕上或文件中

name <- "Bob"
cat("Hello",name,"\b.\n","\bisn\'t R","\t","GREAT?\n")

#六、将函数应用于矩阵和数据框

a <- 5
sqrt(a)

b <- c(1.243, 5.654, 2.99)
round(b)

c <- matrix(runif(12), nrow=3)#runif(12)生成均匀分布随机数
log(c)
mean(c)

#apply函数
mydata <- matrix(rnorm(30),nrow = 6)
apply(mydata, 1, mean)#计算每行的均值

apply(mydata, 2, mean)#计算每列的均值

apply(mydata, 2, mean,trim=0.2)#计算每列的截尾均值


