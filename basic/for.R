myv <- c(1:10)
for(i in myv){
  print(i)
}


#1부터 10까지 합구하기 -ver1
sum <- 0;
for(i in myv){
  sum = sum+i
}
 sum

 #1부터 10까지 합구하기 - ver2
 myv2 <- c(1:100)
sum(myv2) 
