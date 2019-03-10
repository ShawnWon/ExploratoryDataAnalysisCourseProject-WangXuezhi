#Reading data
p <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming the columes
names(p) <- c("date","time","GAP","GRP","Vol","GIn","Sub1","Sub2","Sub3")
subp <- subset(p,p$date=="1/2/2007" | p$date =="2/2/2007")

#Converting data type
subp$date <- as.Date(subp$date, format="%d/%m/%Y")
subp$time <- strptime(subp$time, format="%H:%M:%S")
subp[1:1440,"time"] <- format(subp[1:1440,"time"],"2007-02-01 %H:%M:%S")
subp[1441:2880,"time"] <- format(subp[1441:2880,"time"],"2007-02-02 %H:%M:%S")

#Plotting PNG
png('plot3.png')
plot(subp$time,subp$Sub1,type="n",xlab="",ylab="Energy sub metering")
with(subp,lines(time,as.numeric(as.character(Sub1))))
with(subp,lines(time,as.numeric(as.character(Sub2)),col="red"))
with(subp,lines(time,as.numeric(as.character(Sub3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()