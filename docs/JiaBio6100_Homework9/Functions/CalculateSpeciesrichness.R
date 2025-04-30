# --------------------------------------
# FUNCTION calculate_speciesrichness
# required packages: none
# description: extracting species richness using scientific names of birds
# inputs: csv
# outputs: total richness per year and populating it into final_dataframe
########################################

calculate_speciesrichness <- function(df = NULL){

# Function body
  species_richness <- length(unique(df$scientificName))
  return(species_richness)
}
# end of function calculate_speciesrichness
# --------------------------------------
# calculate_speciesrichness()
