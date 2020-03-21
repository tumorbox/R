library("stringr")
#패턴
mytext <- "      test$uuuuu"
mytext2 <- "http://cran.r-project.org/"
str_extract(mytext2,".+(:)")  #패턴과 일치하는 문자열도 리턴
str_extract(mytext2,".+(?=:)")
str_extract(mytext2,".+(?=:)")  #전방 탐색 (?=)
                                #패턴과 일치하는 문자 바로 전까지 리턴

str_extract(mytext,".+(?=$)")  

str_extract(mytext,"(?<=\\$).*")  #후방 탐색 (?<=)



#문자열 관련 함수
#paste - 벡터를 연결해서 하나의 문자열 생성
#paste0 - 여러개를 연결해서 보여줌

str <- c("java","hadoop","R","mongodb")
paste(str,collapse = ",")
paste0(mytext,mytext2)

#문자열 치환할때 사용 gsub
data <- gsub("u","",mytext)

str_trim(data)
