# Read data in
data <- read.table("data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$datetime <- with(data, paste(Date, Time, sep = "-"))
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y-%H:%M:%S")


# Set options
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Create first plot
plot(data$datetime, 
     data$Global_active_power, 
     type = "lines",
     xlab = "",
     ylab = "Global Active Power")

# Create second plot
plot(data$datetime, 
     data$Voltage, 
     type = "lines",
     xlab = "datetime",
     ylab = "Voltage")

# Create third plot
plot(data$datetime, 
     data$Sub_metering_1, 
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright",
       bty = "n",
       lty = "solid",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       
# Create forth plot
plot(data$datetime, 
     data$Global_reactive_power, 
     type = "lines",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()


