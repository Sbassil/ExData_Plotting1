#Code for creating plot 2 and saving it in png file

Fulldata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
dataplot<-subset(Fulldata, Date=="1/2/2007"| Date=="2/2/2007")
dataplot$Global_active_power <-as.numeric(as.character(dataplot$Global_active_power))
dataplot$Date <- as.Date(dataplot$Date, format="%d/%m/%Y")
dataplot$Time <- strptime(dataplot$Time, format="%H:%M:%S")
dataplot[1:1440,"Time"] <- format(dataplot[1:1440,"Time"],"2007-02-01 %H:%M:%S")
dataplot[1441:2880,"Time"] <- format(dataplot[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(dataplot$Time, dataplot$Global_active_power, type="l",  xlab="", ylab="Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()