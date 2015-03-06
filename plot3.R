#ECF Mar15
#Generates the third plot.

#Read data
alldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Filter by date.
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]

#Add POSIX time.
data$Era <- as.POSIXct(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

#Open de png device.
png(filename="plot3.png")

#Create the plot, labels.
plot(data$Era,data$Sub_metering_1,type="n",xlab=NA,ylab="Energy sub metering")

#Add data lines.
points(data$Era,data$Sub_metering_1, col = "black", type = "l")
points(data$Era,data$Sub_metering_2, col = "red", type = "l")
points(data$Era,data$Sub_metering_3, col = "blue", type = "l")

#Add legend.
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c("solid","solid","solid"))

#Close the device.
dev.off()