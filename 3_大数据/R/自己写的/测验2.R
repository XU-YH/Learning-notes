#(1)
id <- c(1:100)
a <- c("M", "F")
gender <- a[sample(1:2,100,replace=TRUE)]
Math <- sample(1:500, 100, replace = TRUE)
English <- sample(1:50, 100, replace = TRUE)
Java <- sample(1:100, 100, replace = TRUE)
Sports <- sample(1:30, 100, replace = TRUE)

b <- c("A", "B", "D", "E", "F", "G","H", "I", "J","K")
name <- c()
for (i in 1:10) {
  name <- c(name,paste(b[i], 1:10, sep = ""))
}

class <- data.frame(id, name, gender, Math, English, Java, Sports, stringsAsFactors = FALSE)
class

setwd("C:/Users/胥尹辉/Desktop/R/自己写的")

write.csv(class, "class.csv")

#(2)
class1 <- read.csv("C:/Users/胥尹辉/Desktop/R/自己写的/class.csv")
class2 <- class1[sample(1:nrow(class1), 50, replace = FALSE),]

#(3)
funa <- function(x){
  newdata2 
  for (i in 1:length(x)) {
    newdata1 <- (x[,i]-min(x[,i]))/(max(x[,i])-min(x[,i]))
    newdata2 <- transform(newdata)
  }
  return(newdata2)
}
data1 <- funa(class2[,4:7])
grade <- apply(data1, 1, mean, na.rm=TRUE, use.name=FALSE)

x <- class2[,4:7]
i <- 1
newdata <- (x[,i]-min(x[,i]))/(max(x[,i])-min(x[,i]))
