# Exploratory Data Analysis - Coursera
# Course Project 1, Problem 3
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

# Extract required data from datR
# Combine the date and time variables to create a combined chronological parameter, 
datesTimes <- strptime(paste(datR$Date, datR$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMet1 <- as.numeric(datR$Sub_metering_1)
subMet2 <- as.numeric(datR$Sub_metering_2)
subMet3 <- as.numeric(datR$Sub_metering_3)

# Clean up memory
rm(datR)

# Plot 3 - Open png device, create plot, and then close the device
png("plot3.png", width=480, height=480)
plot(datesTimes, subMet1, type="n", ylab="Energy sub metering", xlab="")
lines(datesTimes, subMet1, type="l", col="Black")
lines(datesTimes, subMet2, type="l", col="red")
lines(datesTimes, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()