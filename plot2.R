
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

#Setting graph size and plotting graph
dev.new(width=480,height=480,unit="px")
plot(data$DateTime,data$Global_active_power,
     type="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")
lines(data$DateTime,
      data$Global_active_power)

dev.copy(png, file="plot2.png")
dev.off()
