# rmarkdown:https://knowlab.wordpress.com/2016/12/05/%E4%BB%A5-r-markdown-%E8%BC%95%E9%AC%86%E7%B7%A8%E8%BC%AF%E8%B3%87%E6%96%99%E5%88%86%E6%9E%90%E5%A0%B1%E5%91%8A%EF%BC%88%E4%B8%8A%EF%BC%89/
library(ggplot2)
library(highcharter)
library(lattice)
library(tidyverse)
setwd('D:\\��s��(2019.9.23)\\�Ӥ@�W\\RŪ�ѷ|\\project\\data')
data <- read.csv('sum of supply by month.csv',header=T,fileEncoding = 'UCS-2LE')
data[is.na(data)] <- 0
select(data,starts_with('�֤G'))
win.graph()
highchart()%>%
  hc_title(text='�֯����')%>%
  hc_xAxis(categories=data$date)%>%
  hc_add_series(name='�s�_��2-1',data=data$'�֤G1�U�`',color='#3D4490')%>%
  hc_add_series(name='�s�_��2-2',data=data$'�֤G2�U�`',color='#5994FF')%>%
  hc_add_series(name='�̪F��3-1',data=data$�֤T1,color='#FF5126')%>%
  hc_add_series(name='�̪F��3-2',data=data$�֤T2,color='#FD9A28')

c <- highchart()%>%
  hc_title(text='�x�����O����')%>%
  hc_xAxis(categories=data$date)%>%
  hc_add_series(name='�x��1',data=data$'�x��1')%>%
  hc_add_series(name='�x��2',data=data$'�x��2')%>%
  hc_add_series(name='�x��3',data=data$'�x��3')%>%
  hc_add_series(name='�x��4',data=data$'�x��4')%>%
  hc_add_series(name='�x��5',data=data$'�x��5')%>%
  hc_add_series(name='�x��6',data=data$'�x��6')%>%
  hc_add_series(name='�x��7',data=data$'�x��7')%>%
  hc_add_series(name='�x��8',data=data$'�x��8')%>%
  hc_add_series(name='�x��9',data=data$'�x��9')%>%
  hc_add_series(name='�x��10',data=data$'�x��10')
c

#############################################################
data_require <- read.csv('Statistics on electricity consumption of residential and service industries and institutions in various counties and cities.csv',header = T,fileEncoding = 'UCS-2LE')
require_sum <- data_require[data_require$����=='�X�p',]
require_sum1 <- require_sum[1:21,]

require_sum1 <- rev(require_sum1$���)

require_sum1[order(require_sum1$���),]

d <- highchart()%>%
  hc_title(text='�������O����')%>%
  hc_xAxis(categories=data$date)%>%
  hc_add_series(name='���F1',data=data['���F1'])%>%
  hc_add_series(name='���F2',data=data['���F2'])%>%
  hc_add_series(name='���F3',data=data['���F3'])%>%
  hc_add_series(name='���F4',data=data['���F4'])%>%
  hc_add_series(name='�j�L1',data=data['�j�L1'])%>%
  hc_add_series(name='�j�L2',data=data['�j�L2'])
d
highchart()%>%
  hc_title(text='�������O����')%>%
  hc_xAxis(categories=data$date)%>%
  hc_add_series(name='���F1',data=data$���F1)%>%
  hc_add_series(name='���F2',data=data$���F2)%>%
  hc_add_series(name='���F3',data=data$���F3)%>%
  hc_add_series(name='���F4',data=data$���F4)%>%
  hc_add_series(name='�j�L1',data=data$�j�L1)%>%
  hc_add_series(name='�j�L2',data=data$�j�L2)

highchart()%>%
  hc_title(text='�`�ѵ��q(MW)')%>%
  hc_xAxis(categories=new_data$date)%>%
  hc_add_series(name='�`�ѹq�q',data=new_data$sum,color = '#155FCF')


setwd('D:\\��s��(2019.9.23)\\�Ӥ@�W\\RŪ�ѷ|\\project\\data\\usage')
data_usage <- read.csv('Usage.csv')
colnames(data_usage)
group_by(data_usage,�~���)%>%
  summarise(mean=mean(X25��X.�q�O�X�p.��q�׼�.����.))
sum_usage <- aggregate(data_usage$X25��X.�q�O�X�p.��q�׼�.����.,by=list(data_usage$�~���),FUN=sum)
class(sum_usage)





