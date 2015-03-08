## Read in Data, convert column classes and filter dates
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Timestamp <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S", tz="UTC")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
newdata <- data[data[,"Date"]<="2007-02-02",]
finaldata <- newdata[newdata[,"Date"]>="2007-02-01",]
finaldata$Global_active_power.n <- as.numeric(as.character(finaldata$Global_active_power))

#set output to PNG and plot graph
png(filename = "Plot3.png", width=480, height=480, unit="px")

plot(finaldata$Timestamp, finaldata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finaldata$Timestamp, finaldata$Sub_metering_2, col="red")
lines(finaldata$Timestamp, finaldata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"), lwd=par("lwd"))

dev.off()

