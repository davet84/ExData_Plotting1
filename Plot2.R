## Read in Data, convert column classes and filter dates
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Timestamp <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S", tz="UTC")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
newdata <- data[data[,"Date"]<="2007-02-02",]
finaldata <- newdata[newdata[,"Date"]>="2007-02-01",]
finaldata$Global_active_power.n <- as.numeric(as.character(finaldata$Global_active_power))

#set output to PNG and plot graph
png(filename = "Plot2.png", width=480, height=480, unit="px")
plot(finaldata$Timestamp, finaldata$Global_active_power.n, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

