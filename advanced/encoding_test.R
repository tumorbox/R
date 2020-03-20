install.packages("data.table")
library("data.table")






df <- data.frame(mydata1=1:5,
                 mydata2=letters[1:5],
                 mydata3=c("자바","android","@한글%$","test","한글"))
df

####파일write###
write.csv(df,"encoding_test.csv",row.names = F)
write.csv(df,"encoding_test_euc-kr.csv",row.names = F, fileEncoding = "euc-kr")
write.csv(df,"encoding_test_cp949.csv",row.names = F, fileEncoding = "cp949")
write.csv(df,"encoding_test_UTF8.csv",row.names = F, fileEncoding = "UTF8")



####깨진파일처리하기####
read.csv("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv")

readLines("encoding_test_utf8.csv",encoding = "UTF-8")

#data.table - dataframe보다 강력
dftable <- fread("encoding_test_utf8.csv")
head(dftable)

#인코딩 함수
Encoding(dftable$mydata3)="UTF-8"
head(dftable)
