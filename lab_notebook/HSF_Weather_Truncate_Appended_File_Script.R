# This script removes the prior data because the Weather Data Logger Appended it rather than overwrote it on the 2019-10-15 download
# This script is needed if the raw .dat files are cleaned again from 2019-10-15

HSF.weather.trunk <- HSF.weather[HSF.weather$DATE > "1990-08-06",]

write.table(HSF.weather.trunk, "./data/HSF_Weather_2019-10-15.csv", sep = ",", quote = F, row.names = F)
