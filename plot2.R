#ECF Mar15
#Generates the second plot.

#Read data
alldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Filter by date.
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]

#Add POSIX time.
data$Era <- as.POSIXct(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

#Open de png device.
png(filename="plot2.png")

#Create the plot.
plot(data$Era,data$Global_active_power, type = "l",xlab=NA,ylab="Global Active Power (kilowatts)")

#Close the device.
dev.off()
