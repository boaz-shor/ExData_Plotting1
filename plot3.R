## define constants
endDate <- as.Date("2007-02-02", format = "%Y-%m-%d")
startDate <- as.Date("2007-02-01", format = "%Y-%m-%d")
yLable <- "Energy sub metering"
##read the data
data <- read.csv("data/household_power_consumption.txt",header = T, sep = ";", na.strings = "?",stringsAsFactors=FALSE)
##format dates 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset by relevant dates 
relevantDates <- subset(data, Date <= endDate & Date >= startDate)
## concat col date with col time to careate a new col that represents date with time
relevantDates$datetime<- strptime(paste(relevantDates$Date, relevantDates$Time), "%Y-%m-%d %H:%M:%S")
##plot the data 
plot(relevantDates$datetime, relevantDates$Sub_metering_1, type = "l", ylab = yLable, xlab = "",col = "black")
lines(relevantDates$datetime, relevantDates$Sub_metering_2, type="l", col="red")
lines(relevantDates$datetime, relevantDates$Sub_metering_3, type="l", col="blue")
op <- par(cex = 0.5)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
# save the histogram to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
