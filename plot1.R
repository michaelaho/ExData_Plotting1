# Import data
library(datasets)
library(sqldf)

setwd("C:/_ECB work/Coursera/Exploratory Data Analysis/Project 1/")
dataFile <- c("C:/_ECB work/Coursera/Exploratory Data Analysis/Project 1/exdata-data-household_power_consumption/household_power_consumption.txt")

data <- read.csv.sql(
  file=dataFile, sep=";", header=TRUE,
  sql="select * from file where Date in ('1/2/2007','2/2/2007')",
  stringsAsFactors=FALSE)

closeAllConnections()
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

# Create plot
hist(data$Global_active_power, breaks = 12,   
     density = NULL, angle = 45,  col = "red", border = NULL,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

png("plot1.png",width=480, height=480)
hist(data$Global_active_power, breaks = 12,   
     density = NULL, angle = 45,  col = "red", border = NULL,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

