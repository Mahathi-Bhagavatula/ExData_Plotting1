#Read the document fromthe file
doc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE)
#get the required information
subDoc <- subset(doc, doc$Date=="1/2/2007" | doc$Date=="2/2/2007")
#combine date and time variables
subDoc$Day <- strptime(paste(subDoc$Date, subDoc$Time), "%d/%m/%Y %H:%M:%S")
#plot the required graph
plot(subDoc$Day, as.numeric(subDoc$Global_active_power),type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subDoc$Day, as.numeric(subDoc$Global_active_power))
#send to the required file
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
