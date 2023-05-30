mergeNetworks(sources= c('extended_neuro_network','extended_nonneuro_network'), 
              title = 'Interaction between neuro and nonneuro',
              operation = "interaction" )

#Filtering intersection
createDegreeFilter('degree filter', c(0,2), 'IS_NOT_BETWEEN',network = 'Intersection')
createColumnFilter(filter.name='pathway filter', column='CTL.Type', "pathway", 'CONTAINS',network = 'Intersection')
createCompositeFilter('combined filter', c('degree filter','pathway filter'),network = 'Intersection')
selectFirstNeighbors(network = 'Intersection')
createSubnetwork(subnetwork.name ='final subnetwork intersection')

#Filtering neuro - nonneuro
createDegreeFilter('degree filter', c(0,2), 'IS_NOT_BETWEEN',network = 'neuro - nonneuro')
createColumnFilter(filter.name='pathway filter', column='CTL.Type', "pathway", 'CONTAINS',network = 'neuro - nonneuro')
createCompositeFilter('combined filter', c('degree filter','pathway filter'),network = 'neuro - nonneuro')
selectFirstNeighbors(network = 'neuro - nonneuro')
createSubnetwork(subnetwork.name ='final subnetwork neuro - nonneuro')

#Filtering nonneuro - neuro
createDegreeFilter('degree filter', c(0,2), 'IS_NOT_BETWEEN',network = 'nonneuro - neuro')
createColumnFilter(filter.name='pathway filter', column='CTL.Type', "pathway", 'CONTAINS',network = 'nonneuro - neuro')
createCompositeFilter('combined filter', c('degree filter','pathway filter'),network = 'nonneuro - neuro')
selectFirstNeighbors(network = 'nonneuro - neuro')
createSubnetwork(subnetwork.name ='final subnetwork nonneuro - neuro')

#taking the Ensembl identifier column for GO analysis
ENS_intersection <- getTableColumns('node', 'ensembl_id', network = 'final subnetwork intersection')
ENS_neuro_minus_nonneuro <-getTableColumns('node', 'ensembl_id', network = 'final subnetwork neuro - nonneuro')
ENS_nonneuro_minus_neuro <-getTableColumns('node', 'ensembl_id', network = 'final subnetwork nonneuro - neuro' )
