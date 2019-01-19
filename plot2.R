setwd("E:/r/4.exploratory")
Sys.setlocale("LC_TIME", "English")
#read the data.The data set is large and we only read the data from the dates 2007-02-01 and 2007-02-02 only. 
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date ='2/1/2007' or Date ='2/2/2007'", header = TRUE, sep = ";")

x <-paste(data$Date,data$Time)
y <- strptime(x, "%m/%d/%Y %H:%M:%S")
#plot2
png("plot2.png", width = 480, height = 480)

plot(y,data$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()
