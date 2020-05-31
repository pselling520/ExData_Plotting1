
#NOTE: Not loading in data again because it was already loaded in for plot1,
#but I'm including the code I used to load in the data in case other plots
#are examined individually

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

#Plotting graph
plot(data$DateTime,data$Global_active_power,
     type="n",
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime,
      data$Global_active_power)

dev.copy(png, file="plot2.png")
dev.off()
