
HClust.1 <- hclust(dist(model.matrix(~-1 + X+Y, Dataset), method= 
  "manhattan") , method= "ward")
plot(HClust.1, main= "Cluster Dendrogram for Solution HClust.1", xlab= 
  "Observation Number in Data Set Dataset", 
  sub="Method=ward; Distance=city-block")
HClust.2 <- hclust(dist(model.matrix(~-1 + X+Y, Dataset), method= 
  "manhattan") , method= "single")
plot(HClust.2, main= "Cluster Dendrogram for Solution HClust.2", xlab= 
  "Observation Number in Data Set Dataset", 
  sub="Method=single; Distance=city-block")
summary(as.factor(cutree(HClust.2, k = 3))) # Cluster Sizes
by(model.matrix(~-1 + X + Y, Dataset), as.factor(cutree(HClust.2, k = 3)), 
  colMeans) # Cluster Centroids
biplot(princomp(model.matrix(~-1 + X + Y, Dataset)), xlabs = 
  as.character(cutree(HClust.2, k = 3)))
Dataset$hclus.label <- assignCluster(model.matrix(~-1 + X + Y, Dataset), 
  Dataset, cutree(HClust.2, k = 3))
scatterplot(Y~X | hclus.label, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  by.groups=TRUE, data=Dataset)
Dataset <- 
  read.table("/adhome/m/mb/mbourlang/Documents/stats/TP4/temperatureVSN.txt", 
  header=TRUE, sep="\t", na.strings="NA", dec=",", strip.white=TRUE)
row.names(Dataset) <- as.character(Dataset$Ville)
Dataset$Ville <- NULL
Dataset <- local({
  .Z <- scale(Dataset[,c("aout","avril","decembre","fevrier","janvier",
  "juillet","juin","mai","mars","novembre","octobre","septembre")])
  within(Dataset, {
    Z.septembre <- .Z[,12]
    Z.octobre <- .Z[,11]
    Z.novembre <- .Z[,10]
    Z.mars <- .Z[,9]
    Z.mai <- .Z[,8]
    Z.juin <- .Z[,7]
    Z.juillet <- .Z[,6]
    Z.janvier <- .Z[,5]
    Z.fevrier <- .Z[,4]
    Z.decembre <- .Z[,3]
    Z.avril <- .Z[,2]
    Z.aout <- .Z[,1] 
  })
})
HClust.3 <- hclust(dist(model.matrix(~-1 + 
  Z.aout+Z.avril+Z.decembre+Z.fevrier+Z.janvier+Z.juillet+Z.juin+Z.mai+Z.mars+Z.novembre+Z.octobre+Z.septembre,
   Dataset)) , method= "ward")
plot(HClust.3, main= "Cluster Dendrogram for Solution HClust.3", xlab= 
  "Observation Number in Data Set Dataset", 
  sub="Method=ward; Distance=euclidian")

