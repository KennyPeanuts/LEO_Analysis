# Cleaning Script for .dat files that are exported from the HSF Weather Station

## Enter User Data
### Input filenames

   input.T1.raw.file <- "./data/HSF_Weather_2019-11-11_Table1.dat"
   input.T2.raw.file <- "./data/HSF_Weather_2019-11-11_Table2.dat"
   
   output.T1.data.file <- "./data/HSF_weather_2019-11-11_T1_data.csv" 
   output.T2.data.file <- "./data/HSF_weather_2019-11-11_T2_data.csv" 
   
   output.clean.file <- "./data/HSF_weather_2019-11-11.csv" 
    # file name format = ./data/site_date.csv

   metadata.file <- "./data/metadata/HSF_weather_2019-11-11_metadata.txt" 
    # file name format = ./data/site_date.csv


## Import the data file as text
   
   HSF.weather.T1.raw <- readLines(input.T1.raw.file, skipNul = T)
   HSF.weather.T2.raw <- readLines(input.T2.raw.file, skipNul = T)

### Notes

    # At this point the data file contains 5 lines of metadata before the data begin and the variable names are on line 2

## Extract metadata
### Remove the header information from the metadata

    HSF.weather.T1.header <- HSF.weather.T1.raw[2]
    HSF.weather.T2.header <- HSF.weather.T2.raw[2]

### Extract the total metadata
    
    HSF.weather.T1.metadata <- HSF.weather.T1.raw[c(1:4)]
    HSF.weather.T2.metadata <- HSF.weather.T2.raw[c(1:4)]

### Remove the metadata from the file
    
    HSF.weather.T1.wo.head <- HSF.weather.T1.raw[-c(1:4) ]
    HSF.weather.T2.wo.head <- HSF.weather.T2.raw[-c(1:4) ]
    
## Add header information to the data file
    
    HSF.weather.T1 <- c(HSF.weather.T1.header, HSF.weather.T1.wo.head)
    HSF.weather.T2 <- c(HSF.weather.T2.header, HSF.weather.T2.wo.head)

## Write to csv file

    writeLines(HSF.weather.T1, con = output.T1.data.file) 
    writeLines(HSF.weather.T2, con = output.T2.data.file) 

## Import raw data-only csv file as a data.frame
    
    HSF.weather.T1 <- read.table(output.T1.data.file, header = T, sep = ",")
    HSF.weather.T2 <- read.table(output.T2.data.file, header = T, sep = ",")
    
## Merge T1 and T2   

   HSF.weather <- merge(HSF.weather.T1, HSF.weather.T2, by = "TIMESTAMP")
   
## Clean up TIMESTAMP
### Convert TIMESTAMP to POSIXct

    HSF.weather$TIMESTAMP <- as.POSIXct(HSF.weather$TIMESTAMP)
    
### Create DATE variable
    
    DATE <- as.Date(strptime(HSF.weather$TIMESTAMP, format = "%Y-%m-%d"))

### Add DATE to HSF.weather data.frame
    
    HSF.weather <- data.frame(DATE, HSF.weather)


## Write new data file of cleaned data

    write.table(HSF.weather, file = output.clean.file, row.names = F, quote = F, sep = ",")

## Generate Metadata
    
### Combine T1 and T2 metadata files
    
    HSF.weather.metadata <- c(HSF.weather.T1.metadata, HSF.weather.T2.metadata)

### Write to metadata text file
   
    writeLines(HSF.weather.metadata, con = metadata.file) 
    
### Remove temp files
    
    file.remove(output.T1.data.file, showWarnings = T)
    file.remove(output.T2.data.file, showWarnings = T)
    
    
# This script removes the prior data because the Weather Data Logger Appended it rather than overwrote it on the 2019-10-15 download
# This script is needed if the raw .dat files are cleaned again from 2019-10-15
    
    # HSF.weather.trunk <- HSF.weather[HSF.weather$DATE > "1990-08-06",]
    
    # HSF.weather <- HSF.weather.trunk 
    