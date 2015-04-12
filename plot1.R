## download and unzip file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","HPS.zip",mode="wb")
unzip("HPS.zip", "household_power_consumption.txt")

##call requested libraries
library("sqldf")

## Load Data
suppressWarnings(data<-read.csv.sql("household_power_consumption.txt",sep = ";",sql = "SELECT * FROM file WHERE (Date = '1/2/2007' OR  DATE = '2/2/2007')"))

##Generate  plot1.png
# Open Device
png(height = 480,width = 480,file = "plot1.png")
#Draw histogram by Global_active_power
hist(data$Global_active_power,freq = TRUE,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
#Close file
dev.off()