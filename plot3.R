#Loading in data, adding in datetime column
data <- read.table(file,header=TRUE, sep=";")
date <- as.character(data$Date)
time <- as.character(data$Time)
datetime <- paste(date,time)
datetime <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
data["DateTime"] <- datetime
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,((Date>="2007-02-01") & 
                         (Date<="2007-02-02")))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Recasting submeter columns
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#Setting up graph size and graphing
dev.new(width=480,height=480,unit="px")
plot(data$DateTime, 
     type="n",
     data$Sub_metering_1,
     ylab="Engery sub metering",
     xlab="")
lines(data$DateTime, 
      data$Sub_metering_1,
      col="black")
lines(data$DateTime,
      data$Sub_metering_2,
      col="red")
lines(data$DateTime,
      data$Sub_metering_3,
      col="blue")
legend("topright",
       col=c("black",
             "red",
             "blue"),
       lty=1,
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
