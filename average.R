# сколько за день и мы тут нашли плохой день
a <- count(r, vars = "as.Date(V1)")

# распечатать a
a

# показать что есть аномалия
barplot(a$freq)

# построение эталонного
k <- c()
for (i in 0:23) {
    r.temp <- r.full[r.full$hour == i,]
    k[i] <- median(count(df=r.temp,var="date")$freq)
    #print (k[i])
}
barplot(k,xlab="Часы",ylab="Транзакции",axes=T,axisnames=T,col=3, main="Среднее значение")
