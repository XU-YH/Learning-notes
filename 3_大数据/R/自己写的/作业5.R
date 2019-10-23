#出生多少天
#方法一
startdate <- as.Date("1996-10-10")
today <- Sys.Date()
days <- today - startdate
days
#方法二
difftime(today, startdate, units = "days")

a <- c(2,3,4)
is.numeric(a)
is.character(a)
is.character(today)
is.character(startdate)
is.vector(a)
a <- as.character(a)
is.character(a)
is.numeric(a)
