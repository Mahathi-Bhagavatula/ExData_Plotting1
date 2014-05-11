#Read the document fromthe file
doc <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE)
#get the required information
subDoc <- subset(doc, doc$Date=="1/2/2007" | doc$Date=="2/2/2007")
#plot the required graph
hist(as.numeric(subDoc$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
#send to the required file
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()