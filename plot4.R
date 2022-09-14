
plot4_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

plot4_data$date_time <- paste(plot4_data$Date, plot4_data$Time, sep = " ")
plot4_data$date_time <- as.POSIXct(plot4_data$date_time, format = "%d/%m/%Y %H:%M:%S")
plot4_data$Date <- as.Date(plot4_data$Date,format="%d/%m/%Y")


plot4_subdata <- subset(plot4_data,Date>= "2007-02-01" & Date <= "2007-02-02")

plot4_subdata$Global_active_power <- as.numeric(plot4_subdata$Global_active_power)
plot4_subdata$Global_reactive_power <- as.numeric(plot4_subdata$Global_reactive_power)
plot4_subdata$Voltage <- as.numeric(plot4_subdata$Voltage)
plot4_subdata$Sub_metering_1 <- as.nuemric(plot4_subdata$Sub_metering_1)
plot4_subdata$Sub_metering_2 <- as.numeric(plot4_subdata$Sub_metering_2)

png("plot4.png", width=480, height=480)


dev.off()