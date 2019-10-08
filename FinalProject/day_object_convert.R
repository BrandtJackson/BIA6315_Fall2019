file <- "https://raw.githubusercontent.com/xhp4y8/BIA6315_Fall2019/master/FinalProject/day.csv"
day <- read.csv(file)

#Check for leap year. We have two years worth of data.
library(lubridate)
leap_year(2011)
leap_year(2012) #should be true. So 2012 is a leap year.
# 365 days in 2011 + 366 days in 2012 = 731 days. 
# That's why the day dataframe has 731 observations.

# xts object with leap year
# xts does not require any special instructions to pick up leap year
library(xts)
dates <- as.Date(day$dteday) #create Date class
#convert all columns except dteday (column 2) to xts
day.xts <-xts(day[,-2], order.by=dates)
plot(day.xts$cnt) #plot number of bikes
index(head(day.xts)) #checking the dates for first 6 observations
index(tail(day.xts)) #checking the dates for last 6 observations. Notice we're still in 2012. 

#zoo object with leap year
library(zoo)
day.zoo <- zoo(day[,-2], order.by=dates)
autoplot(day.zoo$cnt)
index(head(day.zoo)) 
index(tail(day.zoo)) #good!

#ts object with leap year. A LOT HARDER.
library(lubridate)
#ts needs to know that there are 365 days + 6 hours in a year.
day_cnt.ts <- ts(day$cnt, start=decimal_date(as.Date("2011-01-01")), frequency = 365.25)
autoplot(day_cnt.ts)
head(day_cnt.ts)
tail(day_cnt.ts)#we are still within 2012. Did not cross into 2013.
plot(decompose(day_cnt.ts))
plot(stl(day_cnt.ts, s.window="periodic"))
