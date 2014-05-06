## read file with selected rows
filename <- "household_power_consumption.txt"
data <- read.table(filename,
                   sep=";", 
                   colClasses = c("factor","character", rep("numeric",7)),
                   nrows=2880, skip=66637, 
                   col.names=
                       colnames(read.table(filename,
                                           nrow = 1, header = TRUE, sep=";")))

## create a date-time vector
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
newDate <- paste(data[[1]], data[[2]])
newDate <- as.POSIXct(newDate, format= "%Y-%m-%d %H:%M:%S")

##plot the graph
png(file = "plot1.png")
hist(data[[3]], col="red", 
                xlab="Global Active Power (kilowatts)", 
                ylab="Frequency", 
                main="Global Active Power",
                cex=0.5)
dev.off()