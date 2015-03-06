#ECF Mar15
#Generates the fourth plot.

#Read data
alldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Filter by date.
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]

#Add POSIX time.
data$Era <- as.POSIXct(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

#Open de png device.
png(filename="plot4.png")

#Display in 2 rows, 2 columns.
par(mfrow=c(2,2))

#First plot:
plot(data$Era,data$Global_active_power, type = "l",xlab=NA,ylab="Global Active Power")

#Second plot:
plot(data$Era,data$Voltage, type = "l",xlab="datetime",ylab="Voltage")

#Third plot:
#Create the plot, labels.
plot(data$Era,data$Sub_metering_1,type="n",xlab=NA,ylab="Energy sub metering")

#Add data lines.
points(data$Era,data$Sub_metering_1, col = "black", type = "l")
points(data$Era,data$Sub_metering_2, col = "red", type = "l")
points(data$Era,data$Sub_metering_3, col = "blue", type = "l")

#Add legend.
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c("solid","solid","solid"),box.lty="blank")

#Fourth plot:
plot(data$Era,data$Global_reactive_power, type = "l",xlab="datetime",ylab="Global_reactive_power",)

#Close the device.
dev.off()