## Data Analysis - Week 1 - Peer Graded Assigment - Plot4

## Read and subset the data
col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = col_classes)
hpc_raw <- subset(hpc_full, Date == "1/2/2007" | Date == "2/2/2007")

## Convert Date and Time to a datetime format and bind to the dataframe
datetime <- strptime(paste(hpc_raw$Date, hpc_raw$Time), "%d/%m/%Y %H:%M:%S")
hpc <- cbind (hpc_raw, datetime)

## Plot as png displaying four plots in a 2x2 layout
png(file="plot4.png")
par(mfcol= c(2,2))

## The first two plots are Plot2 and Plot3 from before
## Plot2
with(hpc, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Plot3 - with a modifcation to the legend border
with(hpc, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
points(hpc$datetime, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$datetime, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## Two new plots
with(hpc, plot(datetime, Voltage, type = "l"))
with(hpc, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

