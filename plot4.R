# read the dataframe from file
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header=TRUE, sep=";", na.strings="?")

# get subset of data from "1/2/2007" to "2/2/2007"
data1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# purge original data to save memory
rm("data")

# convert Data and Time varaible from character to Data/Time object
data1$Date <- paste(data1$Date, data1$Time)
data1$Date <- strptime(data1$Date, "%d/%m/%Y %H:%M:%S")

# construct plot4
png(file="plot4.png")

par(mfrow=c(2,2))
with(data1, plot(Date, Global_active_power, ylab="Global Active Power", xlab="", type="l"))
with(data1, plot(Date, Voltage, ylab="Voltage", xlab="datetime", type="l"))
with(data1, plot(Date, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
    with(data1, lines(Date, Sub_metering_1, col="black"))
    with(data1, lines(Date, Sub_metering_2, col="red"))
    with(data1, lines(Date, Sub_metering_3, col="blue"))
    legend("topright", 
           lty=c(1,1,1), 
            col=c("black","red","blue"), 
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            bty="n")
with(data1, plot(Date, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l"))

dev.off()