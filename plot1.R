## Data Analysis - Week 1 - Peer Graded Assigment - Plot1

## Read and subset the data
col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = col_classes)
hpc <- subset(hpc_full, Date == "1/2/2007" | Date == "2/2/2007")

## Plot as png
png(file="plot1.png")
with(hpc, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()