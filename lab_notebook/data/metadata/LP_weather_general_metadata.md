# General Metadata for Lancer Park Environmental Education Center Atmospheric Sampling Station

## Files

Specific metadata for each deployment can be found as text files with the file format of:

    LP_weather_YYYY-MM-DD_metadata.txt
    
Where YYYY-MM-DD is the date that the sampling period ended.

## Metadata File Created

  * 2019-10-27 by KF
  
## File Modified

## Description

These data are from a weather station installed at the Longwood University Environmental Education Center at Lancer Park (37.308189, -78.402768) as part of the Longwood Environmental Observatory.

All data are CC-BY and should be cited using the DOI available at https://zenodo.org/communities/leo/

## Station Specifics

  The specific at each site are:

    * Barometric Pressure (mmHg) - Campbell Scientific CS100 Barometric Pressure Sensor
    * Light Flux Density (kW/m^2) - Campbell Scientific Pyranometer CS300
    * Light Total Flux (kJ/m^2) - Campbell Scientific Pyranometer CS300
    * Rainfall (mm) - Texas Electronics TE525 Tipping Bucket
    * Temperature (dC) - Campbell Scientific CS215 Temperature and Relative Humidity Sensor
    * Relative Humidity (%) - Campbell Scientific CS215 Temperature and Relative Humidity Sensor
    * Wind Speed (m/s) - RM Young 05103 Wind Speed and Direction Sensor
    * Wind Direction (degrees from true N) - RM Young 05103 Wind Speed and Direction Sensor
    * Data Collection - Campbell Scientific CR200 Data Logger
        * The sensors are sampled every 15 minutes
 
## Measurement Parameters, units, and Variable Names

    * DATE - the date that the record was collected (YYYY-MM-DD)
    * TIMESTAMP - the date and time that the record was collected (YYYY-MM-DD HH:MM:SS)
    * RECORD.x - a unique identifying number provided from the data logger for table 1 from the original downloaded data. 
    * BattV_Avg - The average battery voltage (Volts)
    * BattV - The battery voltage at the time of the sampling (Volts)
    * BP_mmHg_Avg - The average barometric pressure over the sampling interval (mmHg)
    * BP_mmHg_Std - The standard deviation of the average barometric pressure (mmHg)
    * BP_mmHg - The barometric pressure at the time of the sampling (mmHg)
    * Rain_mm_Tot - The total rainfall during the sampling interval (mm)
    * AirTC_Avg - The average air temperature during the sampling interval (dC) 
    * AirTC_Std - The standard deviation of the average air temperature (dC) 
    * AirTC - the air temperature at the time of the sampling (dC)
    * RH - the relative humidity at the time of the sampling (%)
    * RH_Min - the minimum relative humidity recorded (%)
    * RH_TMn - the time that the minimum relative humidity measurement occurred (YYYY-MM-DD HH:MM:SS) 
    * RH_Max - the maximum relative humidity recorded (%)
    * RH_TMx - the time that the maximum relative humidity measurement occurred (YYYY-MM-DD HH:MM:SS)
    * RECORD.y - a unique identifying number provided from the data logger for table 1 from the original downloaded data.
    * BattV_Min - the minimum battery voltage (Volts)
    * SlrkW_Avg - the average light flux density during the sampling interval (kW/m^2) 
    * SlrkW_Std - the standard deviation of the average light flux density (kW/m^2)
    * SlrkW - the light flux density at the time of the sampling (kW/m^2)
    * SlrMJ_Tot - the total light flux (MJ/m^2) 
    * WS_ms_Avg - the average wind speed during the sampling interval (m/s) 
    * WS_ms_Std - the standard deviation of the average wind speed (m/s) 
    * WS_ms - the wind speed at the time of the sampling event (m/s)
    * WindDir - the wind direction at the time of the sampling event (degrees from true N)
    * WS_ms_S_WVT - the average wind speed over the previous 15 minutes (m/s)
    * WindDir_D1_WVT - the average wind direction over the previous 15 minutes (degrees from true N)
    * WindDir_SD1_WVT - the standard deviation of the average wind direction over the previous 15 minutes (degrees from true N)
