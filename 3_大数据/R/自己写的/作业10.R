#install.packages("reshape2")
library(reshape2)

id <- c(1,1,2,2)
sex <- c(1,2,2,1)
x1 <- c(2,4,5,1)
x2 <- c(3,2,5,6)
x3 <- c(2,5,6,6)
mydata <- data.frame(id, sex, x1, x2)

md <- melt(mydata, id=c("id", "sex"))

dcast(md, id+sex~variable)
dcast(md, id+variable~sex)
dcast(md, id~variable+sex)

dcast(md, id~variable,mean)
dcast(md, sex~variable,mean)
dcast(md, id~sex,mean)
