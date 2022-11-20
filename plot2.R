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
png("plot2.png", width = 480, height = 480)

plot(data$datetime, 
     data$Global_active_power, 
     type = "lines",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()





