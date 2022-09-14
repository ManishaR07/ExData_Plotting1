
#Reading the data
plot1_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
str(plot1_data)

#changing Date to Date datatype
plot1_data$Date <- as.Date(plot1_data$Date,format="%d/%m/%Y")
head(plot1_data$Date)

#Creating subset
plot1_subdata <- subset(plot1_data,Date>= "2007-02-01" & Date <= "2007-02-02")
summary(plot1_subdata)

#converting Global active Power to numeric datatype
plot1_subdata$Global_active_power <- as.numeric(plot1_subdata$Global_active_power)

#Creating png file
png("plot1.png", width=480, height=480)

#Plotting histogram
hist(plot1_subdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

#closing Connection
dev.off()