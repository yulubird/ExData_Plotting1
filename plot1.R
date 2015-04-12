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

# construct plot1
png(file="plot1.png")

hist(data1$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

dev.off()