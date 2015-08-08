library(dplyr)


data<- na.omit(read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?"))


#subsetting interested data by date and creating new variable and set them = date and time
interests <- c("1/2/2007","2/2/2007")
new_data <- filter(data, Date %in% interests)
new_data$TimeDate <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#plot2
new_data$weekday <- weekdays(as.Date(new_data$TimeDate)) #adding new variable weekday 
y <- new_data$Global_active_power
x <- new_data$TimeDate

png(filename="plot2.png", width=480, height=480)
par(mar=c(5.1, 4.2, 4.1, 2.1)) #changed the left margin from 4.1 to 6 so texts can fit
plot(x,y, type="l", xlab ="",ylab="Global Active Power (kilowatts)")
dev.off()