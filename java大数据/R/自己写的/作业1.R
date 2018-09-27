#字符型向量
a <- c("cat", "dog", "mouse")
#逻辑型向量
b <- c(TRUE, TRUE, FALSE)
#数字型向量
c <- c(1, 3, 4)
a
b
c

#5*4矩阵
mymatrix <- matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE, dimnames = list(c("r1", "r2", "r3", "r4", "r5"), c("c1", "c2", "c3", "c4")))
mymatrix

#2*4*5数组
arr1 <- c("a1", "a2")
arr2 <- c("b1", "b2", "b3", "b4")
arr3 <- c("c1", "c2", "c3", "c4", "c5")
arr <- array(1:40, c(2, 4, 5), dimnames = list(arr1, arr2, arr3))
arr
arr[2,2,4]

#数据框
id <- c(1,2,3,4)
name <- c("tom", "lucy", "jack", "louse")
age <- c(23, 21, 20, 19)
dataframe <- data.frame(id, name, age)
dataframe
dataframe[1:3]
dataframe[1:2]
dataframe$id

#列表
d <- "My Second List"
e <- c(1,1,24,4)
f <- matrix(1:6, nrow = 2)
g <- c("one", "two", "three")
myList <- list(title=d, e,f,g)
myList[[2]]