## download and unzip file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","HPS.zip",mode="wb")
unzip("HPS.zip", "household_power_consumption.txt")

##call requested libraries
library("sqldf")

## Load Data
suppressWarnings(data<-read.csv.sql("household_power_consumption.txt",sep = ";",sql = "SELECT * FROM file WHERE (Date = '1/2/2007' OR  DATE = '2/2/2007')"))

##Generate  plot2.png
# Open Device
png(height = 480,width = 480,file = "plot2.png")
#Generate line file, 
#   as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")) 
#   is to get a datetime formated value from the combination of Date and Time Column
plot(as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")),data$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
#Close file
dev.off()