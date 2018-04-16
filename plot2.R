## define constants
endDate <- as.Date("2007-02-02", format = "%Y-%m-%d")
startDate <- as.Date("2007-02-01", format = "%Y-%m-%d")
yLable <- "global active power (kilowatts)"
##read the data
data <- read.csv("data/household_power_consumption.txt",header = T, sep = ";", na.strings = "?",stringsAsFactors=FALSE)
##format dates 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##subset by relevant dates 
relevantDates <- subset(data, Date <= endDate & Date >= startDate)
## concat col date with col time to careate a new col that represents date with time
relevantDates$datetime<- strptime(paste(relevantDates$Date, relevantDates$Time), "%Y-%m-%d %H:%M:%S")
##plot the data 
plot(relevantDates$datetime,relevantDates$Global_active_power, type = "l",xlab = "", ylab = yLable)
# save the histogram to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()