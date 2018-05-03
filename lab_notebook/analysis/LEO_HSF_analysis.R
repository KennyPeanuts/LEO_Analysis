#LEO Dock Data, YSI


#import data

YSI <- read.table("./data/HSF_YSI.csv", header = T, sep = ",")
pres <- read.table("./data/pressure.csv", header = T, sep = ",")


### Convert Date to POSIXct
#### This code only works if the data are YYYY-MM-DD in the original csv file
YSI$Date <- as.POSIXct(YSI$Date)
pres$Date.Time <- as.POSIXct(pres$Date.Time)


# Data Analysis
## Determine Range and Variation of Parameters

    hist(YSI$ODOSAT)
    hist(YSI$ODO)
    hist(YSI$TURB)
    hist(YSI$TEMP)
    hist(YSI$SAL)
    hist(YSI$FDOM)
    hist(YSI$PH)
    
### Analyze by Time
# Create proxy numeirc variable for time for the YSI data frame
time_point <- 1:length(YSI$Date) # Date used but any variable will work

#### Plot of Oxygen 2017-11-01
plot(ODO ~ time_point, data = YSI, subset = Date >= "2017-11-01" & Date <= "2017-11-01" , type= "p", ylab = "Dissolved Oxygen (mg/L)", main = "2017-11-01" , col= "blue", pch = 1, ylim = c(5, 15))


#### Plot of Oxygen and depth 2018-02-17
par(mfcol = c(2, 1),  mar = c(2, 10, 2, 2))
plot(ODO ~ time_point, data = YSI, subset = Date >= "2018-02-17" & Date <= "2018-02-17" , type= "p", ylab = "Dissolved Oxygen (mg/L)", main = "2018-02-17" , col= "blue", pch = 1, axes = F, ylim = c(5, 15))
axis(2)
#axis(1, c("00:30:00", "05:15:00", "10:15:00", "15:15:00"), at = c(10240, 10260, 10280, 10300))
box()
plot(Pressure ~ Date.Time, data = pres, subset = Date.Time < "2018-02-17 24:59:59" & Date.Time > "2018-02-16 24:59:59")

#### Plot of Oxygen 
par(mfcol = c(2, 1),  mar = c(2, 10, 2, 2))
plot(ODO ~ time_point, data = YSI, subset = Date < "2018-04-14" & Date > "2018-04-01" , type= "p", ylab = "ODO (mg/L)", main = "2018-02-17" , col= "blue", pch = 1, axes = F, ylim = c(5, 15))
axis(2)
#axis(1, c("00:30:00", "05:15:00", "10:15:00", "15:15:00"), at = c(10240, 10260, 10280, 10300))
box()
plot(Pressure ~ Date.Time, data = pres, subset = Date.Time < "2018-04-14 24:59:59" & Date.Time > "2018-04-01
     24:59:59")

####plots

par(mfcol = c(2, 1),  mar = c(2, 10, 2, 2))
plot(FDOM ~ SAL, data = YSI, subset = Date < "2018-02-20" & Date > "2017-11-10" , type= "l", ylab = "TURB", main = "Turbidity"  ,col= "blue", pch = 1, axes = F )
axis(2)
#axis(1, c("00:30:00", "05:15:00", "10:15:00", "15:15:00"), at = c(10240, 10260, 10280, 10300))
box()
plot(FDOM ~ SAL, data = YSI, subset = Date.Time < "2018-02-20 24:59:59" & Date.Time > "2017-11-10 24:59:59" , type= "l")  par(las = 1, mfcol = c(1, 1), mar = c(5, 5, 5, 5)) plot(FDOM ~ SAL, data = YSI, subset = Date < "2017-12-05" & Date > "2017-11-05" , type= "p", ylab = "FDOM", main = "Salinity and FDOM November-December 2017"  ,col= "red", pch = 1, axes = T)  boxplot(YSI$ODO[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$ODO[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$ODO[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F, ylim = c(0, 20)) axis(2) axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3)) box()

## Plots by Season 
boxplot(YSI$FDOM[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$FDOM[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$FDOM[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

boxplot(YSI$SAL[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$SAL[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$SAL[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F) 
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

boxplot(YSI$TURB[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$TURB[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$TURB[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F) 
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

boxplot(YSI$PH[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$PH[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$PH[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F) 
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))

# Correlation by Season
    plot(FDOM ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), pch = ".")
    points(FDOM ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2, pch = ".")
    points(FDOM ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3, pch = ".")
    legend(0, 10, c("Spring", "Winter", "Fall"), pch = 19, col = c(1, 2, 3))
    
    plot(ODO ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), ylim = c(0, 20))
    points(ODO ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2)
    points(ODO ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3)
    
    plot(PH ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), ylim = c(5, 10))
    points(PH ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2)
    points(PH ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3)
    
    plot(TURB ~ SAL, data = YSI, subset = Date < "2018-04-15" & Date > "2018-03-15", xlim = c(0, 20), ylim = c(0, 30), pch = ".")
    points(TURB ~ SAL, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-15", col = 2, pch = ".")
    points(TURB ~ SAL, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-11", col = 3, pch = ".")
    