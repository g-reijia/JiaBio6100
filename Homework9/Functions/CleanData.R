# --------------------------------------
# FUNCTION clean_data
# required packages: tidyverse
# description: removing NA from bird count
# inputs: path to csv file
# outputs: csv file to CleanData folder
########################################

years <- c(2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023)
for (i in 1:9){
  setwd(paste0("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9/OriginalData/NEON_count-landbird", "/", all_files[i]))
  removed_NA<-read.csv(file = countdata[i], na.strings = c("","NA"))
  removed_scientificName<-removed_NA[complete.cases(removed_NA["scientificName"]), ]
  setwd("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9/CleanedData")
  write.csv(removed_scientificName,paste0("CleanedData_",years[i],".csv"))
}# end of function clean_data
# --------------------------------------
# clean_data()
