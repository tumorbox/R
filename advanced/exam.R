#ggplot2패키지에서 제공되는 mpg데이터를 분석
####step1. mpg를 dataframe으로 변경

mpg
dfmpg <- as.data.frame(mpg)
nrow(dfmpg)


####step2. mpg의 정보를 출력####
#행 갯수, 열의 갯수, 위에서 10개, 끝에서 10개출력
dfmpg
nrow(dfmpg)
ncol(dfmpg)
head(dfmpg,10)
tail(dfmpg,10)


####step3. mpg의 컬럼명을 변경####
#cty => city, hwy =>highway
library("dplyr")
dfmpg
dfmpg <- rename(dfmpg,city=cty)
dfmpg <- rename(dfmpg,highway=hwy)
dfmpg  

####step4. 파생변수 생성하기####
#total칼럼을 추가 => cty와 hwy의 합
#avg컬럼을추가 => cty와 hwy의 평균 

dfmpg$total <- dfmpg$city+dfmpg$highway
dfmpg$avg <- dfmpg$total/2
dfmpg

####step5. 생성된 total을 가지고 요약정보 확인####
summary(dfmpg$total)


####step6. info컬럼 추가 ####
#total값을 이용해서 평가 - 30이상이면 pass, fail
dfmpg$info <- ifelse(test = dfmpg$total>=30,
                     yes = "pass",
                     no = "fail")
dfmpg
####step7. grade칼럼을 추가####
#total값을 이용해서 평가 -40이상이면 A, 35이상이면 B, 30이상 C, 나머지 D
dfmpg$grade <- ifelse(test=dfmpg$total>=40,
                      yes="A",
                      no=ifelse(dfmpg$total>=35,
                                yes = "B",
                                no=ifelse(dfmpg$total>=30,
                                          yes = "C",
                                          no="B")
                                )
                      )
dfmpg















