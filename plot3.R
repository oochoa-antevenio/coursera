## Getting full dataset and subsetting
DT <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', 
        na.strings="?",stringsAsFactors=F)
DT$Date <- as.Date(DT$Date, "%d/%m/%Y")

DT2 <- DT[DT$Date=="2007-02-01"|DT$Date=="2007-02-02",]

## Converting date and time
datetime <- paste(as.Date(DT2$Date), DT2$Time)
DT2$DateTime <- as.POSIXct(datetime)
Sys.setlocale("LC_TIME", "English")

## Plot 3 & png generation
png("plot3.png", height=480, width=480)
plot(DT2$DateTime, DT2$Sub_metering_1, type="l", 
               ylab="Energy sub metering", xlab="")
lines(DT2$DateTime, DT2$Sub_metering_2, type="l", col="red")
lines(DT2$DateTime, DT2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,
        col =c("black","red","blue"))

## dev.copy(png, file="plot3.png", height=480, width=480) don't resize the 
## legends properly and they show the text cut in this plot.
dev.off()