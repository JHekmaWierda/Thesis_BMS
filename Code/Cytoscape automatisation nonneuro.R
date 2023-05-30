# Create a network with use of the String app
nonneuro.gene.list <- c(Ens_nonneuro_limma)
gene.str <- paste(nonneuro.gene.list, collapse = ",")
string.cmd <- paste("string protein query cutoff=0.90 limit=68 query",
                    gene.str, sep = "=")
commandsRun(string.cmd)
renameNetwork("nonneuro_network", network = "STRING network - 1")

#map the data to be an Ensembl ID
mapTableColumn('display name', 'Human', 'HGNC', 'Ensembl')


#Upload Expression data
toggleGraphicsDetails()
loadTableData(nonneuro_limma_and_neuro_limma, data.key.column = "hgnc_symbol_", table.key.column = "display name")

# apply visual style 
setVisualStyle("neuro_style")
data.values <- c(-0.28,0,0.28) 
node.colors <- c(rev(brewer.pal(length(data.values), "RdBu")))
setNodeColorMapping("logFC_nonneuro", data.values, node.colors, default.color = "#D8D8D8", style.name = "neuro_style")

# Create the Linksets
Wikipathwayssets1 <- file.path(getwd(), "wikipathways-20220511-hsa-WP (1).xgmml")
Wikipathwayssets2 <- file.path(getwd(), "wikipathways-20220511-hsa-REACTOME (1).xgmml")

#Extend the pathway with cytargetlinker
commandsRun(paste0('cytargetlinker extend idAttribute="Ensembl" linkSetFiles="', Wikipathwayssets1, '"'))
commandsRun('cytargetlinker applyLayout network="current"')
commandsRun(paste0('cytargetlinker extend idAttribute="Ensembl" linkSetFiles="', Wikipathwayssets2, '"'))
commandsRun('cytargetlinker applyLayout network="current"')

#Fix visualization
my.Pathways <- selectNodes("pathway", by.col = "CTL.Type", preserve = FALSE)$nodes #easy way to collect node SUIDs by column value
clearSelection()
setNodeColorBypass(my.Pathways, "#DD99FF")
setNodeShapeBypass(my.Pathways, "hexagon")
renameNetwork("extended_nonneuro_network", network = "CTL_nonneuro_network")
