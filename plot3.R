#Code for creating plot3 and saving it as png file

Fulldata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
dataplot<-subset(Fulldata, Date=="1/2/2007"| Date=="2/2/2007")
dataplot$Date <- as.Date(dataplot$Date, format="%d/%m/%Y")
dataplot$Time <- strptime(dataplot$Time, format="%H:%M:%S")
dataplot[1:1440,"Time"] <- format(dataplot[1:1440,"Time"],"2007-02-01 %H:%M:%S")
dataplot[1441:2880,"Time"] <- format(dataplot[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
dataplot$Sub_metering_1 <-as.numeric(as.character(dataplot$Sub_metering_1))
dataplot$Sub_metering_2 <-as.numeric(as.character(dataplot$Sub_metering_2))
dataplot$Sub_metering_3 <-as.numeric(as.character(dataplot$Sub_metering_3))
plot(dataplot$Time, dataplot$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dataplot$Time, dataplot$Sub_metering_1, col="black")
lines(dataplot$Time, dataplot$Sub_metering_2, col="red")
lines(dataplot$Time, dataplot$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
