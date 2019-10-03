# This script is to clean the single file of 2015 - 2018 YSI data from HSF

## Metadata

The data were combined into a single .csv file from the KOR software by DML

## Import Data

    YSI <- read.table("data/HSF_YSI_2015-2018.csv", header = T, sep = ",", skipNul = T, encoding = "latin1")
    
    date.time <- paste(as.character(YSI$Date), as.character(YSI$Time))
   
## Convert date to YYYY-MM-DD HH:MM:SS
    
    #date <- strptime(as.character(date), format = "%m/%d/%Y") # this may not work
    date.time <- strptime(as.character(date.time), format = "%m/%d/%y %H:%M:%S") # produces POSIXlt, which is a list
    DateTime <- as.POSIXct(date.time) # converts to POSIXct, which can be used as a variable

## Add the DateTime Variable Back to the YSI data.frame
    
    YSI <- data.frame(DateTime, YSI)
    