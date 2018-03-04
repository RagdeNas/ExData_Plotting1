library(sqldf)
Sys.setlocale("LC_ALL","en_GB.UTF-8")

#Load data
pwrconsumption <- read.csv.sql("../household_power_consumption.txt", header = TRUE, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", sep=";")
#variables
x1 <-strptime( paste(pwrconsumption$Date, pwrconsumption$Time), "%d/%m/%Y %T")
gap <- pwrconsumption$Global_active_power
grp <- pwrconsumption$Global_reactive_power
vlt <- pwrconsumption$Voltage
sm1 <-pwrconsumption$Sub_metering_1 
sm2 <-pwrconsumption$Sub_metering_2
sm3 <-pwrconsumption$Sub_metering_3

#open device
png(file="plot4.png", width = 640, height = 480)

par(mfrow=c(2,2), mar=c(4,0,2,0) , oma=c(0,0,2,0), pin=c(3.2,1.7))
## Plot 1
plot( x1, gap, type = "l", xlab="", ylab = "Global Active Power")

## Plot 2
plot( x1, vlt, type = "l", ylab = "Voltage", xlab="datetime")

## Plot 3
plot( x1, sm1, type="l", xlab = "",  ylab = "Energy sub metering")
points(x1,  sm2, col="red" , type="l") # add series 2
points(x1,  sm3, col="blue" , type="l") # add series 3
legend("topright", col=c("black", "red", "blue"), legend=names(pwrconsumption[7:9]) , lty=c(1,1), bty="n") # add legend

## Plot 4
plot( x1, grp, type = "o", pch=".", xlab="datetime", ylab="Global_reactive_power")

# Close device (save file)
print("Generating plot image")
dev.off()

#cleanup
rm( list=ls() )