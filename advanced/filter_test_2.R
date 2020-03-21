library("dplyr")
exam <- read.csv("csv_exam.csv")

exam


#체이닝 오퍼레이터 때문에 
#filter - 조건을 정의
exam %>% 
  filter(class==1) %>% 
  filter(math>=50)

#select - 추출하고 싶은 변수를 정의
exam %>% select(-math)
exam %>% select(id,english)



exam %>% 
  filter(class==1) %>% 
  select(id,math,science)



#arrange 정렬
exam %>% arrange(desc(id))
exam %>% arrange(desc(id))
exam %>% arrange(class,desc(english))



#mutate - 파생변수 추가하기(원본에 없는 컬럼 추가)
exam %>% 
  mutate(total=math+english+science) %>% 
  head()

exam %>% 
  mutate(total = math+english+science,
         mean = total/3,
         info = ifelse(science>70,"통과","재시험")) 

exam %>% 
  group_by(class) %>% 
  summarise(math_sum = sum(math),
            math_mean = mean(math),
            math_median = median(math),
            math_count = n())
