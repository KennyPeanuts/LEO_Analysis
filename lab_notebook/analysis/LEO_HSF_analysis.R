#LEO Dock Data, YSI


#import data

YSI <- read.table("./data/HSF_YSI.csv", header = T, sep = ",")
pres <- read.table("./data/Pres_HSF.csv", header = T, sep = ",")


### Convert Date to POSIXct
#### This code only works if the data are YYYY-MM-DD in the original csv file
YSI$Date <- as.POSIXct(YSI$Date)
pres$Date.Time <- as.POSIXct(pres$Date.Time)

################ DATA CLEANING CODE #######################

### Remove very high depth measure bc it prob isn't right
pres_wo_high_value <- pres[pres$Depth < 97,]

### Correct Depth Measurements for the Mount Depth
Depth_to_Bottom <- pres_wo_high_value$Depth + 58.5 # the pressure transducer was mounted 58.5 cm above the bottom

### Removed dates when YSI was in bunkhouse bc of busted dock 
YSI <- YSI[YSI$Date < "2018-04-06",]

# Data Analysis
### Analyze by Time
# Create proxy numeirc variable for time for the YSI data frame
time_point <- 1:length(YSI$Date) # Date used but any variable will work

#--------> Plots of depth and sensor by season

#### Plot of Oxygen and depth spring
#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(ODO ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "Dissolved Oxygen (mg/L)", xlab = "" , col= "blue", pch = 1, axes = F, ylim = c(2, 20))
axis(2)
box()

##### Plot of Depth
par(mar = c(3, 5, 0, 5))
plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)", ylim = c(0, 150))

#### Plot of Oxygen Saturation and depth spring
#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(ODOSAT ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "Percent Oxygen Saturation", xlab = "" , col= "red", pch = 1, axes = F, ylim = c(25, 175))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)", ylim = c(0, 150))

#### plot of turb and depth spring

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(TURB ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "Turbidity (FNU)", xlab = "" , col= "brown4", pch = 1, axes = F, ylim = c(0, 50))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)", ylim = c(0, 150))


####plot of temp and depth spring

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(TEMP ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "Temperature (dC)", xlab = "" , col= "black", pch = 1, axes = F, ylim = c(-5, 20))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)", ylim = c(0, 150))


####plot of cond and depth spring

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(COND/1000 ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "Conductivity (mS/cm)", xlab = "" , col= "darkviolet", pch = 1, axes = F, ylim = c(0, 25))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of salinity and depth spring

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(SAL ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "Salinity ", xlab = "" , col= "deeppink3", pch = 1, axes = F, ylim = c(0, 20))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)")

####plot of FDOM and depth spring

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(FDOM ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "fDOM (QSU)", xlab = "" , col= "darkorange3", pch = 1, axes = F, ylim = c(0, 15))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of ph and depth in Spring

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(PH ~ time_point, data = YSI, subset = Date < "2018-04-09" & Date > "2018-03-15" , type= "l", ylab = "pH", xlab = "" , col= "green3", pch = 1, axes = F, ylim = c(7, 9))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-04-08 24:59:59" & Date.Time > "2018-03-15 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of ODO and depth winter

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(ODO ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "Dissolved Oxygen (mg/L)", xlab = "" , col= "blue", pch = 1, axes = F, ylim = c(2, 20))
axis(2)
box()

#### Plot of Depth in Winter
#par(mar = c(2, 5, 0, 5))
par(mar = c(3, 5, 0, 5))
plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)", ylim = c(0, 150))

#### plot of DO Saturation and depth in Winter
#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(ODOSAT ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "Precent Oxygen Saturation", xlab = "" , col= "red", pch = 1, axes = F, ylim = c(25, 175))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)")

#### plot of turb and depth winter

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(TURB ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "Turbidity (FNU)", xlab = "" , col= "brown4", pch = 1, axes = F, ylim = c(0, 50))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of temp and depth winter

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(TEMP ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "Temperature (dC)", xlab = "" , col= "black", pch = 1, axes = F, ylim = c(-5, 20))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of cond and depth winter

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(COND/1000 ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "Conductivity (mS/cm)", xlab = "" , col= "darkviolet", pch = 1, axes = F, ylim = c(0, 25))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)")


####plot of sal and depth winter

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(SAL ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "Salinity", xlab = "" , col= "deeppink3", pch = 1, axes = F, ylim = c(0, 20))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of FDOM

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(FDOM ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "fDOM (QSU)", xlab = "" , col= "darkorange3", pch = 1, axes = F, ylim = c(0, 15))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of pH in Winter

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(PH ~ time_point, data = YSI, subset = Date < "2018-03-15" & Date > "2017-12-16" , type= "l", ylab = "pH", xlab = "" , col= "green3", pch = 1, axes = F, ylim = c(7, 9))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2018-03-15 24:59:59" & Date.Time > "2017-12-16 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of ODO and depth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(ODO ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "Dissolved Oxygen (mg/L)", xlab = "" , col= "blue", pch = 1, axes = F, ylim = c(2, 20))
axis(2)
box()

#### Plot of Depth in Fall
#par(mar = c(2, 5, 0, 5))
par(mar = c(3, 5, 0, 5))
plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)", ylim = c(0, 150))

#### plot of DO Saturation and  depth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(ODOSAT ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "Percent Oxygen Saturation", xlab = "" , col= "red", pch = 1, axes = F, ylim = c(25, 175))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)")

####plot of turb and depth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(TURB ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "Turbidity (FNU)", xlab = "" , col= "brown4", pch = 1, axes = F, ylim = c(0, 50))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of temp and depeth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(TEMP ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "Temperature (dC)", xlab = "" , col= "black", pch = 1, axes = F, ylim = c(-5, 20))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)")


####plot of cond and depth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(COND/1000 ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "Conductivity (mS/cm)", xlab = "" , col= "darkviolet", pch = 1, axes = F, ylim = c(0, 25))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)")


#### plot of salinity and depth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(SAL ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "Salinity", xlab = "" , col= "deeppink3", pch = 1, axes = F, ylim = c(0, 20))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)")

#### plot of FDOM and depth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(FDOM ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "fDOM (QSU)", xlab = "" , col= "darkorange2", pch = 1, axes = F, ylim = c(0, 15))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)")

#### plot of pH and depth fall

#par(mfcol = c(2, 1),  mar = c(0, 5, 2, 5))
par(mar = c(0, 5, 0, 5))
plot(PH ~ time_point, data = YSI, subset = Date < "2017-12-15" & Date > "2017-11-10" , type= "l", ylab = "pH", xlab = "" , col= "green3", pch = 1, axes = F, ylim = c(7, 9))
axis(2)
box()
#par(mar = c(2, 5, 0, 5))
#plot(Depth_to_Bottom ~ Date.Time, data = pres_wo_high_value, subset = Date.Time < "2017-12-15 24:59:59" & Date.Time > "2017-11-10 24:59:59", type = "l", ylab = "Depth (cm)")


########Total and day mean boxplot by season plots######
#### By Daily Mean
sp_ODO_day_mean <- as.numeric(tapply(YSI$ODO[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_ODO_day_mean <- as.numeric(tapply(YSI$ODO[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_ODO_day_mean <- as.numeric(tapply(YSI$ODO[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

##### ------------->Combined Plot of ODO
#par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$ODO[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$ODO[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$ODO[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F, ylim = c(3, 20), ylab = "Dissolved Oxygen")
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_ODO_day_mean, winter_ODO_day_mean, fall_ODO_day_mean, axes = F, ylim = c(3, 20))
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()

#### plot of TURB

sp_TURB_day_mean <- as.numeric(tapply(YSI$TURB[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_TURB_day_mean <- as.numeric(tapply(YSI$TURB[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_TURB_day_mean <- as.numeric(tapply(YSI$TURB[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$TURB[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$TURB[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$TURB[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F, ylim = c(3, 20))
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_TURB_day_mean, winter_TURB_day_mean, fall_TURB_day_mean, axes = F, ylim = c(3, 20))
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()

#### plot of temp
##### Calculate Means
sp_TEMP_day_mean <- as.numeric(tapply(YSI$TEMP[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_TEMP_day_mean <- as.numeric(tapply(YSI$TEMP[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_TEMP_day_mean <- as.numeric(tapply(YSI$TEMP[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$TEMP[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$TEMP[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$TEMP[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_TEMP_day_mean, winter_TEMP_day_mean, fall_TEMP_day_mean, axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()


sp_COND_day_mean <- as.numeric(tapply(YSI$COND[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_COND_day_mean <- as.numeric(tapply(YSI$COND[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_COND_day_mean <- as.numeric(tapply(YSI$COND[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$COND[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$COND[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$COND[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_COND_day_mean, winter_COND_day_mean, fall_COND_day_mean, axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()

#### plot of Sal

sp_SAL_day_mean <- as.numeric(tapply(YSI$SAL[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_SAL_day_mean <- as.numeric(tapply(YSI$SAL[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_SAL_day_mean <- as.numeric(tapply(YSI$SAL[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$SAL[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$SAL[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$SAL[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_SAL_day_mean, winter_SAL_day_mean, fall_SAL_day_mean, axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()


#### plot fo FDOM

sp_FDOM_day_mean <- as.numeric(tapply(YSI$FDOM[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_FDOM_day_mean <- as.numeric(tapply(YSI$FDOM[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_FDOM_day_mean <- as.numeric(tapply(YSI$FDOM[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$FDOM[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$FDOM[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$FDOM[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_FDOM_day_mean, winter_FDOM_day_mean, fall_FDOM_day_mean, axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()


#### plot of pH

sp_PH_day_mean <- as.numeric(tapply(YSI$PH[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$Date[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], mean))
winter_PH_day_mean <- as.numeric(tapply(YSI$PH[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$Date[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], mean))
fall_PH_day_mean <- as.numeric(tapply(YSI$PH[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], YSI$Date[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], mean))

par(las = 1, mfcol = c(2, 1), mar = c(0, 5, 3, 5)) 
boxplot(YSI$PH[YSI$Date < "2018-04-14" & YSI$Date > "2018-03-15"], YSI$PH[YSI$Date < "2018-03-15" & YSI$Date > "2017-12-15"], YSI$PH[YSI$Date < "2017-12-15" & YSI$Date > "2017-11-11"], axes = F)
axis(2)
box()
par(mar = c(3, 5, 0, 5))
boxplot(sp_PH_day_mean, winter_PH_day_mean, fall_PH_day_mean, axes = F)
axis(2)
axis(1, c("Spring", "Winter", "Fall"), at = c(1, 2, 3))
box()


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
    

    