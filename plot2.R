# First we read the file, specify NA values and separator character ;
consumption<-read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# We add a column called When of time Datetime using Date and Time columns
consumption$When<-strptime(paste(consumption$Date,consumption$Time), "%d/%m/%Y %H:%M:%S")
# We create a column Date2 of type Date
consumption$Date2 <- as.Date( as.character(consumption$Date), "%d/%m/%Y")
# We use Date2 to subset the complete dataset with only relevant dates
data <- subset(consumption, Date2 >= as.Date("2007-02-01") )
data <- subset(data,Date2 <=as.Date("2007-02-02"))
# We save the image to plot2.png
png(file="plot2.png")
# We create the plot setting the type of plot to line, and setting the x/y labels
with(data,plot(When,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
# Do not forget to close the device
dev.off()