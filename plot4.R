library(dplyr)


data<- na.omit(read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?"))


#subsetting interested data by date and creating new variable and set them = date and time
interests <- c("1/2/2007","2/2/2007")
new_data <- filter(data, Date %in% interests)
new_data$TimeDate <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#data from plot2
new_data$weekday <- weekdays(as.Date(new_data$TimeDate)) #adding new variable weekday 
y <- new_data$Global_active_power
x <- new_data$TimeDate

#data from plot3
sub1<- new_data$Sub_metering_1
sub2<- new_data$Sub_metering_2
sub3<- new_data$Sub_metering_3

#plot4

png(filename="plot4.png", width=480, height=480)
par(mfcol = c(2,2))
#1st plot
plot(x,y, type="l", xlab ="",ylab="Global Active Power (kilowatts)")

#2nd plot
plot(x, sub1, type ="n", ylab="Energy sub metering", xlab="")
points(x,sub1, type="l", col="purple")
points(x, sub2, type="l", col="red")
points(x, sub3, type="l", col="blue")
legend("topright", legend = names(new_data)[7:9], col=c(1:3), lwd=2, cex =1,bty="n") # setting legend top right with -- bty="n" to remove border

#3rd plot
Voltage <- new_data$Voltage
plot(x, Voltage, type ="l", xlab="datetime")

#4th plot
Global_reactive_power <- new_data$Global_reactive_power
plot(x, Global_reactive_power, type="l", xlab="datetime")

dev.off()