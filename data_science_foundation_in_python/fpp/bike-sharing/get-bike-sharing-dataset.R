# taken from https://github.com/christophM/interpretable-ml-book/blob/master/R/get-bike-sharing-dataset.R
day_diff = function(date1, date2){
  as.numeric(difftime(as.Date(date1), as.Date(date2), units = 'days'))
}

bike = read.csv('bike-sharing-daily.csv', stringsAsFactors = FALSE)
# See http://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset

bike$weekday = factor(bike$weekday, levels=0:6, labels = c('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'))
bike$holiday = factor(bike$holiday, levels = c(0,1), labels = c('NO HOLIDAY', 'HOLIDAY'))
bike$workingday = factor(bike$workingday, levels = c(0,1), labels = c('NO WORKING DAY', 'WORKING DAY'))
bike$season = factor(bike$season, levels = 1:4, labels = c('SPRING', 'SUMMER', 'FALL', 'WINTER'))
bike$weathersit = factor(bike$weathersit, levels = 1:3, labels = c('GOOD', 'MISTY', 'RAIN/SNOW/STORM'))
bike$yr[bike$yr == 0] = 2011
bike$yr[bike$yr == 1] = 2012
bike$yr = factor(bike$yr)
bike$days_since_2011 = day_diff(bike$dteday, min(as.Date(bike$dteday)))

# denormalize weather features:

# temp : Normalized temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-8, t_max=+39 (only in hourly scale)
bike$temp = bike$temp * (39 - (-8)) + (-8)

# atemp: Normalized feeling temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), t_min=-16, t_max=+50 (only in hourly scale)
bike$atemp = bike$atemp * (50 - (16)) + (16)

#windspeed: Normalized wind speed. The values are divided to 67 (max)
bike$windspeed = 67 * bike$windspeed

#hum: Normalized humidity. The values are divided to 100 (max)
bike$hum = 100 * bike$hum

write.csv(bike, 'bike-sharing-daily-processed.csv')