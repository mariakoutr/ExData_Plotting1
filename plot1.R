plot1<- function(){
datael <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE,
                      header = TRUE, sep =";"  )
datael$Date <- as.Date(datael$Date, format = "%d/%m/%Y")
datael <- datael[datael$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
datael$Global_active_power <- as.numeric(datael$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(datael$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
}