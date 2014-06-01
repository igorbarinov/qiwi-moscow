#data
#reading 100 from 100k.csv, with separator
#you should save 100k.csv without BOM before importing
#records <- read.csv("data/100k.csv",sep ="|", header= TRUE, nrows=100)
#reading diapazons of payments (min,max)
diapazon <- read.csv("catalog/diapazon.csv",sep=",", header=TRUE)
#reading categories of providers
providers <- read.csv("catalog/categories.csv",sep="|",header=TRUE)


#reading data from one day from 10mln

#counting 
a <- count(r, vars = "V2")
#finding top 100 terminals 
a[order(a$freq, decreasing=T), ][1:100, ]
#subsetting with 416 records per day
r.1 <- subset(r, r$V4 == 9234573 )
#plotting 
hist(as.numeric(strftime(r.1$V1, "%H")), breaks=24)



# experiment

#в 0 часов
r.0 <- r.full[r.full$hour == 0,]
#в 1 час
r.1 <- r.full[r.full$hour == 1,]
# группировка 
count(df=r.0,var="date")
# среднее кол-во транзакций в час для 0 часов
mean(count(df=r.0,var="date")$freq)
# среднее кол-во транзакций в день по часам
k <- c()
for (i in 0:23) {
    r.temp <- r.full[r.full$hour == i,]
    k[i] <- median(count(df=r.temp,var="date")$freq)
    print (k[i])
}
barplot(k)

#сколько потеряли в транзакциях за день, в среднем 369
sum(k)


# сколько за день и мы тут нашли плохой день
a <- count(r, vars = "as.Date(V1)")



r <- read.csv("data/10mln-0213_2.csv",sep=";", header=F)
hour <- as.numeric(strftime(r$V1, "%H"))
date <- as.Date(r$V1)
r.full <- data.frame(r, hour, date)
