# setwd("H:/Coursera/4 - Exploratory Data Analysis/projects/project1/ExData_Plotting1/")

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=";", na.string="?")
unlink(temp)

data$Date.F <- as.Date(data$Date, format="%d/%m/%Y")
attach(data)
first <- which(Date.F=="2007-02-01")
second <- which(Date.F=="2007-02-02")
feb <- rbind(first,second)
datasub <- data[feb,]

par(bg="transparent")

# PLOT 1
datasub$Global_active_power <- as.numeric(as.character(datasub$Global_active_power))
hist(datasub$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.copy(png, "plot1.png")
dev.off()