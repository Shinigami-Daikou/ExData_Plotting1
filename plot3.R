download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ';',na.strings = '?')
data<-data[as.Date(strptime(data$Date,"%d/%m/%Y")) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]
data$Datetime<-as.POSIXct(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time))

with(data,{
      plot(Sub_metering_1~Datetime, type="l",
           ylab="Energy sub metering", xlab="")
      lines(Sub_metering_2~Datetime,col='red')
      lines(Sub_metering_3~Datetime,col='blue')
})
legend("topright",col = c("black","red","blue"),legend = colnames(data[7:9]),lty = 1,lwd = 1)
dev.copy(png,"plot3.png")
dev.off()