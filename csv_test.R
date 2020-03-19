#csv는 기본 패키지로 사용가능
#csv를 읽기
mdf <- read.csv("csv_exam.csv")
mdf
mdf[2,]
#dataframe에서 조건에 만족하는 데이터를 조회
m <- matrix(1:20,ncol = 4)
m
d <- data.frame(m)
d
myresult
myresult <- d[d$X3>=13,]
myresult

#조건에 만족하는 데이터를 result.csv로 저장
write.csv(myresult,file="result.csv")


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


mycsvdata_result <- data.frame(mytotal,myavg)
mytotal <- mean(mycsvdata_result$math),mean(mycsvdata_result$english),mean(mmycsvdata_frame)
mydataframe$X4 <- col4