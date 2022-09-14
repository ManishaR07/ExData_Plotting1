
#Reading the data
plot2data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
str(plot2data)
head(plot2data$Date)

#Creating datettime variable and converting it to POSIXct type
plot2data$date_time <- paste(plot2data$Date, plot2data$Time, sep = " ")
plot2data$date_time <- as.POSIXct(plot2data$date_time, format = "%d/%m/%Y %H:%M:%S")
plot2data$Date <- as.Date(plot2data$Date,format="%d/%m/%Y")

#creating subset
plot2subdata <- subset(plot2data,Date>= "2007-02-01" & Date <= "2007-02-02")

#converting Global active power to numeric
plot2subdata$Global_active_power <- as.numeric(plot2subdata$Global_active_power)

#creating png file
png("Pplot2.png", width=480, height=480)

#Plotting the graph
plot(x=plot2subdata$date_time, plot2subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")

#closing the connection
dev.off()