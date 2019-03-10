#Reading data
p <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming the columes
names(p) <- c("date","time","GAP","GRP","Vol","GIn","Sub1","Sub2","Sub3")


#Subsetting data
subp <- subset(p,p$date=="1/2/2007" | p$date =="2/2/2007")

#Plot PNG
png('plot1.png')
hist(as.numeric(as.character(subp$GAP)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
