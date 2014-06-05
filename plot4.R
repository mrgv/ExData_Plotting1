
t <- read.csv("household_power_consumption.txt", 
              sep = ";",
              colClasses = c("character", "character", rep("numeric", 7)),
              na.strings = c("?"))
t$DateTime <- as.POSIXct(paste(t$Date, t$Time), format="%d/%m/%Y %H:%M:%S")
#t[, 1] <- as.Date(t[, 1], format = "%d/%m/%Y")
#t[, 2] <- as.
t <- subset(t, t$Date >= "2007-02-01" & t$Date <= "2007-02-02")


png(file = "plot4.png", width = 480, height = 480)

par(pch = " ", mfcol = c(2,2))

#--PLOT2 TOP_LEFT
par(pch = " ")
plot(t$DateTime, t$Global_active_power, 
     xlab="", ylab="Global Active Power")
lines(t$DateTime, t$Global_active_power)

#-- PLOT3 BOTT_LEFT
plot(t$DateTime, t$Sub_metering_1, 
     xlab="", ylab="Energy sub metering")
lines(t$DateTime, t$Sub_metering_1, col = "Black")
lines(t$DateTime, t$Sub_metering_2, col = "Red")
lines(t$DateTime, t$Sub_metering_3, col = "Blue")
legend("topright", lty=1, col=c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

#-- NEW PLOT TOP_RIGHT
plot(t$DateTime, t$Voltage,
     xlab="datetime", ylab="Voltage")
lines(t$DateTime, t$Voltage)

#-- NEW PLOT BOTT_RIGHT
plot(t$DateTime, t$Global_reactive_power,
     xlab="datetime", ylab="Global_reactive_power")
lines(t$DateTime, t$Global_reactive_power)

#dev.copy(png, file = "plot4.png", width = 480, height = 480, res=50)
dev.off()
