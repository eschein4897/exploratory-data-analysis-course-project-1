

filename <- 'household_power_consumption.txt'
setwd("/Users/ethanschein/desktop/r1")
if(!file.exists(filename)){
        url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        download.file(url = url, destfile = filename)
}

if(!exists('data')){
        data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
}

subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
