# downloading and opening package to get one column
install.packages("tidyverse")
library(tidyverse)

#uploading the data set
nonneuro_limma_and_neuro_limma <- read.csv("~/BMS Year 3 2022-2023/Thesis/nonneuro_limma and neuro_limma.csv")
nonneuro_limma <- nonneuro_limma_and_neuro_limma %>% select(1,2,3,4,5,6,7,8,9)
neuro_limma <- nonneuro_limma_and_neuro_limma %>% select(1,2,10,11,12,13,14,15,16)

#making subsets with the significantly differently expressed genes of both the neuro group as the nonneuro group
Sub_neuro_limma <- subset(nonneuro_limma_and_neuro_limma, nonneuro_limma_and_neuro_limma$logFC_neuro <= -0.28 |nonneuro_limma_and_neuro_limma$logFC_neuro >=0.28 & nonneuro_limma_and_neuro_limma$P.Value_Neuro <= 0.05)
Sub_nonneuro_limma <- subset(nonneuro_limma_and_neuro_limma, nonneuro_limma_and_neuro_limma$logFC_nonneuro <= -0.28 |nonneuro_limma_and_neuro_limma$logFC_nonneuro >=0.28 & nonneuro_limma_and_neuro_limma$P.Value_Nonneuro<= 0.05)

#creating a list of only the ensemble IDs for the differently expressed genes
Ens_neuro_limma <- Sub_neuro_limma %>% select(1)
Ens_nonneuro_limma <- Sub_nonneuro_limma %>% select(1)
