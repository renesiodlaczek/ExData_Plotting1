# Read data in
data <- read.table("data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$datetime <- with(data, paste(Date, Time, sep = "-"))
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y-%H:%M:%S")


# Create and save plot
Sys.setlocale("LC_TIME", "C")

png("plot3.png", width = 480, height = 480)

plot(data$datetime, 
     data$Sub_metering_1, 
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = "solid")
        
dev.off()
