## define constants
endDate <- as.Date("2007-02-02", format = "%Y-%m-%d")
startDate <- as.Date("2007-02-01", format = "%Y-%m-%d")
title <- "Global Active Power"
xLable <- "global active power (kilowatts)"
##read the data
data <- read.csv("data/household_power_consumption.txt",header = T, sep = ";", na.strings = "?",stringsAsFactors=FALSE)
##format dates 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset by relevant dates 
relevantDates <- subset(data, Date <= endDate & Date >= startDate)
##create the histogram 
hist(relevantDates$Global_active_power, main = title,col = "red",xlab = xLable, ylim = c(0,1200))
# save the histogram to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()