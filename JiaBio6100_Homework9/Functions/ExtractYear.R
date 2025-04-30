# --------------------------------------
# FUNCTION extract_year
# required packages: none
# description: extracting year from countdata
# inputs: path
# outputs: years extracted
########################################

extract_year <- function(file_name = NULL){
    year <- str_extract(file_name, pattern="20\\d{2}")
    return(year)
}
#return(print('...checking function: extract_year()'))


# end of function extract_year
# --------------------------------------
# extract_year()
