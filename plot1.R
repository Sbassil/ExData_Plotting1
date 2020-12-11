#Code for creating plot 1 and saving it as png file

Fulldata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
dataplot<-subset(Fulldata, Date=="1/2/2007"| Date=="2/2/2007")
dataplot$Global_active_power <-as.numeric(as.character(dataplot$Global_active_power))
hist(dataplot$Global_active_power,  col="red", xlab="Global Active Powwer (kilowatts)",
     main="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()