### This is the stump script to read the data and plot the maps
### You have to write the code suggested here.
### Feel free to follow the ideas in a different manner/in a different file.
### However, you have to submit your main code file.
###
### The file must be executable on the server!
### I.e. someone else must be able to just run it with 'Rscript maps.R'
### /on server/ and get the correct output.


## read the data
##
## hint1: figure out the correct format and use the correct function.
##
## hint2: read.table and friends are slow (about 6 min to read data).
## You may use data.table::fread instead (a few seconds)
library(dplyr)
library(ggplot2)
library(mapproj)
library(data.table)

geo_data <- decrypt::decryptData(data.table::fread("~/../../opt/data/temp_prec_middle_encrypted.csv.bz2", sep="\t"));
#Taken from slack. Also, trying to use the pipe operator more, so it's a good reference.
NA_data <- filter(geo_data, latitude < 85) %>%
  filter(latitude > 15) %>%
  filter(longitude > 180) %>%
  filter(longitude < 310)

## delete the original (large data) from R workspace
## this is necessary to conserve memory.


## -------------------- do the following for 1960, 1987, 2014 and temp/precipitation --------------------

data_1960 <- filter(NA_data, substr(time, 1, 7) == "1960-06") 
data_1986 <- filter(NA_data, substr(time, 1, 7) == "1986-06") 
data_2014 <- filter(NA_data, substr(time, 1, 7) == "2014-06") 

## select jpg graphics device
jpeg("NA_precipitation_1960.jpg")

## select the correct year - plot longitude-latitude and color according to the temp/prec variable
## I recommend to use ggplot() but you can use something else too.
## 
## Note: if using ggplot, you may want to add "+ coord_map()" at the end of the plot.  This
## makes the map scale to look better.  You can also pick a particular map projection, look
## the documentation.  (You need 'mapproj' library).
## Warning: map projections may be slow (several minutes per plot).

##Taken from ggplot documentation. Also, got some numbers and coord_fixed method from slack.
ggplot(data = filter(data_1960, precipitation != "NA"), aes(x = longitude, y = latitude, col = precipitation)) + 
  geom_point() + coord_map() 

dev.off()
jpeg("NA_temperature_1960.jpg")

ggplot(data = filter(data_1960, airtemp != "NA"), aes(x = longitude, y = latitude, col = airtemp)) + 
  geom_point() + coord_map() 

dev.off()
jpeg("NA_precipitation_1986.jpg")

ggplot(data = filter(data_1986, precipitation != "NA"), aes(x = longitude, y = latitude, col = precipitation)) + 
  geom_point() + coord_map() 

dev.off()
jpeg("NA_temperature_1986.jpg")

ggplot(data = filter(data_1986, airtemp != "NA"), aes(x = longitude, y = latitude, col = airtemp)) + 
  geom_point() + coord_map() 

dev.off()
jpeg("NA_precipitation_2014.jpg")

ggplot(data = filter(data_2014, precipitation != "NA"), aes(x = longitude, y = latitude, col = precipitation)) + 
  geom_point() + coord_map() 

dev.off()

jpeg("NA_temperature_2014.jpg")

ggplot(data = filter(data_2014, airtemp != "NA"), aes(x = longitude, y = latitude, col = airtemp)) + 
  geom_point() + coord_map() 

## close the device
dev.off()

## -------------------- you are done.  congrats :-) --------------------

