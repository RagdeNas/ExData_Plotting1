library(sqldf)
Sys.setlocale("LC_ALL","en_GB.UTF-8")

#Load data
pwrconsumption <- read.csv.sql("../household_power_consumption.txt", header = TRUE, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", sep=";")

#open PNG device
png(file="plot3.png", width = 480, height = 480)
x1 <-strptime( paste(pwrconsumption$Date, pwrconsumption$Time), "%d/%m/%Y %T")
y1 <-pwrconsumption$Sub_metering_1 
y2 <-pwrconsumption$Sub_metering_2
y3 <-pwrconsumption$Sub_metering_3

# Create plot
plot( 
  x=x1, 
  y=y1, 
  type="l",
  xlab = "Day",
  ylab = "Energy sub metering"
)
# add series 2
points(x1,  y2, col="red" , type="l")
# add series 3
points(x1,  y3, col="blue" , type="l")
# add legend
legend("topright", col=c("black", "red", "blue"), legend=names(pwrconsumption[7:9]) , lty=c(1,1))


# Close device (save file)
print("Generating plot image")
dev.off()

#cleanup
rm( list=ls() )