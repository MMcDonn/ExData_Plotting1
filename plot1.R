dat <- fread("./household_power_consumption.txt", na.strings = "?")
dat <- dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]
hist(dat$Global_active_power, col = "red", xlab = ("Global Active Power (kilowatts)"),
     main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()