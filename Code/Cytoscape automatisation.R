#installing all packages necessary
if(!"rWikiPathways" %in% installed.packages()){
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install("rWikiPathways", update = FALSE)
}
library(rWikiPathways)

load.libs <- c(
  "DOSE",
  "GO.db",
  "GSEABase",
  "org.Hs.eg.db",
  "clusterProfiler",
  "dplyr",
  "tidyr",
  "ggplot2",
  "stringr",
  "RColorBrewer",
  "rWikiPathways",
  "RCy3")
options(install.packages.check.source = "no")
options(install.packages.compile.from.source = "never")
if (!require("pacman")) install.packages("pacman"); library(pacman)
p_load(load.libs, update = TRUE, character.only = TRUE)
status <- sapply(load.libs,require,character.only = TRUE)
if(all(status)){
  print("SUCCESS: You have successfully installed and loaded all required libraries.")
} else{
  cat("ERROR: One or more libraries failed to install correctly. Check the following list for FALSE cases and try again...\n\n")
  status
}

#check if cytoscape is working
cytoscapePing()

# Create a network with use of the String app
neuro.gene.list <- c(Ens_neuro_limma)
gene.str <- paste(neuro.gene.list, collapse = ",")
string.cmd <- paste("string protein query cutoff=0.90 limit=118 query",
                    gene.str, sep = "=")
commandsRun(string.cmd)
renameNetwork("neuro_network", network = "STRING network")

#Upload Expression data
toggleGraphicsDetails()
loadTableData(nonneuro_limma_and_neuro_limma, data.key.column = "hgnc_symbol_", table.key.column = "display name")

# apply visual style 
setVisualStyle("neuro_style")
data.values <- c(-0.28,0,0.28) 
node.colors <- c(rev(brewer.pal(length(data.values), "RdBu")))
setNodeColorMapping("logFC_neuro", data.values, node.colors, default.color = "#D8D8D8", style.name = "neuro_style")

#
Wikipathwayssets1 <- file.path(getwd(), "wikipathways-20220511-hsa-WP (1).xgmml")
Wikipathwayssets2 <- file.path(getwd(), "wikipathways-20220511-hsa-REACTOME (1).xgmml")
#
commandsRun(paste0('cytargetlinker extend idAttribute="node ensembl-id" linkSetFiles="', Wikipathwayssets1, '"'))
commandsRun('cytargetlinker applyLayout network="current"')
commandsRun(paste0('cytargetlinker extend idAttribute="node ensembl-id" linkSetFiles="', Wikipathwayssets2, '"'))
commandsRun('cytargetlinker applyLayout network="current"')

