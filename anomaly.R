# сравним с аномальным 
anomalityFinder <- function (d="2013-01-21")
{
    #считаем для дня
    j <<- c()
    for (i in 0:23) {
        r.temp <- r.full[r.full$hour == i & r.full$date == d ,]
        
        j[i] <- median(count(df=r.temp,var="date")$freq)
        #print (j[i])
    }
    #считаем для всех. Для той даты это 37 
    sum(j,na.rm=TRUE)
    #pdf("report.pdf")
    cairo_pdf(filename="report.pdf",family="Helvetica",onefile=TRUE)
    
    k <- c()
    for (i in 0:23) {
        r.temp <- r.full[r.full$hour == i,]
        k[i] <- median(count(df=r.temp,var="date")$freq)
        #print (k[i])
    }
    
    barplot(k,xlab="Часы",ylab="Транзакции",axes=T,axisnames=T,col="gray",ylim=c(0,35))
    par(new=TRUE)
    barplot(j,xlab="Часы",ylab="Транзакции",axes=T,axisnames=T,col="yellow",ylim=c(0,35), main=d, sub="Операционный день")
    # примерно 83000 руб оборота не получено
    dev.off()
    barplot(k,xlab="Часы",ylab="Транзакции",axes=T,axisnames=T,col="gray",ylim=c(0,35))
    par(new=TRUE)
    barplot(j,xlab="Часы",ylab="Транзакции",axes=T,axisnames=T,col="yellow",ylim=c(0,35), main=d, sub="Операционный день")
}
anomalityFinder()
