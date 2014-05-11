
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")
data[,1]<-as.Date(data$Date,"%d/%m/%Y")
data1<-subset(data,data$Date %in% as.Date(c("2007-02-01","2007-02-02")))
data1$DateTime <- as.POSIXct(paste(data1$Date, data1$Time), format="%Y-%m-%d %H:%M:%S")

data1$Global_active_power<-as.numeric(data1$Global_active_power)
data1$Global_reactive_power<-as.numeric(data1$Global_reactive_power)
data1$Voltage<-as.numeric(data1$Voltage)
data1$Global_intensity<-as.numeric(data1$Global_intensity)
data1$Sub_metering_1<-as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2<-as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3<-as.numeric(data1$Sub_metering_3)

png(file="plot2.png",width = 480, height = 480, units = "px")
plot(data1$DateTime,data1$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()
