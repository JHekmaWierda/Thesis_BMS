#installing and opening packages for the GO analysis
install.packages("gprofiler2")
library(gprofiler2)


## intersection
#Running the GO analysis with Ensemble IDs and Organism on intersection general
gostres_intersection <- gost(query = c(ENS_intersection),
                            organism = "hsapiens", ordered_query = FALSE, significant = TRUE)
head(gostres_intersection$result)
plot_GO_intersection <- gostplot(gostres_intersection, capped = FALSE, interactive = FALSE)
plot_GO_intersection

#Running the GO analysis with Ensemble IDs and Organism on intersection upregulated
gostres_intersection_up <- gost(query = c(ENS_intersection_up),
                             organism = "hsapiens", ordered_query = FALSE, significant = TRUE)
head(gostres_intersection_up$result)
plot_GO_intersection_up <- gostplot(gostres_intersection_up, capped = FALSE, interactive = FALSE)
plot_GO_intersection_up

#Running the GO analysis with Ensemble IDs and Organism on intersection downregulated
gostres_intersection_down <- gost(query = c(ENS_intersection_down),
                                organism = "hsapiens", ordered_query = FALSE, significant = TRUE)
head(gostres_intersection_down$result)
plot_GO_intersection_down <- gostplot(gostres_intersection_down, capped = FALSE, interactive = FALSE)
plot_GO_intersection_down



## neuro - nonneuro
#Running the GO analysis with Ensemble IDs and Organism on neuro - nonneuro general
gostres_neuro_minus_nonneuro <- gost(query = c(ENS_neuro_minus_nonneuro),
                               organism = "hsapiens")
head(gostres_neuro_minus_nonneuro$result)
plot_GO_neuro_minus_nonneuro <- gostplot(gostres_neuro_minus_nonneuro, capped = FALSE, interactive = FALSE)
plot_GO_neuro_minus_nonneuro

#Running the GO analysis with Ensemble IDs and Organism on neuro - nonneuro upregulated
gostres_neuro_minus_nonneuro_up <- gost(query = c(ENS_neuro_minus_nonneuro_up),
                                     organism = "hsapiens")
head(gostres_neuro_minus_nonneuro_up$result)
plot_GO_neuro_minus_nonneuro_up <- gostplot(gostres_neuro_minus_nonneuro_up, capped = FALSE, interactive = FALSE)
plot_GO_neuro_minus_nonneuro_up

#Running the GO analysis with Ensemble IDs and Organism on neuro - nonneuro downregulated
gostres_neuro_minus_nonneuro_down <- gost(query = c(ENS_neuro_minus_nonneuro_down),
                                     organism = "hsapiens")
head(gostres_neuro_minus_nonneuro_down$result)
plot_GO_neuro_minus_nonneuro_down <- gostplot(gostres_neuro_minus_nonneuro_down, capped = FALSE, interactive = FALSE)
plot_GO_neuro_minus_nonneuro_down

#neuro - nonneuro up and down in one plot
multi_gp_neuro_minus_nonneuro = gost(list("up-regulated" = ENS_neuro_minus_nonneuro_up,
                     "down-regulated" =  ENS_neuro_minus_nonneuro_down))
p2 = gostplot(multi_gp_neuro_minus_nonneuro, interactive = FALSE)
publish_gostplot(p2, highlight_terms = c("CORUM:7523", "CORUM:7524", "CORUM:7517",
                                         "CORUM:7368", "CORUM:5261",
                                         "CORUM:6815","CORUM:351","CORUM:1181"," CORUM:33",
                                         "CORUM:112", "CORUM:835", "CORUM:562"))


##nonneuro - neuro
#Running the GO analysis with Ensemble IDs and Organism on nonneuro - neuro
gostres_nonneuro_minus_neuro <- gost(query = c(ENS_nonneuro_minus_neuro),
                                     organism = "hsapiens")
head(gostres_nonneuro_minus_neuro$result)
plot_GO_nonneuro_minus_neuro <- gostplot(gostres_nonneuro_minus_neuro, capped = FALSE, interactive = FALSE)
plot_GO_nonneuro_minus_neuro

#Running the GO analysis with Ensemble IDs and Organism on nonneuro - neuro upregulated
gostres_nonneuro_minus_neuro_up <- gost(query = c(ENS_nonneuro_minus_neuro_up),
                                     organism = "hsapiens")
head(gostres_nonneuro_minus_neuro_up$result)
plot_GO_nonneuro_minus_neuro_up <- gostplot(gostres_nonneuro_minus_neuro_up, capped = FALSE, interactive = FALSE)
plot_GO_nonneuro_minus_neuro_up

#Running the GO analysis with Ensemble IDs and Organism on nonneuro - neuro downregulated
gostres_nonneuro_minus_neuro_down <- gost(query = c(ENS_nonneuro_minus_neuro_down),
                                     organism = "hsapiens")
head(gostres_nonneuro_minus_neuro_down$result)
plot_GO_nonneuro_minus_neuro_down <- gostplot(gostres_nonneuro_minus_neuro_down, capped = FALSE, interactive = FALSE)
plot_GO_nonneuro_minus_neuro_down

#nonneuro - neuro up and down in one plot
multi_gp_nonneuro_minus_neuro = gost(list("up-regulated" = ENS_nonneuro_minus_neuro_up,
                                          "down-regulated" =  ENS_nonneuro_minus_neuro_down))
p3 = gostplot(multi_gp_nonneuro_minus_neuro, interactive = FALSE)
publish_gostplot(p3, highlight_terms = c("CORUM:6824", "GO:0002227", "GO:0002385",
                                         "GO:0002251", "GO:0019731",
                                         "GO:0061844","CORUM:306","CORUM:308"," CORUM:3055",
                                         "CORUM:305", "CORUM:338", "CORUM:5380"))
#neuro - nonneuro vs nonneuro - neuro up plot
multi_gp_nonneuro_minus_neuro_up = gost(list("neuro - nonneuro" = ENS_neuro_minus_nonneuro_up,
                                          "nonneuro - neuro" =  ENS_nonneuro_minus_neuro_up))
p4 = gostplot(multi_gp_nonneuro_minus_neuro_up, interactive = FALSE)
publish_gostplot(p4, highlight_terms = c("CORUM:6824", "GO:0002227", "GO:0002385",
                                         "GO:0002251", "GO:0019731",
                                         "GO:0061844","CORUM:351","CORUM:1181"," CORUM:33",
                                         "CORUM:112", "CORUM:835", "CORUM:562"))
#downregulated
multi_gp_nonneuro_minus_neuro_down = gost(list("neuro - nonneuro" = ENS_neuro_minus_nonneuro_down,
                                             "nonneuro - neuro" =  ENS_nonneuro_minus_neuro_down))
p5 = gostplot(multi_gp_nonneuro_minus_neuro_down, interactive = FALSE)
publish_gostplot(p5, highlight_terms = c("CORUM:7523", "CORUM:7524", "CORUM:7517",
                                         "CORUM:7368", "CORUM:5261",
                                         "CORUM:6815","CORUM:306","CORUM:308"," CORUM:3055",
                                         "CORUM:305", "CORUM:338", "CORUM:5380"))
