library(ggplot2)

## Read groundhog in and store as household_power_consumption
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
## PLot Global Active PoWER Plot2
plot(
      groundhog$Global_active_power ~ groundhog$Datetime, 
      type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""
     )