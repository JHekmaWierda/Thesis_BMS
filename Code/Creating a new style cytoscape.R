#then prepare style variables
style.name.neuro = "neuro_style"
defaults <- list(NODE_SHAPE="ellipse",
                 EDGE_TRANSPARENCY=120,
                 NODE_LABEL_POSITION="c,c,c,0.00,0.00")
nodeLabels <- mapVisualProperty('node label','display name','p')
nodeFills <- mapVisualProperty('node fill color','logFC_neuro',"c",c(-0.28,0,0.28), c("#1458FF","#FFFFFF","#FE3B0B"))
nodeborder <- mapVisualProperty('node border paint', 'P.value_Neuro', 'c', c(0.05,0.050000001),c("#00FF0C","#FFFFFF"))
arrowShapes <- mapVisualProperty('Edge Target Arrow Shape','interaction','d',
                                 c("activates","inhibits","interacts"),c("Arrow","T","None"))
#and then create the style
createVisualStyle(style.name.neuro, defaults, list(nodeLabels,nodeFills,arrowShapes,nodeborder))
#finsh by applying the style
setVisualStyle(style.name.neuro)
