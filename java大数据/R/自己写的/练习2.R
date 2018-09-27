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
leadership
attach(leadership)
newdata <- leadership[order(gender, age),]
newdata
detach(leadership)

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
total

x <- matrix(1:9, nrow = 3)
y <- x
z <- cbind(x, y)
z
r <- rbind(x, y)
r

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
newdata <-leadership[, c(5:9)]
newdata
myvars <- names(leadership) %in% c("q3", "q4")
newdata <- leadership[!myvars]
newdata
head(leadership)
help("head")
newdata1 <- leadership[c(-7,-8)]
newdata1
leadership$q1 <- leadership$q2 <- NULL
leadership
d <- matrix(1:9, nrow = 3)
head(d)
d

newdata <- leadership[1:3,]
newdata

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


#十、使用SQL语句操作数据框
install.packages("sqldf")
library(sqldf)
head(mtcars)
newdf <- sqldf("select * from mtcars where carb=1 order by mpg", row.names= TRUE)
