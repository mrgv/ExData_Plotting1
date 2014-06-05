
t <- read.csv("household_power_consumption.txt", 
              sep = ";",
              colClasses = c("character", "character", rep("numeric", 7)),
              na.strings = c("?"))
t$DateTime <- as.POSIXct(paste(t$Date, t$Time), format="%d/%m/%Y %H:%M:%S")
#t[, 1] <- as.Date(t[, 1], format = "%d/%m/%Y")
#t[, 2] <- as.
t <- subset(t, t$Date >= "2007-02-01" & t$Date <= "2007-02-02")

par(pch = " ")
plot(t$DateTime, t$Sub_metering_1, 
     xlab="", ylab="Energy sub metering")
lines(t$DateTime, t$Sub_metering_1, col = "Black")
lines(t$DateTime, t$Sub_metering_2, col = "Red")
lines(t$DateTime, t$Sub_metering_3, col = "Blue")
legend("topright", lty=1, col=c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480, res=50)
dev.off()
