#例10 导入数据 
#使用键盘 创建一个名为mydata的数据框，它含有三个变量：age（数值型）、gender （字符型）和weight（数值型）。然后你将调用文本编辑器，键入数据，后保存结果
mydata <- data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
mydata <-edit(mydata)
#相当于如下语句fix(mydata)，ctrl+s保存
mydata <- edit(mydata)

getwd()

#使用文本导入,一般header = TRUE
stu <- read.table("test.txt",header = TRUE)
#对比
stu <- read.table("test.txt",header = FALSE)

grades <- read.table("test.csv",header=TRUE)
#grades <- read.table("test.csv",header = TRUE,row.names="Name",seq=",")


