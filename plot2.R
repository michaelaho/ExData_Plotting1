# Import data
library(sqldf)

setwd("C:/_ECB work/Coursera/Exploratory Data Analysis/Project 1/")
dataFile <- c("exdata-data-household_power_consumption/household_power_consumption.txt")

data <- read.csv.sql(file=dataFile, sep=";", header=TRUE,  sql="select * from file where Date in ('1/2/2007','2/2/2007')",  stringsAsFactors=FALSE)

closeAllConnections()
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 


plot(data$DateTime, data$Global_active_power, type = "l", xlab="",ylab = "Global Active Power (kilowatts)")

png("plot2.png",width=480, height=480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()


