x <- c(1:10)
y <- x
z <- 10/x

opar <- par(no.readonly=TRUE)
par(mar=c(5, 4, 4, 8) + 0.1)


plot(x, y, type="b",
     pch=21, col="red",
     yaxt="n", lty=3, ann=FALSE)#ann=FALSE移除默认标签 #yaxt="n"禁用y轴
lines(x, z, type="b", pch=22, col="blue", lty=2)

axis(2, at=x, labels=x, col.axis="red", las=0)#las=2垂直于坐标轴

axis(4, at=z, labels=round(z, digits=2),
     col.axis="blue", las=0, cex.axis=0.7, tck=-.01)#tck=-.01刻度线长度

#mtext在图形边缘加文字，side=4右侧，line=3文字与图形边界距离 cex.lab坐标轴名称放大倍数
mtext("y=10/x", side=4, line=3, cex.lab=1, las=2, col="blue")

title("An Example of Creative Axes",
      xlab="X values",
      ylab="Y=X")
par(opar)