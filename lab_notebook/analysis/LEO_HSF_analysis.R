#LEO Dock Data, YSI


#import data

YSI <- read.table("./data/HSF_YSI.csv", header = T, sep = ",")
pres <- read.table("./data/pressure.csv", header = T, sep = ",")


### Convert Date to POSIXct
#### This code only works if the data are YYYY-MM-DD in the original csv file
YSI$Date <- as.POSIXct(YSI$Date)
pres$Date.Time <- as.POSIXct(pres$Date.Time)


# Data Analysis
### Analyze by Time
# Create proxy numeirc variable for time for the YSI data frame
time_point <- 1:length(YSI$Date) # Date used but any variable will work

#### Plot of Oxygen 2017-11-01
plot(ODO ~ time_point, data = YSI, subset = Date >= "2017-11-01" & Date <= "2017-11-01" , type= "p", ylab = "Dissolved Oxygen (mg/L)", main = "2017-11-01" , col= "blue", pch = 1, ylim = c(5, 15))


#### Plot of Oxygen and depth spring
par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
plot(ODO ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "Dissolved Oxygen (mg/L)", main = "Spring" , col= "blue", pch = 1, axes = F, ylim = c(5, 15))
axis(2)
box()
par(mar = c(2, 5, 0, 5))
plot(Value ~ Date.Time, data = pres, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)")


## Plots by Season
### FDOM by Season
boxplot(YSI$FDOM[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$FDOM[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$FDOM[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

### ODO by Season 
#### All Data
boxplot(YSI$ODO[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$ODO[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$ODO[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

#### By Daily Mean
sp_ODO_day_mean <- as.numeric(tapply(YSI$ODO[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_ODO_day_mean <- as.numeric(tapply(YSI$ODO[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_ODO_day_mean <- as.numeric(tapply(YSI$ODO[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

##### Plot
boxplot(sp_ODO_day_mean, winter_ODO_day_mean, fall_ODO_day_mean, axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

##### Combined Plot
par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$ODO[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$ODO[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$ODO[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F, ylim = c(3, 20))
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_ODO_day_mean, winter_ODO_day_mean, fall_ODO_day_mean, axes = F, ylim = c(3, 20))
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()

### SAL by Season
boxplot(YSI$SAL[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$SAL[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$SAL[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F) 
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

### TURB by Season
boxplot(YSI$TURB[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$TURB[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$TURB[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F) 
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

### pH by Season 
boxplot(YSI$PH[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$PH[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$PH[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F) 
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

# Correlation with Salinity by Season
    par(las = 1)
    plot(FDOM ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), pch = ".")
    points(FDOM ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2, pch = ".")
    points(FDOM ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3, pch = ".")
    legend(0, 10, c("Spring", "Winter", "Fall"), pch = 19, col = c(1, 2, 3))
    
    plot(ODO ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), ylim = c(0, 20), pch = ".")
    points(ODO ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2, pch = ".")
    points(ODO ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3, pch = ".")
    
    plot(PH ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), ylim = c(7, 9), pch = ".")
    points(PH ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2, pch = ".")
    points(PH ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3, pch = ".")
    
    plot(TURB ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), ylim = c(0, 30), pch = ".")
    points(TURB ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2, pch = ".")
    points(TURB ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3, pch = ".")
    
    