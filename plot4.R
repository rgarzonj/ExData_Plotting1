# First we read the file, specify NA values and separator character ;
consumption<-read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# We add a column called When of time Datetime using Date and Time columns
consumption$When<-strptime(paste(consumption$Date,consumption$Time), "%d/%m/%Y %H:%M:%S")
# We create a column Date2 of type Date
consumption$Date2 <- as.Date( as.character(consumption$Date), "%d/%m/%Y")
# We use Date2 to subset the complete dataset with only relevant dates
data <- subset(consumption, Date2 >= as.Date("2007-02-01") )
data <- subset(data,Date2 <=as.Date("2007-02-02"))
# We save the image to plot4.png
png(file="plot4.png")
# We configure the layout for the 4 images
par(mfrow=c(2,2))
# We start plotting
with(data, {
        #Create first plot
        plot(When,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
        #Create second plot
        plot(When,Voltage,type="l",xlab="datetime")
        #Create third plot  
        plot(When,Sub_metering_1, type="l", ylab="Energy sub metering",xlab="" )
        lines(When,Sub_metering_2, type="l",col="red")
        lines(When,Sub_metering_3, type="l",col="blue")
        legend("topright",bty="n",col = c("black","red", "blue"),lty=1, 
               legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        #Create fourth plot
        plot(When,Global_reactive_power,type="l",xlab="datetime")
        })
# Do not forget to close the device
dev.off()