#一、创建新变量
 #有一个名为mydata的数据框
mydata <- data.frame(x1 = c(2,2,6,4),x2 = c(3,4,2,8))
 #使用如下代码会出错，因为R并不知道x1和x2来自于数据框mydata

sumx <- x1+x2 

 #使用如下代码只会得到一个数据框（mydata）和独立的向量（sumx)）
sumx <- mydata$x1 + mydata$x2
rm(sumx)


 #三种方法：将新变量整合到原始的数据框

  #方法1
mydata$sumx <- mydata$x1  +  mydata$x2
mydata$meanx <- (mydata$x1 + mydata$x2)/2

  #方法2
attach(mydata)
mydata$sumx  <-  x1 + x2
mydata$meanx <- (x1 + x2)/2
detach(mydata)
rm(mydata)#清除数据

  #方法3
mydata <- transform(mydata,sumx = x1+x2, meanx = (x1 + x2)/2)

#二、变量的重编码
 #有一leadership数据框
manager <- c(1,2,3,4,5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(manager,date,gender,age,q1,q2,q3,q4,q5, 
                         stringsAsFactors=FALSE)
 #将leadership数据集中经理人的连续型年龄变量age重编码为类别型变量 agecat（Young<55、 Middle Aged[55,75]、Elder>75)
 #通过分析，99可能为错误值
 #leadership$age[leadership$age==99] <- NA

leadership$age[leadership$age == 99] <- NA

leadership$agecat[leadership$age  > 75]    <- "Elder"

leadership$agecat[leadership$age >= 55 &
                    leadership$age <= 75]    <- "Middle Aged"


leadership$agecat[leadership$age  < 55]    <- "Young"


#三、变量重命名
 #方法1 
fix(leadership)
 #方法2，导入plyr包 r-devel开发用release发行版（比较稳定）oldrel以前版本 
#install.packages("Rcpp")
install.packages("plyr")
library(Rcpp)
library(plyr)

leadership <- rename(leadership,
                     c(manager="managerID", date="testDate")
)

 #方法3，通过names()函数来重命名变量
names(leadership)[2] <- "date"

names(leadership)[5:9] <- c("item1", "item2", "item3", "item4", "item5")

#四、缺失值
y <- c(1,2,3,NA)

is.na(y)

leadership[1,]
leadership[,1]

  #使用is.na()作用于leadership
is.na(leadership[,5:9])

  #重编码某些值为缺失值
leadership$age[leadership$age == 99] <- NA

  #在分析中排除缺失值 
x <- c(1, 2, NA, 3)
y <- x[1] + x[2] + x[3] + x[4]

z <- sum(x)

x <- c(1, 2, NA, 3)
y <- sum(x, na.rm=TRUE)#移除缺失值并使用剩余值进行计算

leadership
newdata <- na.omit(leadership)#通过数na.omit()移除所有含有缺失值

newdata
#五、日期值
strDates <- c("01/05/1965", "08/16/1975")

dates <- as.Date(strDates, "%m/%d/%Y")


 #针对案例
rm(leadership)
myformat <- "%m/%d/%y"

leadership$date <- as.Date(leadership$date, myformat)

 #Sys.Date()可以返回当天的日期，date() 返回当前的日期和时间
Sys.Date()

date()
 #输出指定格式的日期值并提取日期值中的某些部分
today <- Sys.Date()

format(today, format="%B %d %Y")
format(today, format="%A")

 #日期间隔计算
startdate <- as.Date("2004-02-13")
enddate   <- as.Date("2011-01-22")
days      <- enddate - startdate

today <- Sys.Date()
dob   <- as.Date("1989-10-12")

difftime(today, dob, units="weeks")

  #日期型转化为字符型
strDates <- as.character(dates)

is.character(strDates)


#六、数据类型转换
a <- c(1,2,3)
is.numeric(a)
is.vector(a)#向量
a <- as.character(a)
is.numeric(a)
is.vector(a)
is.character(a)