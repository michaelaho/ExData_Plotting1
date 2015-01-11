# Import data
library(datasets)
library(sqldf)

setwd("C:/_ECB work/Coursera/Exploratory Data Analysis/Project 1/")
dataFile <- c("exdata-data-household_power_consumption/household_power_consumption.txt")

data <- read.csv.sql(file=dataFile, sep=";", header=TRUE,  sql="select * from file where Date in ('1/2/2007','2/2/2007')",  stringsAsFactors=FALSE)

closeAllConnections()
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 


plot(data$DateTime, data$Sub_metering_1, type = "l", xlab="",ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2,  col = "red")
lines(data$DateTime, data$Sub_metering_3,  col = "blue")

legend( x="topright", 
      legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_2"), 
        col=c("black","red","blue"), lwd=1,   merge=FALSE )



png("plot3.png",width=480, height=480)

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab="",ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2,  col = "red")
lines(data$DateTime, data$Sub_metering_3,  col = "blue")

legend( x="topright", 
        legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_2"), 
        col=c("black","red","blue"), lwd=1,   merge=FALSE )

dev.off()

