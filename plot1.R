
t <- read.csv("household_power_consumption.txt", 
              sep = ";",
              colClasses = c("character", "character", rep("numeric", 7)),
              na.strings = c("?"))
t$DateTime <- as.POSIXct(paste(t$Date, t$Time), format="%d/%m/%Y %H:%M:%S")
t[, 1] <- as.Date(t[, 1], format = "%d/%m/%Y")
t <- subset(t, t$Date >= "2007-02-01" & t$Date <= "2007-02-02")

hist(t$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "Red")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
