setwd("E:/r/4.exploratory")
Sys.setlocale("LC_TIME", "English")
#read the data.The data set is large and we only read the data from the dates 2007-02-01 and 2007-02-02 only. 
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date ='1/2/2007' or Date ='2/2/2007'", header = TRUE, sep = ";")

#plot1
png("plot1.png", width = 480, height = 480)
with(data,hist(Global_active_power,main = "Global Active Power",xlim = c(0,6),ylim = c(0,1200),col = "red",xlab = "Global Active Power (kilowatts)"))
dev.off()

