#installing and opening packages for the GO analysis
install.packages("gprofiler2")
library(gprofiler2)

#Running the GO analysis with Ensemble IDs and Organism
gostres_neuro_limma <- gost(query = c(Ens_neuro_limma),
                organism = "hsapiens", ordered_query = FALSE, significant = TRUE)
head(gostres_neuro_limma$result)
plot_GO_neuro_limma <- gostplot(gostres_neuro_limma, capped = FALSE, interactive = FALSE)
plot_GO_neuro_limma
gostres_nonneuro_limma <- gost(query = c(Ens_nonneuro_limma),
                            organism = "hsapiens")
head(gostres_nonneuro_limma$result)
plot_GO_nonneuro_limma <- gostplot(gostres_nonneuro_limma, capped = FALSE, interactive = FALSE)
plot_GO_nonneuro_limma
