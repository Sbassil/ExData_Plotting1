
Fulldata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
dataplot<-subset(Fulldata, Date=="1/2/2007"| Date=="2/2/2007")
dataplot$Global_active_power <-as.numeric(as.character(dataplot$Global_active_power))
dataplot$Date <- as.Date(dataplot$Date, format="%d/%m/%Y")
dataplot$Time <- strptime(dataplot$Time, format="%H:%M:%S")
dataplot[1:1440,"Time"] <- format(dataplot[1:1440,"Time"],"2007-02-01 %H:%M:%S")
dataplot[1441:2880,"Time"] <- format(dataplot[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
dataplot$Global_active_power <-as.numeric(as.character(dataplot$Global_active_power))
dataplot$Voltage <-as.numeric(as.character(dataplot$Voltage))
dataplot$Sub_metering_1 <-as.numeric(as.character(dataplot$Sub_metering_1))
dataplot$Sub_metering_2 <-as.numeric(as.character(dataplot$Sub_metering_2))
dataplot$Sub_metering_3 <-as.numeric(as.character(dataplot$Sub_metering_3))
dataplot$Global_reactive_power <-as.numeric(as.character(dataplot$Global_reactive_power))

par(mfrow=c(2,2))
plot(dataplot$Time, dataplot$Global_active_power, type="l",  xlab="", ylab="Global Active Power")
plot(dataplot$Time, dataplot$Voltage, type="l",  xlab="datetime", ylab="Voltage")
plot(dataplot$Time, dataplot$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dataplot$Time, dataplot$Sub_metering_1, col="black")
lines(dataplot$Time, dataplot$Sub_metering_2, col="red")
lines(dataplot$Time, dataplot$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5)
plot(dataplot$Time, dataplot$Global_reactive_power, type="l",  xlab="datetime", ylab=" Global_reactive_power")


dev.copy(png, file="plot4.png")
dev.off()

