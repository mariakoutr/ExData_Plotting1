plot4<- function(){
        datael <- read.table("./household_power_consumption.txt", 
                             stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        datael$Date <- as.Date(datael$Date, format = "%d/%m/%Y")
        datael <- datael[datael$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
        datael$Global_active_power <- as.numeric(datael$Global_active_power)
        datetime = as.POSIXct(paste(datael$Date, datael$Time))
        datael2 <- cbind(datael, datetime)
        
        datael2$Global_active_power <- as.numeric(datael2$Global_active_power)
        datael2$Global_reactive_power <- as.numeric(datael2$Global_reactive_power)
        datael2$Sub_metering_1 <- as.numeric(datael2$Sub_metering_1)
        datael2$Sub_metering_2 <- as.numeric(datael2$Sub_metering_2)
        datael2$Sub_metering_3 <- as.numeric(datael2$Sub_metering_3)
        datael2$Voltage <- as.numeric(datael2$Voltage)
        
        png("plot4.png", width=480, height=480)
        par(mfrow = c(2,2))
        
        plot(datael2$Global_active_power ~ datael2$datetime, type="l", xlab= "", 
             ylab="Global Active Power")
        plot(datael2$Voltage ~ datael2$datetime, type = "l", ylab = "Voltage", 
             xlab = "datetime")
        
        plot(datael2$Sub_metering_1 ~ datael2$datetime, type = "l", 
             xlab= " ", ylab = "Energy sub metering")
        lines(datael2$Sub_metering_2 ~ datael2$datetime, col = "red")
        lines(datael2$Sub_metering_3 ~ datael2$datetime, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=1, lwd =2.5, col= c("black", "red", "blue"))
        
        plot(datael2$Global_reactive_power ~ datael2$datetime,
             type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
        dev.off()
}