library(ggplot2)

## Read data in and store as household_power_consumption
household_power_consumption <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
## Convert dates from strings to dates
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
## Subset the groundhog from Feb. 1,2 2007
groundhog <- subset(household_power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
## remove object household_power_consumption from the environment
rm(household_power_consumption)
## convert dates and times to POSIXct class objects
datetime <- paste(as.Date(groundhog$Date), groundhog$Time)
groundhog$Datetime <- as.POSIXct(datetime)
## Plot Sub-metering 1,2,3 Plot3
with(groundhog, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c(
         "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
                  )
       )