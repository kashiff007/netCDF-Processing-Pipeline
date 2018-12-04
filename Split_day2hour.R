library(Interpol.T)

date<-date.time(day.begin="01/04/2020", day.end="31/07/2020", date.format= "d/m/y") # generate Date hour

tempd <- read.table("result.txt", sep="\t", header=FALSE)  #from python program CIBSE Algorithm

x <- data.frame(date$year ,date$month, date$day, date$hour, tempd$V2)


y <- data.frame(x$year,x$month, x$day)
y <- unique(y)
write.table(x, file="2020_Rabat_1May-31Jul.txt",sep="\t")

pdf(file="2020_Rabat_1May-31Jul.pdf",height=5, width=40)
plot(tempd$V2, type="l", xaxt = "n", ylab="Temp °C", xlab="Time")
axis(1, at=c(1,720,1464,2208,2928), labels=c("01-04-2020", "01-05-2020", "01-06-2020","01-07-2020", "31-07-2020"))
dev.off()
