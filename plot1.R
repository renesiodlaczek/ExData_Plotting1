# Read data in
data <- read.table("data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$datetime <- with(data, paste(Date, Time, sep = "-"))
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y-%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#data$Time <- strptime(data$Time, format = "%H:%M:%S")


# Create plot
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")


# Save plot
dev.copy(device = png, file = "plot1.png", width = 480, height = 480)
dev.off()
