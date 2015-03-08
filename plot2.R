## Getting full dataset and subsetting
DT <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors=F)
DT$Date <- as.Date(DT$Date, "%d/%m/%Y")

DT2 <- DT[DT$Date=="2007-02-01"|DT$Date=="2007-02-02",]

## Converting date and time
datetime <- paste(as.Date(DT2$Date), DT2$Time)
DT2$DateTime <- as.POSIXct(datetime)
Sys.setlocale("LC_TIME", "English")

## Plot 2 & png generation
png("plot2.png", height=480, width=480)
plot(DT2$DateTime, DT2$Global_active_power, type="l",xlab="", 
     ylab="Global Active Power (kilowatts)")

## dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()