setwd("C:/Users/Amy/Documents/Data Science Specialization - Coursera/4 - Exploratory Data Analysis")
# read in only data recorded on February 1&2, 2007
a1data <- subset(read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")
# missing values are coded as ? in data. Replace with empty spaces
gsub("?", "", a1data)
# convert data from character to numeric
a1data[ ,3:9] <- sapply(a1data[ 3:9], as.numeric)
# Date and Time are in separate columns. Create a new column called Datetime that combines them.
# paste function concatenates vectors after converting to character if they're not already
a1data$Datetime <- strptime(paste(a1data$Date, a1data$Time), "%e/%m/%Y %H:%M:%S", tz = "PST8PDT") # assuming Pacific time zone, that's where UC Irvine is

# Create line plot (type = "l") of Sub_metering vx time, called plot3
# Three Sub_metering parameters to plot, make each line a different colour
# x axis shows datetime as weekday by default, which is what is desired. Exclude x axis title
# Save as png file with specified pixel size
png(filename = "./Plot3.png", width = 480, height = 480)
with(a1data, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(a1data, lines(Datetime, Sub_metering_2, type = "l", col = "red"))
with(a1data, lines(Datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = names(a1data[ ,7:9])) # lty=1 means solid line
dev.off()
