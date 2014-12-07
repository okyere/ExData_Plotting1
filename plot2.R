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

#plot png to file
png("plot2.png", 480, 480,units = "px")

# plot 2
plot(x = hpc$dt,y = hpc$Global_active_power,type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()

