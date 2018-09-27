#数据框
managerID <- c(1,2,3,4,5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
age <- c(32,33,23,43,99)
gender <- c("M", "F", "F", "F", "M")
country <- c("US", "US", "UK", "US", "UK")
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(managerID, date, age, gender, country,q1,q2,q3,q4,q5,stringsAsFactors = FALSE)
leadership
str(leadership)
leadership$age[leadership$age > 90] <- NA
leadership$agecat[leadership$age > 55] <- "Elder"
leadership$agecat[leadership$age <= 55 & leadership$age >= 30 ] <- "Middle Aged"
leadership$agecat[leadership$age < 30] <- "Young"
#重命名
#方法一
fix(leadership)
#方法二
install.packages("plyr")
library(Rcpp)
library(plyr)
leadership <- rename(leadership,c(manager="managerID", date="testDate"))
#方法3
names(leadership)[2] <- "date"
names(leadership)[6:10] <- c("item1", "item2", "item3", "item4", "item5")
