####외부데이터 읽어 오기####
####csv파일 읽기###
###readLInes을 이용하면데이터가 커도 어떤구성인지 확인하기 편하다.

dfimport <- readLines("01_csv.csv",n=3)
dfimport

#csv파일이므로 ,로 구분이 되어 있지만 사용자가 원하는 구분자를 적용해서 작성한 문자열인 경우
#01_csv.csv읽은 내용을 가공해서 데이터프레임 작성
dfcsv <- data.frame(num=1:3,
                    mydata=dfimport,
                    stringsAsFactors = F)
dfcsv


dfcsv$mydata #컬럼안의 문자열에 ,가 추가
#로 분리는되지만 list로 결과가 리턴되어 불편
strsplit(dfcsv$mydata,split = ",")[[1]]
strsplit(dfcsv$mydata,split = ",")[[2]]


# 하나의 컬럼안에 구분자로 텍스트가 구성된 경우 분리하기위해 사용. (split메소드랑 비슷)
install.packages("splitstackshape")
library("splitstackshape")
dfcsv2 <- cSplit(indt = dfcsv,
                splitCols = "mydata",
                sep = ",")

dfcsv2
class(dfcsv2)
dfcsv2

###tsv파일읽기###

###xlsx파일읽기###

###xml파일 읽기###