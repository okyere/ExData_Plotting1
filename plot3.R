# Clear workspace
rm(list = ls())

Sys.setlocale('LC_TIME', 'C')

# Load all the data
hpc = read.csv(file = "household_power_consumption.txt",header = TRUE,
    sep = ";", na.strings = "?")

# Subset the two days
hpc = subset(hpc, (Date %in% c("1/2/2007","2/2/2007")))

# Concatenate data and time
hpc$dt = paste(hpc$Date, hpc$Time)

# Format date and time to POSIXlt
hpc$dt = strptime(hpc$dt, format = "%d/%m/%Y %H:%M:%S")
rownames(hpc) = NULL

#plot ot png file
png("plot3.png", 480, 480,units = "px")

# plot 3
plot(hpc$dt,hpc$Sub_metering_1,type = "l", col = "black", ylab = "Enegry sub metering", xlab ="")
lines(hpc$dt,hpc$Sub_metering_2,type = "l", col = "red")
lines(hpc$dt,hpc$Sub_metering_3,type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    col = c("black", "red", "blue"), lty = 1)

dev.off()
