setwd("E:/r/4.exploratory")
Sys.setlocale("LC_TIME", "English")
#read the data.The data set is large and we only read the data from the dates 2007-02-01 and 2007-02-02 only. 
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date ='1/2/2007' or Date ='2/2/2007'", header = TRUE, sep = ";")

x <-paste(data$Date,data$Time)
y <- strptime(x, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(data,{
#topleft 
plot(y,data$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
#top right
plot(y,data$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")
#bottom left
plot(y,data$Sub_metering_1,type = "l",col="black",ylim = c(0,30),ylab = "Energy sub metering",xlab = "")
par(new=TRUE)
plot(y,data$Sub_metering_2,type = "l",col="red",ylim = c(0,30),ylab = " ",xlab = "")
par(new=TRUE)
plot(y,data$Sub_metering_3,type = "l",col="blue",ylim = c(0,30),ylab = " ",xlab = "")
legend("topright", lty = c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#bottom right
plot(y,data$Global_reactive_power,type = "l",xlab = "datetime")
})
dev.off()
