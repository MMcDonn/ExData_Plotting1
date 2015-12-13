dat <- fread("./household_power_consumption.txt", na.strings = "?")
dat <- dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

#Newplot 1
plot(dat$DateTime, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Newplot 2
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#Plot All
par(mfrow = c(2,2))
with(dat, plot(DateTime, Global_active_power, type = "l", xlab = "",
               ylab = "Global Active Power (kilowatts)"))
plot(dat$DateTime, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$Sub_metering_2, type = "l", col = "red")
lines(dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col = c("black","red","blue"), cex = 0.4)
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()