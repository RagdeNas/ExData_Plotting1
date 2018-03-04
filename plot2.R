library(sqldf)
Sys.setlocale("LC_ALL","en_GB.UTF-8")

#Load data
pwrconsumption <- read.csv.sql("../household_power_consumption.txt", header = TRUE, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", sep=";")

#open PNG device
png(file="plot2.png", width = 480, height = 480)

# Create histogram
plot( 
  x=strptime( paste(pwrconsumption$Date, pwrconsumption$Time), "%d/%m/%Y %T"), 
  y=pwrconsumption$Global_active_power, 
  type="l",
  xlab = "Day",
  ylab = "Global Active Power (kilowatts)"
  )

# Close device (save file)
print("Generating plot image")
dev.off()

#cleanup
rm( list=ls() )