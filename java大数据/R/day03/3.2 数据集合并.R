#八、数据集的合并
#1、添加列
  #使用merge函数
manager <- c(1,2,3,4,5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
country <- c("US","US","UK","UK","UK")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
dataframeA <- data.frame(manager,date,country,gender,age, 
                         stringsAsFactors=FALSE)
manager <- c(1,2,3,4,5)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
dataframeB <- data.frame(manager,q1,q2,q3,q4,q5, 
                         stringsAsFactors=FALSE)

total <- merge(dataframeA, dataframeB, by="manager")
 #使用cbind函数

x <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3,ncol = 3)

y <- x
z <- cbind(x,y)

#2、添加行
r <- rbind(x,y)

#九、数据集取子集
  #创建数据框
manager <- c(1,2,3,4,5)
date <- c("10/24/2008","10/28/2008","10/1/2008","10/12/2008","5/1/2009")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(manager,date,gender,age,q1,q2,q3,q4,q5, 
                         stringsAsFactors=FALSE)
leadership1 <- data.frame(manager,date,gender,age,q1,q2,q3,q4,q5)
str(leadership)

  #1、选入（保留）变量
  #方法一
newdata <- leadership[, c(5:9)]
  #方法二
myvars <- c("q1", "q2", "q3", "q4", "q5")
newdata1 <-leadership[myvars]
  
 #剔除变量
myvars <- names(leadership) %in% c("q3", "q4")

newdata <- leadership[!myvars]

newdata1 <- leadership[c(-7,-8)]

leadership$q3 <- leadership$q4 <- NULL
  #2、选入观测2种方法

newdata <- leadership[1:3,]

newdata <- leadership[which(leadership$gender=="M" &
                              leadership$age > 30),]

attach(leadership)
newdata <- leadership[which(gender=='M' & age > 30),]
detach(leadership)

   #3、根据日期值做选择
leadership$date <- as.Date(leadership$date, "%m/%d/%Y")
startdate <- as.Date("2009-01-01")
enddate   <- as.Date("2009-10-31")
newdata <- leadership[which(leadership$date >= startdate &
                              leadership$date <= enddate),]

  #4、subset()函数
newdata <- subset(leadership, age >= 35 | age < 24,
                  select=c(q1, q2, q3, q4))

newdata <- subset(leadership, gender=="M" & age > 25,
                  select=gender:q4)

  #5、随机抽样
mysample <- leadership[sample(1:nrow(leadership), 3, replace=FALSE),]

#十、使用SQL语句操作数据框
install.packages("sqldf")
library(sqldf)
head(mtcars)
newdf <- sqldf("select * from mtcars where carb=1 order by mpg",row.names=TRUE)


