install.packages("beepr")
library("beepr")
beep()
for(i in 1:10){
  beep(sound = i)
  Sys.sleep(1)  #1초동안 프로세를 동작시키지 않게다는 의미 
}

.libPaths()
