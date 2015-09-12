# Setting Working Directory
setwd("C:/Users/Gary/Documents/DataScience/exdata-week1")

# Loading Data
myRawData <- "household_power_consumption.txt"
myData <- read.table(myRawData, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
myData$Time <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myDates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
myData <- subset(myData, Date %in% myDates)

# Generating Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(myData$Time, myData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(myData$Time, myData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(myData$Time, myData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(myData$Time, myData$Sub_metering_2, type="l", col="red")
lines(myData$Time, myData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
plot(myData$Time, myData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()