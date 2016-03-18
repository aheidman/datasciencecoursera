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

# Create four base plots, save as PNG file called plot4
png(filename = "./Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) # 4 plots arranged in 2 rows and 2 columns
with(a1data, {
  plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") # row 1 column 1
  plot(Datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime") # row 1 column 2
  plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "") # row 2 column 1
  with(a1data, lines(Datetime, Sub_metering_2, type = "l", col = "red"))
  with(a1data, lines(Datetime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = names(a1data[ ,7:9]), bty = "n")
  plot(Datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime") # row 2 column 2
})
dev.off()