library(data.table)
library(dplyr)

plot3 <- function() {
  cl <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  usagedata <- fread("household_power_consumption.csv", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses = cl)
  daydata <- subset(usagedata, usagedata$Date %in% c("1/2/2007", "2/2/2007"))
  daydata$DateTime <- as.POSIXct(strptime(paste(daydata$Date,daydata$Time), "%d/%m/%Y %H:%M:%S"))
  meterNames <- colnames(daydata)[7:9]
  
  png(file="plot3.png")
  plot(daydata$DateTime, daydata$Sub_metering_1, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
  plot(daydata$DateTime, daydata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
  lines(daydata$DateTime,daydata$Sub_metering_2, col="red")
  lines(daydata$DateTime,daydata$Sub_metering_3, col="blue")
  legend("topright", lty=1, meterNames, col=c("black","red","blue"))
  dev.off()
}
