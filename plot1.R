download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ';',na.strings = '?')
data<-data[as.Date(strptime(data$Date,"%d/%m/%Y")) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")),]
data$Date<-as.Date(strptime(data$Date,"%d/%m/%Y"))
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()