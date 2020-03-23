#데이터 로드
load(file = "crawl_data.RData")
final_data

final_data[1,3]


library("stringr")
library("mongolite")


url_exam <- final_data[1,3]
url_exam

url_exam_data <- readLines(url_exam,encoding = "UTF-8")
url_exam_data

url_exam_data[200]

str_detect(url_exam_data,"<p>")

content_data <- url_exam_data[str_detect(url_exam_data,"<p>")]

content_data

crawl_content <- str_extract(content_data,"(?<=<p>).*(?=</p>)")
crawl_content

crawl_content <- gsub("<br>","",crawl_content)
crawl_content <- gsub("&nbsp;","",crawl_content)
crawl_content

##=====================================================================##

##문제 풀이

url_list <- final_data[,3]
url_list <- as.character(url_list)
class(url_list)
url_list

contentdata <- readLines(url_list[1],encoding = "UTF-8")

contentdata
#원하는 부분만 가져오기
start <- which(str_detect(contentdata,"post_content"))
end <-  which(str_detect(contentdata,"post_ccls"))

content_filter_data <- contentdata[start:end]

#데이터 정제하기
#1. 벡터로 리턴하므로 한개로 합치기
content_filter_data <- paste(content_filter_data,collapse = "")
content_filter_data


#2. 불필요한 기호나 태그 없애기
#x태그 없애기
content_filter_data <- gsub("<.*?>","",content_filter_data)
content_filter_data 
content_filter_data <- gsub("\t|&nbsp;","",content_filter_data)
content_filter_data


