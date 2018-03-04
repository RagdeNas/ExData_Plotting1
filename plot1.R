# Initialize work directory
setwd("~/Documents/Courses/Data Science/ExploratoryAnalysis/Week 1/Assignment/ExData_Plotting1")
library(sqldf)
Sys.setlocale("LC_ALL","en_GB.UTF-8")

#Load data
pwrconsumption <- read.csv.sql("../household_power_consumption.txt", header = TRUE, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", sep=";")

#open PNG device
png(file="plot1.png", width = 480, height = 480)

# Create histogram
hist( 
  pwrconsumption$Global_active_power, 
  col="red" , 
  main="Global Active Power", 
  xlab = "Global Active Power (kilowatts)"
  )

# Close device (save file)
print("Generating plot image")
dev.off()

#cleanup
rm( list=ls() )

