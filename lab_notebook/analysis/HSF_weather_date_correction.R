# HSF Weather Date Correction Script
## This script is to correct the time stamp on the HSF weather station data for the times when the data logger was reset due to a loss of power.

### Import Data

    weather <- read.table("./data/HSF_weather_2019-09-28.csv", header = T, sep = ",")

### Create variable for the correct final TIMESTAMP
    
    end.time <- as.POSIXct("2019-09-29 07:00:00") # this is the time from the file stamp that indicates when the file was created during the data download rounded to the nearest prior 30-minute interval to correspond with the logging interval.
    
    logger.end.time <- as.POSIXct(max(as.POSIXct(weather$TIMESTAMP))) # this finds the last time recorded by the logger, which should correspond to the time of the data download.
    
    time.correction <- end.time - logger.end.time # determines the number of days offset between the logger time and the acutal time
    
    TIMESTAMP.corr <- as.POSIXct(weather$TIMESTAMP) + time.correction
    
    
    weather.corr <- data.frame(weather, TIMESTAMP.corr)
    
    write.table(weather.corr, "./data/HSF_weather_2019-09-28.csv", quote = F, row.names = F, sep = ",")
    