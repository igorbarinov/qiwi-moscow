#loading time series data
library(zoo)
library(xts)
#loading plyr for count() funtion
library("plyr")

#set working dir
setwd("/Users/bis/hackathon/qiwi-moscow")


#data
#reading 100 from 100k.csv, with separator
#you should save 100k.csv without BOM before importing
#records <- read.csv("data/100k.csv",sep ="|", header= TRUE, nrows=100)
#reading diapazons of payments (min,max)
diapazon <- read.csv("catalog/diapazon.csv",sep=",", header=TRUE)
#reading categories of providers
providers <- read.csv("catalog/categories.csv",sep="|",header=TRUE)


#reading data from one day from 10mln
r <- read.csv("data/10mln-0213_2.csv",sep=";", header=F)
#counting 
a <- count(r, vars = "V2")
#finding top 100 terminals 
a[order(a$freq, decreasing=T), ][1:100, ]
#subsetting with 416 records per day
r.1 <- subset(r, r$V4 == 9234573 )
#plotting 
hist(as.numeric(strftime(r.1$V1, "%H")), breaks=24)



# experiment

r <- read.csv("data/9240857.csv",sep="|", header=F)
# count by date 
a <- count(r, vars = "as.Date(V1)")
#aggregate by date
r.1 <- aggregate(r$V2 ~ r$V3, FUN = length)








