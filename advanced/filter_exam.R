#p.150
#문제1

library("ggplot2")
mpg

mpg %>% 
  group_by(class) %>% 
  summarise(city_avg <- mean(cty))



#문제2

mpg %>% 
  group_by(class) %>% 
  summarise(city_avg = mean(cty)) %>% 
  arrange(desc(city_avg))


#문제3

head(mpg %>% 
        group_by(class) %>% 
        summarise(hwy_avg= mean(hwy)) %>% 
        arrange(desc(hwy_avg)) ,3)


#문제4
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="compact") %>% 
  select(manufacturer,class) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count))
          