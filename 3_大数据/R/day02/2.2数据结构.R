#例1 创建向量
a <- c(1,2,5,3,6,-2,4) #数值型向量
b <- c("one","two","three") #字符型向量
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #逻辑型向量

#例2 访问向量元素，下标从1开始
a[3]
a[c(1,3,5)]
a[2:6]#此处使用冒号不需要使用c 

#冒号也可用于生成一个数值序列。例如，a <- c(2:6)等价于a <- c(2,3, 4, 5, 6)
a1 <- c(2:6)

#例3 创建矩阵
y <- matrix(1:20,nrow = 5,ncol = 4)
mymatrix <- matrix(c(1,26,24,68),nrow = 2,ncol = 2,byrow = TRUE,dimnames = list(c("R1","R2"),c("C1","C2")))

#等同代码如下cells <- c(1,26,24,68) rnames <- c("R1","R2") cname <- c("C1","C2")
#mymatrix <- matrix(cells,nrow = 2,ncol = 2,byrow = TRUE,dimnames = list(rnames,cname))

#例4 访问矩阵元素
x <- matrix(1:10,nrow = 2)
x[2,]
x[,2]
x[1,4]
x[1,c(4,5)] #选择位于第1行第4、第5列的元素

#例5 创建数组 4个2行3列
dim1 <- c("A1","A2")
dim2 <- c("B1","B2","B3")
dim3 <- c("C1","C2","C3","C4")
z <- array(1:24,c(2,3,4),dimnames=list(dim1,dim2,dim3))
z[1,2,3]

#例6 创建数据框
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1","Type2","Type3","Type4")#糖尿病
status <- c("Poor","Improved","Excellent","Poor")
patinetdata <- data.frame(patientID,age,diabetes,status)

age

#例7 选取数据框中的元素
patinetdata[1:2]

patinetdata[c("diabetes","status")]

patinetdata$age #$用来选取一个给定数据框中的某个特定变量

patinetdata$age

#函数attach()、detach() patientdata$可能会让人生厌，所以不妨走一些捷径
mtcars
attach(mtcars)#函数attach()可将数据框添加到R的搜索路径中
plot(mpg,disp)
detach(mtcars)#函数detach()将数据框从搜索路径中移除

attach(patinetdata)
age
detach(patinetdata)



#例8 创建列表，其中有四个成分：一个字符串、一个数值型向量、一个矩阵以及一个字符型向量。可以组合任意多的对象，并将它们保存为一个列表。
g <- "My First List"
h <- c(25,26,18,39)
j <- matrix(1:10,nrow = 5)
k <- c("one","two","three")
mylist <- list(title=g,ages=h,j,k) #含有四个元素的向量
mylist[[2]]#输出第二个成分
mylist[["ages"]]

#例9 因子的使用

diabetes <- c("Type1","Type2","Type3","Type4")#糖尿病
#将此向量存储为(1, 2, 1, 1)，并在内部将其关联为 1=Type1和2=Type2（具体赋值根据字母顺序而定）
diabetes <- factor(diabetes)
str(diabetes)#显示对象的结构
summary(diabetes)#显示对象的统计概要，显示频数值

status <- c("Poor","Improved","Excellent","Poor")
status <- factor(status,order = TRUE,levels=c("Poor","Improved","Excellent"))
str(status)
summary(status)
summary(patinetdata)
#函数summary()会区别对待各个变量 。它显示了连续型变量age的小值、大值、均值和各四分位数，并显示了类别型变量diabetes和 status（各水平）的频数值。






