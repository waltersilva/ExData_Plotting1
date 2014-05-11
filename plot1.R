## PROJECT 1 - plot1

data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                   sep = ";", colClasses="character",
                   col.names = colnames(read.table("household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))

## convert any "?" to "NA"
for( i in 1:9) {
  data[data[, i] == "?"] <- "NA"
}

## convert power measurements to numeric
for(i in 3:9){
  data[, i] <- as.numeric(data[, i])
}


png(file="plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.off()
