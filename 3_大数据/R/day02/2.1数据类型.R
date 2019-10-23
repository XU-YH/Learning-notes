#1 字符（charactor）单引号双引号都可以
a <- "哈哈哈哈"  
a.a <- "二哈" #起名字字母之间可以有点 
is.character(a)#数据类型的判断函数
mode(a)

#2 数字（numeric）实数
b <- 5.7
is.numeric(b)

#3 整数（integer）
c <- 50
is.integer(c)#false，语言bug，混乱性  可转换数据类型
is.numeric(c)
mode(c)

#4 逻辑（logical）
d <- TRUE
is.logical(d)


#5 复数（complex）
e <- 5+7i
is.complex(e)

#特殊的数据类型，即数据的缺失 NA 和 空值NULL
  #数值缺失
f <- NA
is.na(f)
  #空值NULL
g <- c(NA,2,5,NULL)

#数据类型的转化
o <- as.integer(c)
is.integer(o)






