
library(ggplot2)
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


attach(subdata)
hist(subdata$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (Kilowatts)', ylab = 'Frequency')
dev.copy(device = png, file = "plot1.png", height = 480, width = 480)
dev.off
detach(subdata)


