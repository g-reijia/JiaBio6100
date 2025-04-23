# --------------------------------------
# FUNCTION calculate_speciesrichness
# required packages: none
# description: extracting species richness using scientific names of birds
# inputs: csv
# outputs: data frame
########################################

calculate_speciesrichness <- function(df = NULL){

  # Function body
df <- read.csv(df)
    species_richness <- length(unique(df$scientificName))
    print(species_richness)
    return(species_richness)
}
# end of function calculate_speciesrichness
# --------------------------------------
# calculate_speciesrichness()
