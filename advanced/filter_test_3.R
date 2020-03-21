test1 <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu=c(77,56,99,100,99))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final_jumsu=c(77,57,89,100,100))

test1
test2

#열방향 조인
final_data <- left_join(test1,test2,by = "id")
final_data

namedata <- data.frame(class=c(1,2,3,4,5),
                       teacher=c("kim","lee","park","jang","hong"),
                       stringsAsFactors = F)  #factor타입으로만들어지는것을 방지  기본값                                                 factor로 되어 있음
namedata

str(namedata)

exam

exam_new <- left_join(exam,namedata,by="class")
exam_new


#행방향 조인
groupA <- data.frame(id=c(1,2,3,4,5),
                     mid_jumsu =c(65,87,98,87,99))
groupB <- data.frame(id=c(6,7,8,9,10),
                     mid_jumsu = c(87,90,98,99,76))

group_total <- bind_rows(groupA,groupB)
group_total
