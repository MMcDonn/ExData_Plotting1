dat <- fread("./household_power_consumption.txt", na.strings = "?")
dat <- dat <- dat[which(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
with(dat, plot(DateTime, Global_active_power, type = "l", xlab = "", 
               ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()