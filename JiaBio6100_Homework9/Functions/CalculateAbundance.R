# --------------------------------------
# FUNCTION calculate_abundance
# required packages: none
# description: calculating abundance using cluster size
# inputs: csv
# outputs: total abundance per year and populating it into final_dataframe
########################################

calculate_abundance <- function(df = NULL){

# Function body
  species_abundance <- sum(df$clusterSize, na.rm = TRUE)
  return(species_abundance)
}
# end of function calculate_abundance
# --------------------------------------
# calculate_abundance()
