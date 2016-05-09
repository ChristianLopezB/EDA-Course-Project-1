data<-read.table("household_power_consumption.txt", sep= ";", header = TRUE)
data21<-subset(data, data$Date=="1/2/2007" )
daat22<-subset(data,  data$Date=="2/2/2007")
data2<-rbind(data21, daat22)
rm(data)
Date_Time<-strptime (paste(data2[,1], data2[,2]), format= "%d/%m/%Y %H:%M:%S")
data2<-cbind(data2,Date_Time)                
rm(Date_Time)                
data3<-data2[, 3:10]
rm(data2)


png(file= "plot2.png" ,width = 480, height = 480 )

#PLOT#2
plot(data3$Date_Time,as.numeric(as.character(data3$ Global_active_power)), type="l", 
     ylab= "Global Active Power (kilowatts)",, xlab="date of the week")

dev.off()