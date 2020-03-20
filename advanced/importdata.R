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

#타입 변경
# as의 함수들을 이용해서 변경 as는 ~~~가 아닌것을 ~~~로 변경한다는 의미

#data.table과 data.frame의 속성을 가지고 있는 dfcsv2를 dataframe으로 변경
dfcsv2 <- as.data.frame(dfcsv2)
class(dfcsv2)   # 타입을 확인

class(dfcsv2$num)
class(dfcsv2$mydata_1)
class(dfcsv2$mydata_2)
class(dfcsv2$mydata_3)
class(dfcsv2$mydata_4)

str(dfcsv2)   #전체 데이터의 구조를 확인
              #변환한 데이터들의 타입이 Factor
              #Factor는 순서와 명목형
              #1,2,3,..........의 값이 어떤 순서를 의미하는 경우 : 칼럼의 데이터가 순서형
              #class칼럼 1,2,3,4....... : 순서를 의미하지 않고 1반,2반,3반...                          #순서가 적용되도록 정의된 Factor타입을 char로 변경

#1번 칼럼을 뺀 나머지 컬럼의 타입을 char로 변환
for(i in 2:ncol(dfcsv2)){
  dfcsv2[,i] = as.character(dfcsv2[,i])
}

str(dfcsv2)





###tsv파일읽기###
#tab으로 구분된 파일(\t)
df3 <- read.delim("02_tsv.txt",sep = "\t")
head(df3)




###xml파일 읽기###

install.packages("XML")
library("XML")
?xmlTree
dfxml <-  xmlTreeParse("03_xml.xml")
dfxml


#root element와 하위엘리먼트만ㅊ출
dfxml <- xmlRoot(dfxml)
dfxml

#mxl에 있는 모든 태그의 name과 value를 추출 
#-XXXApply함수는 for문 대신으로 사용할 수 있는 함수

dfxml <- xmlSApply(dfxml,function(x){
                    xmlSApply(x,xmlValue)
                })

dfxml
dfxml <- data.frame(t(dfxml),row.names = NULL)
dfxml



###xlsx파일읽기###
install.packages("readxl")
library("readxl")
dfxlsx <- read_xlsx("07_xlsx.xlsx")
dfxlsx    #tibble => data.frame과 비슷한 다른 종류의 라이브러리


