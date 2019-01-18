plot2<- function(){
        datael <- read.table("./household_power_consumption.txt", 
                             stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        datael$Date <- as.Date(datael$Date, format = "%d/%m/%Y")
        datael <- datael[datael$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
        datael$Global_active_power <- as.numeric(datael$Global_active_power)
        datetime = as.POSIXct(paste(datael$Date, datael$Time))
        datael2 <- cbind(datael, datetime)
        png("plot2.png", width = 480, height = 480)
        plot(datael2$Global_active_power ~ datael2$datetime, type="l", xlab= "", 
             ylab="Global Active power (kilowatts)")
        dev.off()
        
}