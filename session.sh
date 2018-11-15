#!/bin/bash
# --------------------------------------------------------------------------------
# document here the main bash commands you are using for the server access.  The file contains
# two parts: the first one for the commands you run on your laptop, and the second one for the
# commands on the remote server.
# 
# The question lists give your some guidance what to do and report but you are free to do it
# in a different way.  If you use a graphical frontend instead of scp for copying files,
# just say which one in the appropriate place.
#
# Note: this file does not to be runnable
#
# -------------------- local commands --------------------
# 1. create a directory for this project.
## C:\Users\User\OneDrive\Document\Info-201\Homework\a6-server-Escohen98 (working directory)
# 2. log onto the server
## $ ssh escohen@info201.ischool.uw.edu
## The authenticity of host 'info201.ischool.uw.edu (128.95.157.89)' can't be established.
## ECDSA key fingerprint is SHA256:k23q1LmvNFUi2ouCt/19VYoiIqnSJ39k1CNwrwGBDrw.
## Are you sure you want to continue connecting (yes/no)? y
## Please type 'yes' or 'no': yes
## Warning: Permanently added 'info201.ischool.uw.edu,128.95.157.89' (ECDSA) to the list of known hosts.
## escohen@info201.ischool.uw.edu's password: *************** (not to length)
## Creating home directory for escohen.
## [escohen@info201 ~]$

# 3. copy the small data subset from the server to your local machine
##scp escohen@info201.inschool.uw.edu:../../opt/data/temp_prec_tiny.csv.bz2 ./data

# 4. copy your R-script to the server
##scp maps.r escohen@info201.ischool.uw.edu:~/Map_Project/


# 5. (after succesfully running the script remotely): copy the output files back to your computer
##scp escohen@info201.ischool.uw.edu:/Map_Project/NA_precipitation_2014.jpg ./data/
##scp escohen@info201.ischool.uw.edu:/Map_Project/NA_temperature_2014.jpg ./data/
##scp escohen@info201.ischool.uw.edu:/Map_Project/NA_precipitation_1986.jpg ./data/
##scp escohen@info201.ischool.uw.edu:/Map_Project/NA_temperature_1986.jpg ./data/
##scp escohen@info201.ischool.uw.edu:/Map_Project/NA_precipitation_1960.jpg ./data/
##scp escohen@info201.ischool.uw.edu:/Map_Project/NA_temperature_1960.jpg ./data/

# 6. inspect that the copy was successful
##file ./data/Map_Project/NA_precipitation_2014.jpg 
### Example Output:
####NA_precipitation_2014.jpg: JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, 
####segment length 16, baseline, precision 8, 480x480, frames 3
##file ./data/Map_Project/NA_temperature_2014.jpg 
##file ./data/Map_Project/NA_precipitation_1986.jpg
##file ./data/Map_Project/NA_temperature_1986.jpg 
##file ./data/Map_Project/NA_precipitation_1960.jpg 
##file ./data/Map_Project/NA_temperature_1960.jpg 

# -------------------- remote commands --------------------
# 1. explore the data directory '/opt/data'.  How do you find out the size of the files?
## cd ../../opt/data
##ls -l *
# 2. explore the first few lines of the small sample data
##bzcat temp_prec_tiny.csv.bz2 | head -3

# 3. create a directory for this project
## mkdir ~/Map_Project
# 4. (after copying your code from the laptop): inspect the files in the project directory
## cd ~/Map_Project
## ls 
# 5. run your script
## Rscript maps.R
# 6. How do you install missing R packages?
## R
## install.packages(c("dplyr", "mapproj", "ggplot2", "data.table", "R.utils"))
# 7. (after running the script): inspect the folder for output files
## [escohen@info201 Map_Project]$ ls
## maps.R                     NA_precipitation_2014.jpg  NA_temperature_2014.jpg
## NA_precipitation_1960.jpg  NA_temperature_1960.jpg
## NA_precipitation_1986.jpg  NA_temperature_1986.jpg
