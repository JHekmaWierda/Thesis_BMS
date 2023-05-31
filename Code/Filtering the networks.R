mergeNetworks(sources= c('extended_neuro_network','extended_nonneuro_network'), 
              title = 'Interaction between neuro and nonneuro',
              operation = "interaction" )

##Filtering intersection
#Filtering intersection general
createDegreeFilter('degree filter', c(0,2), 'IS_NOT_BETWEEN',network = 'Intersection')
createColumnFilter(filter.name='pathway filter', column='CTL.Type', "pathway", 'CONTAINS',network = 'Intersection')
createCompositeFilter('combined filter', c('degree filter','pathway filter'),network = 'Intersection')
selectFirstNeighbors(network = 'Intersection')
createSubnetwork(subnetwork.name ='final subnetwork intersection')

#Filtering intersection neuro upregulated
createColumnFilter(filter.name='upregulated neuro filter', column='logFC_neuro',0.28, 'GREATER_THAN',network = 'Intersection')
createCompositeFilter('combined filter', c('degree filter','upregulated neuro filter'),network = 'Intersection')
selectFirstNeighbors(network = 'Intersection')
createSubnetwork(subnetwork.name ='upregulated subnetwork Intersection neuro')

#Filtering intersection neuro downregulated
createColumnFilter(filter.name='downregulated neuro filter', column='logFC_neuro',-0.28, 'LESS_THAN',network = 'Intersection')
createCompositeFilter('combined filter', c('degree filter','downregulated neuro filter'),network = 'Intersection')
selectFirstNeighbors(network = 'Intersection')
createSubnetwork(subnetwork.name ='downregulated subnetwork Intersection neuro')


##neuro - nonneuro
#Filtering neuro - nonneuro general
createDegreeFilter('degree filter', c(0,2), 'IS_NOT_BETWEEN',network = 'neuro - nonneuro')
createColumnFilter(filter.name='pathway filter', column='CTL.Type', "pathway", 'CONTAINS',network = 'neuro - nonneuro')
createCompositeFilter('combined filter', c('degree filter','pathway filter'),network = 'neuro - nonneuro')
selectFirstNeighbors(network = 'neuro - nonneuro')
createSubnetwork(subnetwork.name ='general subnetwork neuro - nonneuro')

#Filtering neuro - nonneuro upregulated
createColumnFilter(filter.name='upregulated neuro filter', column='logFC_neuro',0.28, 'GREATER_THAN',network = 'neuro - nonneuro')
createCompositeFilter('combined filter', c('degree filter','upregulated neuro filter'),network = 'neuro - nonneuro')
selectFirstNeighbors(network = 'neuro - nonneuro')
createSubnetwork(subnetwork.name ='upregulated subnetwork neuro - nonneuro')

#Filtering neuro - nonneuro downregulated
createColumnFilter(filter.name='downregulated neuro filter', column='logFC_neuro',-0.28, 'LESS_THAN',network = 'neuro - nonneuro')
createCompositeFilter('combined filter', c('degree filter','downregulated neuro filter'),network = 'neuro - nonneuro')
selectFirstNeighbors(network = 'neuro - nonneuro')
createSubnetwork(subnetwork.name ='downregulated subnetwork neuro - nonneuro')



##nonneuro - neuro
#Filtering nonneuro - neuro general
createDegreeFilter('degree filter', c(0,2), 'IS_NOT_BETWEEN',network = 'nonneuro - neuro')
createColumnFilter(filter.name='pathway filter', column='CTL.Type', "pathway", 'CONTAINS',network = 'nonneuro - neuro')
createCompositeFilter('combined filter', c('degree filter','pathway filter'),network = 'nonneuro - neuro')
selectFirstNeighbors(network = 'nonneuro - neuro')
createSubnetwork(subnetwork.name ='final subnetwork nonneuro - neuro')

#Filtering nonneuro - neuro upregulated
createColumnFilter(filter.name='upregulated nonneuro filter', column='logFC_nonneuro',0.28, 'GREATER_THAN',network = 'nonneuro - neuro')
createCompositeFilter('combined filter', c('degree filter','upregulated nonneuro filter'),network = 'nonneuro - neuro')
selectFirstNeighbors(network = 'nonneuro - neuro')
createSubnetwork(subnetwork.name ='upregulated subnetwork nonneuro - neuro')

#Filtering nonneuro - neuro downregulated
createColumnFilter(filter.name='downregulated nonneuro filter', column='logFC_nonneuro',-0.28, 'LESS_THAN',network = 'nonneuro - neuro')
createCompositeFilter('combined filter', c('degree filter','downregulated nonneuro filter'),network = 'nonneuro - neuro')
selectFirstNeighbors(network = 'nonneuro - neuro')
createSubnetwork(subnetwork.name ='downregulated subnetwork nonneuro - neuro')

#taking the Ensembl identifier column for GO analysis from interserction
ENS_intersection <- getTableColumns('node', 'ensembl_id', network = 'final subnetwork intersection')
ENS_intersection_up <- getTableColumns('node', 'ensembl_id', network = 'upregulated subnetwork Intersection neuro')
ENS_intersection_down <- getTableColumns('node', 'ensembl_id', network = 'downregulated subnetwork Intersection neuro')

#taking the Ensembl identifier column for GO analysis from neuro - nonneuro
ENS_neuro_minus_nonneuro <-getTableColumns('node', 'ensembl_id', network = 'general subnetwork neuro - nonneuro')
ENS_neuro_minus_nonneuro_up <-getTableColumns('node', 'ensembl_id', network = 'upregulated subnetwork neuro - nonneuro')
ENS_neuro_minus_nonneuro_down <-getTableColumns('node', 'ensembl_id', network = 'downregulated subnetwork neuro - nonneuro')

#taking the Ensembl identifier column for GO analysis from nonneuro - neuro
ENS_nonneuro_minus_neuro <-getTableColumns('node', 'ensembl_id', network = 'final subnetwork nonneuro - neuro' )
ENS_nonneuro_minus_neuro_up <-getTableColumns('node', 'ensembl_id', network = 'upregulated subnetwork nonneuro - neuro')
ENS_nonneuro_minus_neuro_down <-getTableColumns('node', 'ensembl_id', network = 'downregulated subnetwork nonneuro - neuro')
