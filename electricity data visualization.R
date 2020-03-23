library(tidyverse)
library(ggplot2)
setwd('D:\\��s��(2019.9.23)\\�Ӥ@�W\\RŪ�ѷ|\\project\\data')
data <- read.csv('Statistics on electricity consumption of residential and service industries and institutions in various counties and cities.csv',
                 header=T,fileEncoding = 'UCS-2LE')# ��UCS-2LE�~Ū�o�F
summary(is.na(data))
class(data)
data[2,]
new_data <- data%>% # �~����}
  separate(���,
             sep=c(4,5,7),
             into=c('year','zyear','month','zmonth'))
new_data <- select(new_data,-starts_with('z'))
#data_taipei <- as.data.frame(filter(data,����=='�x�_��'))
#select(data,'����')
#filter(data,����=='�x�_��')
#colnames(data_taipei) <- a
#class(data_taipei)
#a <- colnames(data)
#class(a)
####################################################################

# �ιq����
data[323:2139,][12] <- data[323:2139,][12]*100
data_without_sum <- filter(data,�����ιq����...!=100)
win.graph()
data_without_sum %>% 
  ggplot(aes(x=data_without_sum$���,y=data_without_sum$�����ιq����...,group=����,color=����)) +
  geom_line() + 
  geom_point() + 
  labs(x = "�~��" , y = "�ιq����",title = "�U�����U����ιq����")+
  coord_cartesian(ylim = c(min(data_without_sum$�����ιq����), max(data_without_sum$�����ιq����)))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
  
data_taipei[15:93,][12] <- data_taipei[15:93,][12]*100# 2018�~�}�l�A�ιq����אּ�ʤ���Φ�
summary(data_taipei[,12])
win.graph()
plot(data_taipei$���,data_taipei$�����ιq����,pch=16)

new_data[323:2139,][12] <- new_data[323:2139,][12]*100
new_data_without_sum <- filter(new_data,�����ιq����...!=100)
win.graph()
data_without_sum %>% 
  ggplot(aes(x=data_without_sum$month,y=data_without_sum$�����ιq����,group=����,color=����)) +
  geom_line() + 
  geom_point() + 
  labs(x = "���" , y = "�ιq����",title = "�U�����U����ιq����")+
  coord_cartesian(ylim = c(min(data_without_sum$�����ιq����), max(data_without_sum$�����ιq����)))+
  theme(plot.title = element_text(hjust = 0.5))

colnames(data)
####################################################################

## �U���������ιq����
aa <- 
  group_by(new_data_without_sum,����,month) %>%
  summarise(�����ιq����=mean(�����ιq����...))
aa1 <- 
  group_by(aa,����) %>%
  summarise(�����ιq����=mean(�����ιq����))
order(aa1$�����ιq����)

win.graph()
aa%>%
  ggplot(aes(x=month,y=�����ιq����,group=����,color=����)) +
  geom_line() + 
  geom_point()
# draw 4 largest
data_largest <- filter(data_without_sum,����=='�x�_��'|����=='�s�_��'|����=='�x����'|
                         ����=='������')
bb <- 
  group_by(data_largest,����,month) %>%
  summarise(�����ιq����=mean(�����ιq����...))

win.graph()
bb %>% 
  ggplot(aes(x=month,y=�����ιq����,group=����,color=����)) +
  geom_line() + 
  geom_point() + 
  #coord_cartesian(ylim = c(min(data_largest$�����ιq����), max(data_largest$�����ιq����)))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

# draw 3 opposite
data_opposite <- filter(data_without_sum,����=='�x�n��'|����=='��饫'|����=='���ƿ�')
bbo <- 
  group_by(data_opposite,����,���) %>%
  summarise(�����ιq����=mean(�����ιq����...))

win.graph()
bbo %>% 
  ggplot(aes(x=���,y=�����ιq����,group=����,color=����)) +
  geom_line() + 
  geom_point() + 
  #coord_cartesian(ylim = c(min(data_opposite$�����ιq����), max(data_opposite$�����ιq����)))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

# only one city graph
colnames(data_without_sum)
data_nt <- as.data.frame(filter(data_without_sum,����=='�s�_��'))
win.graph()
data_nt%>%
  ggplot(aes(x=month,y=�����ιq����...,group=year,color=year))+
  geom_line()+
  geom_point()+
  labs(x = "month" , y = "�ιq����",title = "�s�_���U�~����ιq����")+
  theme(plot.title = element_text(hjust = 0.5))
####################################################################

# �A�ȷ~�ιq�q
colnames(data)
win.graph()
data %>% 
  ggplot(aes(x=data$���,y=data$�A�ȷ~������q�q.��.,group=����,color=����)) +
  geom_line() + 
  geom_point() + 
  labs(x = "�~��" , y = "�A�ȷ~�����ιq�q",title = "�U�����U����A�ȷ~�����ιq�q")+
  coord_cartesian(ylim = c(min(data_without_sum$�A�ȷ~������q�q.��.), max(data_without_sum$�A�ȷ~������q�q.��.)))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
## largest 6
cc <- 
  group_by(new_data,����,month) %>%
  summarise(�A�ȷ~�����ιq�q=mean(�A�ȷ~������q�q.��.))
table(cc)
cc1 <- 
  group_by(cc,����)%>%
  summarise(�A�ȷ~�����ιq�q=mean(�A�ȷ~�����ιq�q))
order(dd$�A�ȷ~�����ιq�q)
data_largest <- filter(data,����=='�x�_��'|����=='�s�_��'|����=='�x����'|
                         ����=='������'|����=='��饫'|����=='�x�n��')
win.graph()
data_largest %>% 
  ggplot(aes(x=data_largest$���,y=data_largest$�A�ȷ~������q�q.��.,group=����,color=����)) +
  geom_line() + 
  geom_point() + 
  labs(x = "�~��" , y = "�A�ȷ~�����ιq�q",title = "�U�~��A�ȷ~�����ιq�q--�e����������")+
  coord_cartesian(ylim = c(min(data_without_sum$�A�ȷ~������q�q.��.), max(data_without_sum$�A�ȷ~������q�q.��.)))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
####################################################################

# ���v�ιq�q
colnames(data)
win.graph()
data %>% 
  ggplot(aes(x=data$���,y=data$���v������q�q.��.,group=����,color=����)) +
  geom_line() + 
  geom_point() + 
  labs(x = "�~��" , y = "���v�ιq�q",title = "�U�����U������v�ιq�q")+
  coord_cartesian(ylim = c(min(data_without_sum$���v������q�q.��.), max(data_without_sum$���v������q�q.��.)))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.text.x = element_text(angle=65, vjust=0.6))






















