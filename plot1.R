# Exploratory Data Analysis - Coursera
# Course Project 1, Problem 1
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

# Plot 1 - Open png device, create plot, and then close the device
png("plot1.png", width=480, height=480)
hist(as.numeric(datR$Global_active_power[suppressWarnings(!is.na(as.numeric(datR$Global_active_power)))]),
     col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()