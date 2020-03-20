#[예제]
# csv_exam.csv를 읽어서 데이터를 수정한 후 
#csv_exam_result.csv로 저장하기
# - science가 80이상인 데이터를 추출
# - 추출된 데이터에 mytotal과 myavg컬럼을 추가
# - mytotal: 모든 과목의 총점
# - myavg : 모든 과목의 평균

mycsvdata <- read.csv("csv_exam.csv")
mycsvdata
mycsvdata_frame <- data.frame(mycsvdata)
mycsvdata_frame

mycsvdata_result <- mycsvdata_frame[mycsvdata_frame$science>=80,]
mycsvdata_result


mytotal <- c(sum(mycsvdata_result[1,-c(1,2)]),sum(mycsvdata_result[2,-c(1,2)]),sum(mycsvdata_result[3,-c(1,2)]),sum(mycsvdata_result[4,-c(1,2)]))
mytotal


myavg <-mytotal/3
myavg

mycsvdata_result <-cbind(mycsvdata_result,mytotal,myavg)
mycsvdata_result

write.csv(mycsvdata_result,file="csv_exam_result.csv")



#[예제] 풀이

mydata <- read.csv("csv_exam.csv")
mydata
mydataResult <- mydata[mydata$science>=80,]
mydataResult

mydataResult$mytotal <- as.numeric(mydataResult$math+mydataResult$english+mydataResult$science)
mydataResult

mydataResult$myavg <- as.numeric(mydataResult$mytotal/3)
mydataResult
