#plot2

#read the table - start with the Date and Time as character fields
#Note: input file must be in the workng directory
power <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric","numeric", "numeric"),na.strings = "?")

#Now combine Date and Time columns into a new POSIX column called DateTime and add it to the data frame
power <- cbind(power,DateTime = strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S"))

#Now subset the data frame. Get just got the dates 2/1/2007 & 2/2/2007
subPower<-subset(power, DateTime >= strptime("2007-02-01", format = "%Y-%m-%d") & DateTime < strptime("2007-02-03", format = "%Y-%m-%d"))

#prepare to send graphic output to a png file
png(filename = "plot2.png", width = 480, height = 480)

#Create plot
#type = "l" - plots a line rather than points
plot(subPower$DateTime, subPower$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

dev.off()

