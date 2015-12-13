dat <- fread("./household_power_consumption.txt", na.strings = "?")
dat <- dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$DateTime, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col = c("black","red","blue"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()