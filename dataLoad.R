#load file
pw_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

#filter out unwanted rows
date_format <- "%d/%m/%Y"
wanted_dates <- c(as.Date("01/02/2007",date_format),as.Date("02/02/2007",date_format))
pw_data <- pw_data[(as.Date(pw_data$Date,date_format) %in% wanted_dates),]
pw_data$Date <- as.Date(pw_data$Date,date_format)

#add a timestamp combining date + time
timestamp_format <- "%Y-%m-%d %H:%M:%S"
pw_data$timestamp <- as.POSIXlt(paste(pw_data$Date,pw_data$Time),format= timestamp_format)

#convert to numeric, not done on file load as "?" characters gave problems
pw_data$Global_active_power <- as.numeric(pw_data$Global_active_power)
pw_data$Global_reactive_power <- as.numeric(pw_data$Global_reactive_power)
pw_data$Sub_metering_1 <- as.numeric(pw_data$Sub_metering_1)
pw_data$Sub_metering_2 <- as.numeric(pw_data$Sub_metering_2)
pw_data$Sub_metering_3 <- as.numeric(pw_data$Sub_metering_3)