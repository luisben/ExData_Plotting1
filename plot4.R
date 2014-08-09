source("dataLoad.r")
prev_locale <- Sys.getlocale(category = "LC_ALL")
Sys.setlocale(category = "LC_ALL", locale = "C")
png("myplots/plot4.png",width = 480, height = 480, units = "px")
#set mfcol
par(mfcol = c(2,2))
#first plot
with(pw_data,plot(timestamp,Global_active_power,type = "l",xlab="",ylab="Global Active Power"))
#second plot
with(pw_data,plot(timestamp,Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering",col="black"))
with(pw_data,lines(timestamp,Sub_metering_2,type="l",col="red"))
with(pw_data,lines(timestamp,Sub_metering_3,type="l",col="blue"))
legend(x="topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
#third plot
with(pw_data,plot(timestamp,Voltage,type = "l",xlab="datetime",ylab="Voltage"))
#fourth plot
with(pw_data,plot(timestamp,Global_reactive_power,type = "l",xlab="datetime"))

dev.off()
#restore mfcol
par(mfcol = c(1,1))
Sys.setlocale(category = "LC_ALL", locale = prev_locale)