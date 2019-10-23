#案例数据集
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
             "David Jones", "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",
             "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

roster <- data.frame(Student, Math, Science, English,
                     stringsAsFactors=FALSE)

#循环语句
for(i in 1:10) print("Hello")

i <- 10
while (i>0) {
  print("Hello");
  i <- i-1
}

#选择语句
grade <- "A"
is.character(grade)

if(is.character(grade)) grade <- as.factor(grade)

is.factor(grade)

if(!is.factor(grade)) grade <- as.factor(grade) else print("Grade already is a factor")

x <- c(1,1,1,0,0,1)
ifelse(x!=1,1,0)

score <- 0.6
outcome <- ifelse(score>0.5,print("passed"),print("Failed"))

feelings <- c("sad","afraid")
for (i in feelings) {
  print(
    switch(i,
           happy = "I am glad you are happy",
           afraid = "There is nothing to fear",
           sad = "cheer up",
           angry = "Calm down now"
           )
  )
}

#自定义函数
mystats <- function(x,parametric=TRUE,print=FALSE){
  if (parametric){
    center <-mean(x);spread <- sd(x)
  }else {
    center <- median(x);spread <- mad(x)
  }
  
  if (print & parametric){
    cat("Mean=",center,"\n","SD=",spread,"\n")
  }else if(print & !parametric){
    cat("Median=",center,"\n","MAD=",spread,"\n")
  }
  result <- list(center=center,spread=spread)
  return(result)
}

set.seed(1234)
x <- rnorm(500)


y <- mystats(x)  

y <-mystats(x,parametric = FALSE,print=TRUE)


mydate <- function(type="long"){
  switch (type,
    long = format(Sys.time(),"%A %B %d %Y"),
    short = format(Sys.time(),"%m-%d-%y"),
    cat(type,"is not a recognized type\n")
  )
}

mydate("long")

mydate("short")

mydate()

mydate("medium")

#整合和重构
 #转置
str(mtcars)
cars <- mtcars[1:5,1:4]
t(cars)


 attach(mtcars) 
 aggdata <- aggregate(mtcars,by=list(cyl,gear),FUN=mean,na.rm=TRUE)

ID <- c(1,1,2,2)
Time <- c(1,2,1,2)
X1 <- c(5,3,6,2)
X2 <- c(6,5,1,4)
mydata <- data.frame(ID,Time,X1,X2)

#install.packages("reshape2")
library(reshape2)
md <- melt(mydata,id=c("ID","Time"))

dcast(md,ID+Time~variable)
dcast(md,ID+variable~Time)
dcast(md,ID~variable+Time)

rm(mean)
dcast(md,ID~variable,mean)
dcast(md,Time~variable,mean)
dcast(md,ID~Time,mean)


