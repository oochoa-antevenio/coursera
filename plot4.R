## Getting full dataset and subsetting
DT <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', 
               na.strings="?",stringsAsFactors=F)
DT$Date <- as.Date(DT$Date, "%d/%m/%Y")

DT2 <- DT[DT$Date=="2007-02-01"|DT$Date=="2007-02-02",]

## Converting date and time
datetime <- paste(as.Date(DT2$Date), DT2$Time)
DT2$DateTime <- as.POSIXct(datetime)
Sys.setlocale("LC_TIME", "English")

## Plot 4 & png generation
png("plot4.png", height=480, width=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(DT2, {
        plot(DT2$DateTime, DT2$Global_active_power, type="l",xlab="", 
             ylab="Global Active Power (kilowatts)")
        plot(DT2$DateTime, DT2$Voltage, type="l",xlab="datetime", 
             ylab="Voltage")
        plot(DT2$DateTime, DT2$Sub_metering_1, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(DT2$DateTime, DT2$Sub_metering_2, type="l", col="red")
        lines(DT2$DateTime, DT2$Sub_metering_3, type="l", col="blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,
               col =c("black","red","blue"))
        plot(DT2$DateTime, DT2$Global_reactive_power, type="l",xlab="datetime", 
             ylab="GLobal_reactive_power")
})
dev.off()
