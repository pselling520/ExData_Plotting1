
#Loading in data, recasting some columns
data <- read.table(file,header=TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data,((Date>="2007-02-01") & 
                     (Date<="2007-02-02")))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Creating graph
dev.new(width=480,height=480,unit="px")
hist(data$Global_active_power, 
     breaks=15,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()

