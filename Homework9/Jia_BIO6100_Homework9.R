# Homework 9 - Strategic Coding Practices
# Grace (Rei) Jia
# 2025-03-26 and 04-02

# Loading libraries
library(pracma)
library(usethis)
library(devtools)
library(upscaler)
library(dplyr)
library(tidyverse)

setwd("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9")

# Seed / Logs

initiate_seed()
set_up_log()

### Question 1 - Data download ###
add_folder()

all_files <- list.files("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9/OriginalData/NEON_count-landbird")

all_files

### Question 2 - Pulling countdata files using a for loops ###
countdata <- c()
  for (i in 1:9) {
    setwd(paste0("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9/OriginalData/NEON_count-landbird", "/", all_files[i]))
      countdata[i] <- list.files(pattern="countdata")

}

countdata

### Question 3 - Create pseudo-code ###

# clean up data and get rid of missing files
# extract year from each file
# calculate abundance
# calculate species richness
# regression model for species richness
# abundance data from each year
# generate histograms w/ abundance + richness from each year

## Functions:
# clean_data
# extract_year
# calculate_abundance
# calculate_speciesrichness
# regression_analysis
# histogram_plot

# build_function <- function (function_name=NULL,
#                           file_prefix=NULL,
#                           file_suffix=NULL)

## Batch Function

setwd("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9")

build_function(c("clean_data",
                 "extract_year",
                 "calculate_abundance",
                 "calculate_speciesrichness",
                 "histogram_plot",
                 "regression"))

source("Functions/CleanData.R")
source("Functions/ExtractYear.R")
source("Functions/CalculateAbundance.R")
source("Functions/CalculateSpeciesrichness.R")
source("Functions/Regression.R")
source("Functions/HistogramPlot.R")

### Question 4 - Making the initial empty data frame ###
final_dataframe <- data.frame(FileNames=rep(NA,9),Years=rep(NA,9),SpeciesAbundance=rep(NA,9),SpeciesRichness=rep(NA,9))

### Question 5 - Using for loops to create functions for batch processing ###
cleaned_count_data <- list.files("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9/CleanedData")

for (i in 1:9){
  read_in_files=read.csv(file = cleaned_count_data[i])
  years = substring(cleaned_count_data[i],13,16)
  final_dataframe$Years[i] <- years
  species_abundance= sum(read_in_files$clusterSize)
  final_dataframe$SpeciesAbundance[i] <- species_abundance
  species_richness=length(unique(read_in_files$scientificName))
  final_dataframe$SpeciesRichness[i] <- species_richness
  final_dataframe$FileNames[i] <- cleaned_count_data[i]
}

final_dataframe
