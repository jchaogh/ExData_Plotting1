library(data.table)
library(dplyr)

plot2 <- function() {
  cl <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  usagedata <- fread("household_power_consumption.csv", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses = cl)
  daydata <- subset(usagedata, usagedata$Date %in% c("1/2/2007", "2/2/2007"))
  daydata$DateTime <- as.POSIXct(strptime(paste(daydata$Date,daydata$Time), "%d/%m/%Y %H:%M:%S"))

  png(file="plot2.png")
  plot(daydata$DateTime, daydata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}
