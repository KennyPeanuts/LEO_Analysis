# This script is to clean the single file of 2015 - 2018 YSI data from HSF

## Metadata

The data were combined into a single .csv file from the KOR software by DML

## Import Data

    YSI <- read.table("./data/HSF_YSI_2015-2018.csv", header = T, sep = ",", skipNul = T, encoding = "latin1")
    
    date.time <- paste(as.character(YSI$Date), as.character(YSI$Time))
    
### Fix the weird character in Date
    
    names(YSI)[1] <- "Date"
    
## Convert date to YYYY-MM-DD HH:MM:SS
    
    Date <- strptime(as.character(YSI$Date), format = "%m/%d/%Y")
    Time <- strptime(as.character(YSI$Time), format = "%H:%M:%S")
    DateTime <- c(Date, Time)

## Add the DateTime Variable Back to the YSI data.frame
    
    YSI <- data.frame(DateTime, YSI)
    
## Remove variable X at end of the data.frame
    
    YSI <- YSI[-32]
    
## Write to file
    
    write.table(YSI, "./data/HSF_YSI_2015-2018.csv", quote = F, row.names = F, sep = ",")
    