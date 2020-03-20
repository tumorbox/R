#sample => 렌덤수 생성  replace : 중복 허용 여부 f로하면 중복X ,디폴트가 f
a <- sample(1:10,size=5)
a

set.seed(1222) #1222는 key
b <- sample(1:10,size=5,replace = F)
b


#if문의 역할을 하는 함수 - ifelse
set.seed(1221)
ifdf <- data.frame(mynum=1:6,
                   myval=sample(c("spring","bigdata","android"),size = 6,replace = T))
ifdf
#myval의 값이 spring이면 "프로젝트 완료", bigdata이면 '할거야"
for(i in 1:nrow(ifdf)){
  if(ifdf[i,"myval"]=="spring"){
    ifdf[i,"info"] <- "프로젝트 완료"
  }else{
    ifdf[i,"info"] <- "할꺼야"
  }
}
ifdf

#함수를 이용해서 -info2
ifdf[,"info2"] <- ifelse(test = ifdf$myval=="spring",
                         yes = "쉽다",
                         no = "할꺼다")
ifdf


#함수를 이용해서 -info3
ifdf[,"info3"] <- ifelse(test = ifdf$myval=="spring",
                         yes = "쉽다",
                         no = ifelse(test=ifdf$myval=="bigdata",
                                     yes="빅데이터",
                                     no="안드로이드"))
ifdf

#ifdf[,"info4"] <- "쉽다"
#ifdf










