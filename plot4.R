library(data.table)
library(dplyr)

plot4 <- function() {
  cl <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  usagedata <- fread("household_power_consumption.csv", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses = cl)
  daydata <- subset(usagedata, usagedata$Date %in% c("1/2/2007", "2/2/2007"))
  daydata$DateTime <- as.POSIXct(strptime(paste(daydata$Date,daydata$Time), "%d/%m/%Y %H:%M:%S"))
  meterNames <- colnames(daydata)[7:9]
  
  png(file="plot4.png")
  par(mfrow=c(2,2))
  with(daydata,{
    plot(daydata$DateTime, daydata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
    plot(daydata$DateTime, daydata$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
    plot(daydata$DateTime, daydata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(daydata$DateTime,daydata$Sub_metering_2, col="red")
    lines(daydata$DateTime,daydata$Sub_metering_3, col="blue")
    legend("topright", lty=1, meterNames, col=c("black","red","blue"))
    plot(daydata$DateTime, daydata$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
  })
  dev.off()
}
