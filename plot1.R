library(sqldf)

dataFile   <- "household_power_consumption.txt"
sqlCommand <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

data <- read.csv.sql(dataFile, sqlCommand, sep=";", stringsAsFactors=FALSE, header=TRUE)

globalActivePower <- as.numeric(data$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()