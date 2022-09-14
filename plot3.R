
#Reading the data
plot3_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
str(plot3_data)

#Creating datettime variable and converting it to POSIXct type
plot3_data$date_time <- paste(plot3_data$Date, plot3_data$Time, sep = " ")
plot3_data$date_time <- as.POSIXct(plot3_data$date_time, format = "%d/%m/%Y %H:%M:%S")
plot3_data$Date <- as.Date(plot3_data$Date,format="%d/%m/%Y")

#creating subset
plot3_subdata <- subset(plot3_data,Date>= "2007-02-01" & Date <= "2007-02-02")

#converting sub_metering_1 and 2 into numeric datatype
plot3_subdata$Sub_metering_1 <- as.numeric(plot3_subdata$Sub_metering_1)
plot3_subdata$Sub_metering_2 <- as.numeric(plot3_subdata$Sub_metering_2)

View(plot3_subdata)

#Creating png file
png("plot3.png", width=480, height=480)

#Plotting the graph
plot(x=plot3_subdata$date_time, plot3_subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot3_subdata$date_time, plot3_subdata$Sub_metering_2,col="red")
lines(plot3_subdata$date_time, plot3_subdata$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#closing the connection
dev.off()

