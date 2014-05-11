doc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE)
subDoc <- subset(doc, doc$Date=="1/2/2007" | doc$Date=="2/2/2007")
subDoc$Day <- strptime(paste(subDoc$Date, subDoc$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
#Global active power graph
plot(subDoc$Day, as.numeric(subDoc$Global_active_power),type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subDoc$Day, as.numeric(subDoc$Global_active_power))
#Voltage graph
plot(subDoc$Day, as.numeric(subDoc$Voltage),type="n", xlab="datetime", ylab="Voltage")
lines(subDoc$Day, as.numeric(subDoc$Voltage))
#Energy metering Graph
plot(subDoc$Day, as.numeric(subDoc$Sub_metering_1),type="n", xlab="", ylab="Energy sub metering")
lines(subDoc$Day, as.numeric(subDoc$Sub_metering_1))
lines(subDoc$Day, as.numeric(subDoc$Sub_metering_2), col= "red")
lines(subDoc$Day, as.numeric(subDoc$Sub_metering_3), col= "blue")
legend("topright", pch="_", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
#Clobal Reactive Power Graph
plot(subDoc$Day, as.numeric(subDoc$Global_reactive_power),type="n", xlab="datetime", ylab="Global_reactive_power")
lines(subDoc$Day, as.numeric(subDoc$Global_reactive_power))
#print the contents to dev
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()