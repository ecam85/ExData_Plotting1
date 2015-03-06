#ECF Mar15
#Generates the first plot.

#Read the data.
alldata <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Filter the data by date.
data <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",]

#Open de png device.
png(filename="plot1.png")

#Create the plot.
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power", xlim = c(0,6),ylim=c(0,1200))

#Close the device.
dev.off()