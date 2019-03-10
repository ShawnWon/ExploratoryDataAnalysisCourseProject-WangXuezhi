#Reading data
p <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming the columes
names(p) <- c("date","time","GAP","GRP","Vol","GIn","Sub1","Sub2","Sub3")

#subsetting data
subp <- subset(p,p$date=="1/2/2007" | p$date =="2/2/2007")


# Converting data type of date/time 
subp$date <- as.Date(subp$date, format="%d/%m/%Y")
subp$time <- strptime(subp$time, format="%H:%M:%S")
subp[1:1440,"time"] <- format(subp[1:1440,"time"],"2007-02-01 %H:%M:%S")
subp[1441:2880,"time"] <- format(subp[1441:2880,"time"],"2007-02-02 %H:%M:%S")

#Plotting PNG
png('plot2.png')
plot(subp$time,as.numeric(as.character(subp$GAP)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
