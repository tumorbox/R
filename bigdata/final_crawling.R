
#범위 주석 ctrl+shif+c

####모두의 광장의 1페이지 : 10페이지의 모든 게시글 크롤링####
#1. 모든 페이지의 title,hit,url,content 추출하기
#2. crawl_result.csv, crawl_reuslt.RData저장
#3. mongodb저장 (300개 저장)

library(stringr)
library(mongolite)

url_p <-"https://www.clien.net/service/group/community?&od=T31&po="

for(i in 0:9){
  url_page <- paste0(url_p,i)
  url_page <- readLines(url_page,encoding = "UTF-8")
}



#========================================================================================
#예제풀이

library("stringr")
library("mongolite")

#mongodb에 저장하기 위해서는크롤링해야한다.
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")


final_data_list=NULL

#0번부터 9번 페이지까지 반봅 작업
for(i in 0:9){
  #페이지마다 연결주소가 달라지므로 변수로 처리
  url1 <- paste0("https://www.clien.net/service/group/community?&od=T31&po=",i)
  
  url1_data <- readLines(url1,encoding = "UTF-8")
  
  #title 추출
  final_filter_data <- url1_data[str_detect(url1_data,"subject_fixed")]
  title <- str_extract(final_filter_data,"(?<=\">).*(?=</span>)")
  
  #hit 추출
  hit_data <- url1_data[str_detect(url1_data,"<span class=\"hit\">")]
  hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1]
  
  #url 추출
  url1 <- url1_data[(which(str_detect(url1_data,"subject_fixed"))-3)]
  url_val <- str_extract(url1,"(?<=href=\").*(?=data-role)")
  url_val <- paste0("https://www.clien.net",url_val)
  url_val <- str_sub(url_val,end = -3)
  
  #url을 이용해서 content항목 추출
  contentlist=NULL   #최초 변수 선언시 null로초기화
  content_filter_data=NULL
  
  #url_val의 갯수만큼...
  for(page in 1:length(url_val)){
    contentdata <- readLines(url_val[page],encoding = "UTF-8")
   
    start <- which(str_detect(contentdata,"post_content"))
    end <-  which(str_detect(contentdata,"post_ccls"))
    
    content_filter_data <- contentdata[start:end]
    content_filter_data <- paste(content_filter_data,collapse = "")
    content_filter_data <- gsub("<.*?>","",content_filter_data)
    content_filter_data <- gsub("\t|&nbsp;","",content_filter_data)
   
    #.기존의 저장되어 있는 contentlist의 내용에 추가
    contentlist <- c(contentlist,content_filter_data)
    cat("\n",page)
  }
  
  final_data <- cbind(title,hit,url_val,contentlist)
  final_data_list <- rbind(final_data_list,final_data)
  cat("\n",i)
}

#csv파일로 생성
write.csv(final_data_list,"final_data_list.csv")
save(final_data_list,file="final_data_list.RDate")

#mongodb에 저장하기
if(con$count()>0){
  con$drop()
}
final_mongo_data <- data.frame(final_data_list)
con$insert(final_mongo_data)













