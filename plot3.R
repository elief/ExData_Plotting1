## download and unzip file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","HPS.zip",mode="wb")
unzip("HPS.zip", "household_power_consumption.txt")

##call requested libraries
library("sqldf")

## Load Data
suppressWarnings(data<-read.csv.sql("household_power_consumption.txt",sep = ";",sql = "SELECT * FROM file WHERE (Date = '1/2/2007' OR  DATE = '2/2/2007')"))

##Generate  plot3.png
# Open Device
png(height = 480,width = 480,file = "plot3.png")
#Draw the structure without line for the plot
plot(as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")),data$Sub_metering_1,type = "n",ylab = "Energy sub metring",xlab = "")
#Draw line for Sub_metering_1
lines(data$Sub_metering_1 ~ as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")),col = "black")
#Draw line for Sub_metering_2
lines(data$Sub_metering_2 ~ as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")),col = "red")
#Draw line for Sub_metering_3
lines(data$Sub_metering_3 ~ as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")),col = "blue")
#Add legend for different colors by variable
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)
#Close file
dev.off()
## download and unzip file