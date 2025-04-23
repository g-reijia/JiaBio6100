# --------------------------------------
# FUNCTION calculate_abundance
# required packages: none
# description: calculating abundance using point count minutes
# inputs: csv
# outputs: data frame
########################################

calculate_abundance <- function(df = NULL){

# Function body
  species_abundance <- sum(df$pointCountMinute)
  print(total_abundance)
  return(total_abundance)

}
# end of function calculate_abundance
# --------------------------------------
# calculate_abundance()
