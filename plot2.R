
t <- read.csv("household_power_consumption.txt", 
              sep = ";",
              colClasses = c("character", "character", rep("numeric", 7)),
              na.strings = c("?"))
t$DateTime <- as.POSIXct(paste(t$Date, t$Time), format="%d/%m/%Y %H:%M:%S")
t <- subset(t, t$DateTime >= as.POSIXct("2007-02-01") & 
                t$DateTime < as.POSIXct("2007-02-03"))
#t[, 1] <- as.Date(t[, 1], format = "%d/%m/%Y")
#t <- subset(t, t$Date >= "2007-02-01" & t$Date <= "2007-02-02")

par(pch = " ")
plot(t$DateTime, t$Global_active_power, 
     xlab="", ylab="Global Active Power (kilowatts)")
lines(t$DateTime, t$Global_active_power)

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
