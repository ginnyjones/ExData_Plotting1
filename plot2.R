## Data Analysis - Week 1 - Peer Graded Assigment - Plot2

## Read and subset the data
col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = col_classes)
hpc_raw <- subset(hpc_full, Date == "1/2/2007" | Date == "2/2/2007")

## Convert Date and Time to a datetime format and bind to the dataframe
datetime <- strptime(paste(hpc_raw$Date, hpc_raw$Time), "%d/%m/%Y %H:%M:%S")
hpc <- cbind (hpc_raw, datetime)

## Plot as png
png(file="plot2.png")
with(hpc, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()