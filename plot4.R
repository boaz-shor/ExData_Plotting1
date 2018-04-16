## define constants
endDate <- as.Date("2007-02-02", format = "%Y-%m-%d")
startDate <- as.Date("2007-02-01", format = "%Y-%m-%d")
yLable_plot1 <- "global active power (kilowatts)"
xLable_plot2 <- "datetime"
yLable_plot2 <- "Voltage"
yLable_plot3 <- "Energy sub metering"
yLable_plot4 <- "global_reactive_power"
xLable_plot4 <- "datetime"
##read the data
data <- read.csv("data/household_power_consumption.txt",header = T, sep = ";", na.strings = "?",stringsAsFactors=FALSE)
##format dates 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset by relevant dates 
relevantDates <- subset(data, Date <= endDate & Date >= startDate)
## concat col date with col time to careate a new col that represents date with time
relevantDates$datetime<- strptime(paste(relevantDates$Date, relevantDates$Time), "%Y-%m-%d %H:%M:%S")
## define 4 plots in one
par(mfrow = c(2, 2))
## first plot  - same as plot2.png
par(mar = c(4,4,1,1))
#par(oma = c(0.5,0.5,0.5,0.5))
par(cex.lab = 0.75)
plot(relevantDates$datetime,relevantDates$Global_active_power, type = "l",xlab = "", ylab = yLable_plot1)
##second plot  - datetime vs Voltage
par(cex.lab = 0.75)
plot(relevantDates$datetime,relevantDates$Voltage, type = "l",xlab = xLable_plot2, ylab = yLable_plot2)
##third plot - same as plot3.png
plot(relevantDates$datetime, relevantDates$Sub_metering_1, type = "l", ylab = yLable_plot3, xlab = "",col = "black")
lines(relevantDates$datetime, relevantDates$Sub_metering_2, type="l", col="red")
lines(relevantDates$datetime, relevantDates$Sub_metering_3, type="l", col="blue")
op <- par(cex = 0.2)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
## forth plot - datetime vs global
par(cex = 0.75)
#par(cex.lab = 0.75)
par(cex.lab = 0.75)
plot(relevantDates$datetime,relevantDates$Global_reactive_power, type = "l",xlab = xLable_plot4, ylab = yLable_plot4)
# save the histogram to file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()