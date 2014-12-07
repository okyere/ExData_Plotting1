# Clear workspace
rm(list = ls())

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
png("plot1.png", 480, 480,units = "px")

# plot 1
hist(hpc$Global_active_power,xlab = "Global Active Power (kilowatts)", col = "red", 
     main = "Global Active Power")

dev.off()