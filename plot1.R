library(dplyr)


data<- na.omit(read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?"))


#subsetting interested data by date and creating new variable and set them = date and time
interests <- c("1/2/2007","2/2/2007")
new_data <- filter(data, Date %in% interests)
new_data$TimeDate <- strptime(paste(new_data$Date, new_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



#plot1
plot1 <- new_data$Global_active_power
png(filename="plot1.png", width=480, height=480)
hist(plot1,main = "Global Active Power", col="red", xlab="Global Active Power \n (kilowatts)")
dev.off()