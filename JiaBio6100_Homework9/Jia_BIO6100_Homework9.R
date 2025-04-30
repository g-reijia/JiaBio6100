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

setwd("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9/Functions")

build_function(c("clean_data",
                 "extract_year",
                 "calculate_abundance",
                 "calculate_speciesrichness"))

### Question 4 - Making the initial empty data frame ###
final_dataframe <- data.frame(FileNames=rep(NA,9),Years=rep(NA,9),SpeciesAbundance=rep(NA,9),SpeciesRichness=rep(NA,9))

### Question 5 - Using a for loop to create functions for batch processing ###
cleaned_count_data <- list.files("/Users/reijia/Desktop/Computational_Biology/JiaBio6100_2/Homework9/CleanedData")

# Counter to populate the data frame
i = 1
for (file in cleaned_count_data){
  final_dataframe$FileNames[i] <- file
  final_dataframe$Years[i] <- extract_year(file)
  read_in_file <- read.csv(file)
  final_dataframe$SpeciesAbundance[i] <- calculate_abundance(read_in_file)
  final_dataframe$SpeciesRichness[i] <- calculate_speciesrichness(read_in_file)
  # Adds one to the counter
  i = i+1
}

final_dataframe

### Histogram plots ###
setwd("~/Desktop/Computational_Biology/JiaBio6100_2/Homework9")

abundance_histo <- ggplot(final_dataframe, aes(x = as.factor(years), y = SpeciesAbundance)) +
  geom_bar(stat = "identity", fill = "darkblue" ) +
  labs(x = "Year", y = "Species Abundance", title = "Bird Species Abundance from 2015 to 2023") +
  theme_minimal()
abundance_histo

richness_histo <- ggplot(final_dataframe, aes(x = as.factor(years), y = SpeciesRichness)) +
  geom_bar(stat = "identity", fill = "darkgreen" ) +
  labs(x = "Year", y = "Species Richness", title = "Bird Species Richness from 2015 to 2023") +
  theme_minimal()
richness_histo

ggsave(abundance_histo,file="hw9_abundance_histoplot.png",width=10,height=7,bg = "white")
ggsave(richness_histo,file="hw9_richness_histoplot.png",width=10,height=7,bg = "white")

### Regression analysis ###

reg_model <- lm(SpeciesRichness ~ SpeciesAbundance, data = final_dataframe)
print(reg_model)
