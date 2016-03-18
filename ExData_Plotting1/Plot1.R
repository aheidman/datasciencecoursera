setwd("C:/Users/Amy/Documents/Data Science Specialization - Coursera/4 - Exploratory Data Analysis")
# read in only data recorded on February 1&2, 2007
a1data <- subset(read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")
# missing values are coded as ? in data. Replace with empty spaces
gsub("?", "", a1data)
# convert data from character to numeric
a1data[ ,3:9] <- sapply(a1data[ 3:9], as.numeric)

# Create histogram of Global Active Power, called plot1
# Save as png file with specified pixel size
png(filename = "./Plot1.png", width = 480, height = 480)
hist(a1data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()