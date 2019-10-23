#(1)
studentid <- c(1:8)
date <- c("06/30/06","06/30/06","06/30/06","06/30/07","06/30/07","06/30/07","06/30/08","06/30/09")
gender <- c("M","F","M","F","M","F","F","M")
age <- c(18, 18, 17, 18, 16, 19, 15, 70)
friends <- c(7,0,69,0,10,142,72,17)
item1 <- c(0,1,0,1,0,0,1,0)
item2 <- c(0,1,1,0,0,0,0,1)
item3 <- c(0,0,0,0,1,0,1,0)
item4 <- c(0,0,1,0,0,0,NA,1)
item5 <- c(0,1,0,1,0,1,NA,0)
teenagers <- data.frame(studentid,date,gender,age,friends,item1,item2,item3,item4,item5, stringsAsFactors = FALSE)
teenagers

#(2)
r1 <- c(9, "06/30/06", "F", 15, 52, 0, 0, 0, 0, 0)
r2 <- c(10, "06/30/06", "F", 12, 39, 1, 0, 1, NA, NA)
teenagers <- rbind(teenagers,r1, r2)
teenagers

#(3)
rm(studentid)
rm(date)
rm(gender)
rm(age)
rm(friends)
rm(item1)
rm(item2)
rm(item3)
rm(item4)
rm(item5)

attach(teenagers)

studentid <- as.integer(studentid)
age <- as.numeric(age)
friends <- as.numeric(friends)
item1 <- as.numeric(item1)
item2 <- as.numeric(item2)
item3 <- as.numeric(item3)
item4 <- as.numeric(item4)
item5 <- as.numeric(item5)
teenagers <- data.frame(studentid,date,gender,age,friends,item1,item2,item3,item4,item5, stringsAsFactors = FALSE)
teenagers
#str(teenagers)

teenagers$interest_sum <- rowSums(teenagers[6:10],na.rm = TRUE)

detach(teenagers)

#(4)
attach(teenagers)
#方法一
#install.packages("Rcpp")
#install.packages("plyr")
library(Rcpp)
library(plyr)
teenagers <- rename(teenagers, c(date="graddate", item1="basketball", item2="football", item3="socce", item4="softball", item5="volleyball"))

#方法二
names(teenagers)[2] <- "graddate"
names(teenagers)[6:10] <- c("basketball", "football", "socce", "softball", "volleyball")

detach(teenagers)

#(5)
attach(teenagers)

teenagers$age[age ==70] <- NA
teenagers$agecat[age < 15] <- "junior"
teenagers$agecat[age >= 15 & age <= 20] <- "senior"
teenagers

detach(teenagers)

#(6)
newdata <- teenagers <- na.omit(teenagers)
newdata

#(7)
teenagers$graddate <- as.Date(teenagers$graddate, "%m/%d/%y")
teenagers

days <- Sys.Date() - teenagers$graddate[1]
days

#(8)
#方法一
newdata1 <- teenagers[names(teenagers) %in% c("basketball", "football")]
newdata1
#方法二
newdata12 <- teenagers[,6:7]
newdata12
#方法三
newdata13 <- subset(teenagers, select = c(basketball, football))
newdata13

#(9)
newdata2 <- teenagers[1:5,]
newdata2

#(10)
newdata3 <- teenagers[which(teenagers$gender=="M" & teenagers$age>15),]

#(11)
newdata4 <- subset(teenagers, teenagers$age<19 & teenagers$age>15)
newdata4

#(12)
mysample <- teenagers[sample(1:nrow(teenagers), 5, replace = FALSE),]
mysample

#(13)
#install.packages("sqldf")
library(sqldf)
library(gsubfn)
library(proto)
library(RSQLite)
newdata5 <- sqldf("select * from teenagers where gender='F' order by friends", row.names=TRUE)
