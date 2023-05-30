#installing and opening packages for the GO analysis
install.packages("gprofiler2")
library(gprofiler2)

#Running the GO analysis with Ensemble IDs and Organism on intersection
gostres_intersection <- gost(query = c(ENS_intersection),
                            organism = "hsapiens", ordered_query = FALSE, significant = TRUE)
head(gostres_intersection$result)
plot_GO_intersection <- gostplot(gostres_intersection, capped = FALSE, interactive = FALSE)
plot_GO_intersection

#Running the GO analysis with Ensemble IDs and Organism on neuro - nonneuro
gostres_neuro_minus_nonneuro <- gost(query = c(ENS_neuro_minus_nonneuro),
                               organism = "hsapiens")
head(gostres_neuro_minus_nonneuro$result)
plot_GO_neuro_minus_nonneuro <- gostplot(gostres_neuro_minus_nonneuro, capped = FALSE, interactive = FALSE)
plot_GO_neuro_minus_nonneuro

#Running the GO analysis with Ensemble IDs and Organism on nonneuro - neuro
gostres_nonneuro_minus_neuro <- gost(query = c(ENS_nonneuro_minus_neuro),
                                     organism = "hsapiens")
head(gostres_nonneuro_minus_neuro$result)
plot_GO_nonneuro_minus_neuro <- gostplot(gostres_nonneuro_minus_neuro, capped = FALSE, interactive = FALSE)
plot_GO_nonneuro_minus_neuro
