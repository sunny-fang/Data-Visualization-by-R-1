library(tidyverse)
library(zoo)
setwd('D:\\��s��(2019.9.23)\\�Ӥ@�W\\RŪ�ѷ|\\project\\data')
raw_data <- read.csv('�x�W�q�O���q_�L�h�q�O�ѻݸ�T.csv', header = T, fileEncoding = 'UCS-2LE')
summary(is.na(raw_data))
raw_data[is.na(raw_data)] <- 0
colnames <- colnames(raw_data)
raw_data1 <- raw_data%>%
  separate(���,sep=c(4,6),into=c('year','month','date'))
raw_data2 <- group_by(raw_data1,month)%>%
  lapply(raw_data1,mean)

zoo(raw_data1[, c('year')], raw_data1$month)

zoo(mydf[, c('a', 'b')], mydf$date)


class(colnames)














