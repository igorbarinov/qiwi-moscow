#loading time series data
library(zoo)
library(xts)
#loading plyr for count() funtion
library("plyr")
#отправка писем
library("mailR")


#установка рабочей директории
setwd("/Users/bis/hackathon/qiwi-moscow")

#загрузка датасета
r <- read.csv("data/9240857.csv",sep="|", header=F)
hour <- as.numeric(strftime(r$V1, "%H"))
date <- as.Date(r$V1)
r.full <- data.frame(r, hour, date)
















