## Exploratory Data Analysis - Course Project 1
## Salvino A. Salvaggio - June 2014

## Please, note that the code is 'encapasulated' in the plot2() function

plot2 <- function() {
    
    lines <- readLines('household_power_consumption.txt')
    ColumnNames <- as.matrix(read.table(text=lines[1], sep=';'))
    start <- min(grep('^1/2/2007;*', lines))
    end <- max(grep('^2/2/2007;*', lines))
    
    Data <- read.table(text=lines[start:end], header=F, sep=';', stringsAsFactors=FALSE)
    colnames(Data) <- ColumnNames[1,]
    
    Data$DateTime <- paste(Data$Date, Data$Time)
    Data$DateTime <- strptime(Data$DateTime, '%d/%m/%Y %H:%M:%S')
    Data$Weekday <- weekdays(as.Date(Data$DateTime))
    
    # Plot 2
    png(file='plot2.png')
    plot(Data$DateTime, Data$Global_active_power, type='l', 
         ylab='Global Active Power (kilowatts)', xlab='')
    dev.off()
    
}