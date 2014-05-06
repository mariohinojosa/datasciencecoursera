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
png(file = "plot3.png")
plot(newDate, data[[7]], type="l", 
     ylim=c(0,max(data[[7]])), 
     xlab="",ylab="Energy sub metering")
par(new=T)
plot(newDate, data[[8]], type="l",ylim=c(0,max(data[[7]])), axes=F, xlab="", ylab="", col="red")
par(new=T)
plot(newDate, data[[9]], type="l", ylim=c(0,max(data[[7]])), axes=F,xlab="", ylab="", col="blue")
par(new=F)
legend("topright", lty=1, col=c("black", "red", "blue"), legend= names(data[7:9]), cex=0.8)
dev.off()