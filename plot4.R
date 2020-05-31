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

#setting up graph size, 2x2 graph view
dev.new(width=480,height=480,unit="px")
par(mfcol=c(2,2))
#Grabbing plot from plot 2
plot(data$DateTime,data$Global_active_power,
     type="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")
lines(data$DateTime,
      data$Global_active_power)

#Grabbing plot from plot 3
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
                "Sub_metering_3"),
       bty='n')

#voltage plot
plot(data$DateTime,data$Voltage,
     type="n",
     ylab="Voltage",
     xlab="datetime")
lines(data$DateTime,
      data$Voltage)

#reactive power plot
plot(data$DateTime,data$Global_reactive_power,
     type="n",
     ylab="Global_reactive_power",
     xlab="datetime")
lines(data$DateTime,
      data$Global_reactive_power)

dev.copy(png, file="plot4.png")
dev.off()
