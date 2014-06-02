## Exploratory Data Analysis - Course Project 1
## Salvino A. Salvaggio - June 2014

## Please, note that the code is 'encapasulated' in the plot4() function

plot4 <- function() {
    
    lines <- readLines('household_power_consumption.txt')
    ColumnNames <- as.matrix(read.table(text=lines[1], sep=';'))
    start <- min(grep('^1/2/2007;*', lines))
    end <- max(grep('^2/2/2007;*', lines))
    
    Data <- read.table(text=lines[start:end], header=F, sep=';', stringsAsFactors=FALSE)
    colnames(Data) <- ColumnNames[1,]
    
    Data$DateTime <- paste(Data$Date, Data$Time)
    Data$DateTime <- strptime(Data$DateTime, '%d/%m/%Y %H:%M:%S')
    Data$Weekday <- weekdays(as.Date(Data$DateTime))
    
    # Plot 4
    png(file='plot4.png')
    par(mfcol=c(2,2))
    plot(Data$DateTime, Data$Global_active_power, type='l', 
         ylab='Global Active Power', xlab='')
    plot(Data$DateTime, Data$Sub_metering_1, type='l', ylab='Energy sub metering', 
         xlab='', col='black')
    lines(Data$DateTime, Data$Sub_metering_2, col='red')
    lines(Data$DateTime, Data$Sub_metering_3, col='blue')
    legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1',
          'Sub_metering_2', 'Sub_metering_3'), pch='_', bty='n')
    plot(Data$DateTime, Data$Voltage, type='l', 
         ylab='Voltage', xlab='datetime')
    plot(Data$DateTime, Data$Global_reactive_power, type='l', 
         xlab='datetime', ylab='Global_reactive_power')
    dev.off()
    
}