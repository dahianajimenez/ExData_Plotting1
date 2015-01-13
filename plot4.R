# setwd("H:/Coursera/4 - Exploratory Data Analysis/projects/project1/ExData_Plotting1/")

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=";", na.string="?")
unlink(temp)

data$Date.F <- as.Date(data$Date, format="%d/%m/%Y") #format is the original
attach(data)
first <- which(Date.F=="2007-02-01")
second <- which(Date.F=="2007-02-02")
feb <- rbind(first,second)
datasub <- data[feb,]

par(bg="transparent")


datasub$Global_active_power <- as.numeric(as.character(datasub$Global_active_power))


# PLOT 4
par(mfrow=c(nr=2,nc=2))

# PLOT 2 COPY
dataThur <- datasub[which(datasub$Date.F=="2007-02-01"),]
dataThur$Time.F <- paste(dataThur$Date.F, dataThur$Time)
dataThur$Time.F <- strptime(dataThur$Time.F, format="%Y-%m-%d %H:%M:%S")

dataFri <- datasub[which(datasub$Date.F=="2007-02-02"),]
dataFri$Time.F <- paste(dataFri$Date.F, dataFri$Time)
dataFri$Time.F <- strptime(dataFri$Time.F, format="%Y-%m-%d %H:%M:%S")

datasub2 <- rbind(dataThur, dataFri)
plot(datasub2$Time.F, datasub2$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")


plot(datasub2$Time.F, datasub2$Voltage, type="l", xlab="datetime", ylab="Voltage")


# PLOT 3 COPY
plot(datasub2$Time.F, datasub2$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering", col="black")
lines(datasub2$Time.F, datasub2$Sub_metering_2, type="l", col="red")
lines(datasub2$Time.F, datasub2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bg="transparent", cex=.6)


plot(datasub2$Time.F, datasub2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, "plot4.png")
dev.off()
