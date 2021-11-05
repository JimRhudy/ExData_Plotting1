#load data; please edit file path as needed for your computing environment
exdata<-read.table("C:/Users/Jim/Desktop/Rwork/ExData_Plotting1/exdata_data_household_power_consumption/household_power_consumption.txt", header = FALSE, sep=";")

# load packages
library(tidyverse)
library(janitor)
library(lubridate)

# data preprocessing steps

# filter data to rows of interest to the assignment
exdata <- exdata %>%
  row_to_names(row_number = 1) %>%
  mutate(
    okayDate=as.Date(Date, format='%d/%m/%Y')
  ) %>%
  filter(
    okayDate=="2007-02-01" | okayDate=="2007-02-02"
  )

# parse date and time to enable plotting

# mutate "weekday" column
exdata <- exdata %>%
  mutate(Weekday=weekdays(okayDate)) 

# parse "Time" variable
exdata <- exdata %>%
  mutate(
    okayTime = hms(Time)
  ) 

# add 24 hours to Thursday dates
exdata <- exdata %>%
  mutate(
    totalTime=ifelse(
      Weekday=="Thursday", as.numeric(okayTime), as.numeric(okayTime) + 86400
    )
  ) 

# contruct plot 4

png("plot4.png", width = 480, height = 480)

par(mar = c(2, 2, 2, 2), mfrow = c(2, 2))

#### first plot
par(mar=c(2, 4, 2, 2))
plot(
  exdata$totalTime,
  as.numeric(exdata$Global_active_power), 
  type="l",
  xlab = "",
  ylab = "Global Active Power",
  axes = FALSE,
  xaxt = "n"
)
axis(1, at = c(0, 86400, 172740), labels = c("Thu", "Fri", "Sat"))
axis(2)

#### second plot
par(mar=c(4, 4, 2, 2))
plot(
  exdata$totalTime,
  exdata$Voltage,
  type="l",
  xlab = "datetime",
  ylab = "Voltage", 
  axes = FALSE,
  xaxt = "n"
)
axis(1, at = c(0, 86400, 172740), labels = c("Thu", "Fri", "Sat"))
axis(2)

#### third plot
plot(
  exdata$totalTime,
  as.numeric(exdata$Sub_metering_1),
  type="l",
  xlab = "",
  ylab = "Energy sub metering",
  axes = FALSE,
  xaxt = "n"
)
axis(1, at = c(0, 86400, 172740), labels = c("Thu", "Fri", "Sat"))
axis(2)
lines(
  exdata$totalTime,
  as.numeric(exdata$Sub_metering_2),
  col="red"
)
lines(
  exdata$totalTime,
  as.numeric(exdata$Sub_metering_3),
  col="blue"
)
legend(
  "topright", 
  legend=c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  ),
  cex=0.75,
  col=c("black", "red", "blue"),
  lty=c(1, 1, 1)
)

#### fourth plot
par(mar=c(4, 4, 2, 2))
plot(
  exdata$totalTime,
  exdata$Global_reactive_power,
  type="l",
  xlab = "datetime",
  ylab = "Global_reactive_power", 
  axes = FALSE,
  xaxt = "n"
)
axis(1, at = c(0, 86400, 172740), labels = c("Thu", "Fri", "Sat"))
axis(2)

dev.off()