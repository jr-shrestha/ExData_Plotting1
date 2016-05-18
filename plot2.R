library(sqldf)

dataFile   <- "household_power_consumption.txt"
sqlCommand <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

data <- read.csv.sql(dataFile, sqlCommand, sep=";", stringsAsFactors=FALSE, header=TRUE)

dt <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()