#Read the document fromthe file
doc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE)
#get the required information
subDoc <- subset(doc, doc$Date=="1/2/2007" | doc$Date=="2/2/2007")
#combine date and time variables
subDoc$Day <- strptime(paste(subDoc$Date, subDoc$Time), "%d/%m/%Y %H:%M:%S")
#plot the required graph
plot(subDoc$Day, as.numeric(subDoc$Sub_metering_1),type="n", xlab="", ylab="Energy sub metering")
lines(subDoc$Day, as.numeric(subDoc$Sub_metering_1))
lines(subDoc$Day, as.numeric(subDoc$Sub_metering_2), col= "red")
lines(subDoc$Day, as.numeric(subDoc$Sub_metering_3), col= "blue")
#insert the legend
legend("topright", pch="_", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#send to the required file
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
