library(data.table)
library(dplyr)

plot1 <- function() {
  cl <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  usagedata <- fread("household_power_consumption.csv", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses = cl)
  daydata <- subset(usagedata, usagedata$Date %in% c("1/2/2007", "2/2/2007"))

  png(file="plot1.png")
  hist(daydata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}
