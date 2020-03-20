install.packages("ggplot2")
library("ggplot2")
mydata <- c("java","spring","bigdata","android")
qplot(mydata)
qplot(data=mpg,x=hwy)
qplot(data=mpg,x=hwy,y=drv)
qplot(data=mpg,x=drv,y=hwy,geom = "line")
qplot(data=mpg,x=drv,y=hwy,geom="boxplot",color=drv)

mpg
