# First we read the file, specify NA values and separator character ;
consumption<-read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# We add a column called When of time Datetime using Date and Time columns
consumption$When<-strptime(paste(consumption$Date,consumption$Time), "%d/%m/%Y %H:%M:%S")
# We create a column Date2 of type Date
consumption$Date2 <- as.Date( as.character(consumption$Date), "%d/%m/%Y")
# We use Date2 to subset the complete dataset with only relevant dates
data <- subset(consumption, Date2 >= as.Date("2007-02-01") )
data <- subset(data,Date2 <=as.Date("2007-02-02"))
# We save the image to plot3.png
png(file="plot3.png")
with(data, {
        # Initialize the plot and draw the first variable and the y label        
        plot(When,Sub_metering_1, type="l", ylab="Energy sub metering" )
        # Add the second variable with the option lines on the same plot
        lines(When,Sub_metering_2, type="l",col="red")
        # Add the third variable with the option lines on the same plot
        lines(When,Sub_metering_3, type="l",col="blue")
        # We add the legend, specifying line type lty=1 to show a simple continous line
        legend("topright",col = c("black","red", "blue"),lty=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})
# Do not forget to close the device
dev.off()