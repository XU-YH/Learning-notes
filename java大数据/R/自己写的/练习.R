a <- c(1,2,3,4,5,-4,2)
b <- c("one", "two", "three")
c <- c(TRUE, TRUE, FALSE)

a[4]
a[c(1,4,6)]
a[2:4]

a1 <- c(2:7)

y <- matrix(1:10, nrow = 5, ncol = 2)
mymatrix <- matrix(c(1, 32, 3, 23), nrow = 2, ncol = 2, byrow = TRUE, dimnames = list(c("r1", "r2"), c("c1", "c2")))

x <- matrix(1:10, nrow = 5)
x[2,]
x[,2]
x[1,2]
x[c(2,3),2]

diml <- c("a1", "a2")
dim2 <- c("b1", "b2", "b3", "b4")
dim3 <- c("c1", "c2", "c3", "c4", "c5")
rm("diml")
dim1 <- c("a1", "a2")
z <- array(1:40, c(2,4,5),dimnames = list(dim1, dim2, dim3))
z[1,2,3]

patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type3", "Type4")
status <- c("Poor", "Improved", "Excellent", "Poor")
patinetdata <- data.frame(patientID, age, diabetes, status)

patinetdata[1:2]
patinetdata[2:2]
patinetdata[3:2]
patinetdata[c("diabetes","status")]
patinetdata$age

g <- "My First List"
h <- c(25, 32, 21, 4)
j <- matrix(1:20, nrow = 4)
k <- c("one", "two", "three")
mylist <- list(title=g, ages=h, j, k)
mylist[[1]]
mylist[["ages"]]

diabetes <- c("Type1","Type2","Type3","Type4")
diabetes <- factor(diabetes)
str(diabetes)

status <- c("Poor","Improved","Excellent","Poor")
status <- factor(status,order = TRUE,levels=c("Poor","Improved","Excellent"))
str(status)
summary(status)
summary(patinetdata)

mydata <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
mydata <- edit(mydata)

getwd()

setwd("C:\\Users\\胥尹辉\\Desktop\\R")
stu <- read.table("test.txt", header = TRUE)
str(stu)
grades <- read.table("wisc_bc_data.csv", header = TRUE, row.names = "Name", seq=",")
str(grades)
