# Exploratory Data Analysis - Coursera
# Course Project 1, Problem 2
# sof 12/03/2014
#
# Navigate to working directory, data file should be in a folder accessible
# through the following path ./rawdata/household_power_consumption.txt

# Read data & subset dataset to days of interest. 
dat <- read.table("./rawdata/household_power_consumption.txt", header=TRUE, sep=";", as.is=c(1:9))
datR <- dat[(as.Date(dat$Date, format="%d/%m/%Y")  == as.Date("2007-02-01", format="%Y-%m-%d") |
                  as.Date(dat$Date, format="%d/%m/%Y") == as.Date("2007-02-02", format="%Y-%m-%d")), ]

# Clean up memory
rm(dat)

# Combine the date and time variables to create a combined chronological parameter, 
# & remove NA's if present from both datesTimes and Global Power data     
datesTimes <- strptime(paste(datR$Date, datR$Time, sep=" "), 
                       "%d/%m/%Y %H:%M:%S")[!is.na(datesTimes)][!is.na(as.numeric(datR$Global_active_power))]
datGlobalActPwr <- as.numeric(datR$Global_active_power)[!is.na(datesTimes)][!is.na(as.numeric(datR$Global_active_power))]

# Plot 2 - Open png device, create plot, and then close the device
png("plot2.png", width=480, height=480)
plot(datesTimes, datGlobalActPwr, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()