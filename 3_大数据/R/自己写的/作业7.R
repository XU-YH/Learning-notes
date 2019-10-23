Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
             "David Jones", "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",
             "Mary Rayburn")
Math <- c(502,600,412,358,495,512,410,625,573,522)
Science <- c(95,99,80,82,75,85,80,95,89,86)
English <-c(25,22,18,15,20,28,15,30,27,18)
PE <- c(5,20,30,48,32,46,35,30,49,50)
StudentTable <- data.frame(Student, Math, Science, English, PE, stringsAsFactors = FALSE)
StudentTable

#标准化
data <- scale(StudentTable[,2:5])
score <- apply(data, 1, mean)
num <- quantile(score, c(.8, .6, .4, .2))

StudentTable$level[score <= num[4]] <- "E"
StudentTable$level[score >= num[4]] <- "D"
StudentTable$level[score >= num[3]] <- "C"
StudentTable$level[score >= num[2]] <- "B"
StudentTable$level[score >= num[1]] <- "A"

#姓氏排序
a <- unlist(strsplit(StudentTable$Student, " "))
b <- c(2,4,6,8,10,12,14,16,18,20)
c <- order(a[b])

#新表格
newStudentTable <- StudentTable[c,]
newStudentTable