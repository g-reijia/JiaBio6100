# --------------------------------------
# FUNCTION histogram_plot
# required packages: ggplot2
# description: making a histogram plot summarizing species richness and abundance from count data
# inputs: .csv files
# outputs: histogram plot
########################################

# Create histogram and add labels to bins
# Load necessary library
histogram_plot <- function(new_dataframe=NULL){

  # Plot the histogram for abundance
abundance_histogram <- ggplot(new_dataframe, aes(x = as.factor(year), y = abundance)) +
    geom_bar(stat = "identity", fill = "blue" ) +
    labs(x = "Year", y = "Species Abundance") +
    theme_minimal()
  abundance_plot

richness_histogram <- ggplot(new_dataframe, aes(x = as.factor(year), y = species_richness)) +
    geom_bar(stat = "identity", fill = "green" ) +
    labs(x = "Year", y = "Species Richness") +
    theme_minimal()
  speciesRichness_plot

  print(abundance_histogram)
  print(richness_histogram )

}

# end of function histogram_plot()


# --------------------------------------
# gen_histo()
