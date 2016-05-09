#READ FILE FROM WD
data<-read.table("household_power_consumption.txt", sep= ";", header = TRUE)

#SUBSET DAYS
data21<-subset(data, data$Date=="1/2/2007" )
daat22<-subset(data,  data$Date=="2/2/2007")
data2<-rbind(data21, daat22)
rm(data)

#CHANGE DATE FORMAT
Date_Time<-strptime (paste(data2[,1], data2[,2]), format= "%d/%m/%Y %H:%M:%S")
data2<-cbind(data2,Date_Time)                
rm(Date_Time)                
data3<-data2[, 3:10]
rm(data2)

#OPEN PNG FILE#
png(file= "plot4.png" ,width = 480, height = 480 )

#GENERATE PLOT 4
par(mfrow=c(2,2), mar=c(4,4,2,2))
plot(data3$Date_Time,as.numeric(as.character(data3$ Global_active_power)), type="l", 
     ylab= "Global Active Power (kilowatts)",xlab="date of the week")

plot(data3$Date_Time,as.numeric(as.character(data3$ Voltage)), type="l", 
     ylab= "Voltage",xlab="date of the week")

plot(data3[,8],as.numeric(as.character(data3[,5])),  type="n", ylab= "Energy sub mettering",xlab="date of the week")
lines(data3[,8],as.numeric(as.character(data3[,5])), col="black")
lines(data3[,8],as.numeric(as.character(data3[,6])), col="red")
lines(data3[,8],as.numeric(as.character(data3[,7])), col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty= c(1,1,1), cex=0.5)

plot(data3$Date_Time,as.numeric(as.character(data3$ Global_reactive_powe)), type="l", 
     ylab= "Global Reactive Power (kilowatts)", xlab="date of the week")


dev.off()
