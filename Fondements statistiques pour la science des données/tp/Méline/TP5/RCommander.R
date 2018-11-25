
temperature <- 
  read.table("/adhome/m/mb/mbourlang/Documents/stats/TP5/temperatureVSN.txt", 
  header=TRUE, sep="\t", na.strings="NA", dec=",", strip.white=TRUE)
temperature <- local({
  .Z <- scale(temperature[,c("aout","avril","decembre","fevrier","janvier","juillet","juin","mai","mars","novembre","octobre","septembre")])
  within(temperature, {
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
HClust.1 <- hclust(dist(model.matrix(~-1 + Z.aout+Z.avril+Z.decembre+Z.fevrier+Z.janvier+Z.juillet+Z.juin+Z.mai+Z.mars+Z.novembre+Z.octobre+Z.septembre, 
  temperature)) , method= "ward")
plot(HClust.1, main= "Cluster Dendrogram for Solution HClust.1", xlab= "Observation Number in Data Set temperature", 
  sub="Method=ward; Distance=euclidian")
row.names(temperature) <- as.character(temperature$Ville)
temperature$Ville <- NULL
HClust.1
HClust.1$merge
HClust.1$height
temperature$hclus.label <- assignCluster(model.matrix(~-1 + Z.aout + Z.avril + Z.decembre + Z.fevrier + 
  Z.janvier + Z.juillet + Z.juin + Z.mai + Z.mars + Z.novembre + Z.octobre + Z.septembre, temperature), 
  temperature, cutree(HClust.1, k = 3))
summary(as.factor(cutree(HClust.1, k = 3))) # Cluster Sizes
by(model.matrix(~-1 + Z.aout + Z.avril + Z.decembre + Z.fevrier + Z.janvier + Z.juillet + Z.juin + Z.mai + 
  Z.mars + Z.novembre + Z.octobre + Z.septembre, temperature), as.factor(cutree(HClust.1, k = 3)), colMeans) 
  # Cluster Centroids
biplot(princomp(model.matrix(~-1 + Z.aout + Z.avril + Z.decembre + Z.fevrier + Z.janvier + Z.juillet + Z.juin + 
  Z.mai + Z.mars + Z.novembre + Z.octobre + Z.septembre, temperature)), xlabs = as.character(cutree(HClust.1, k = 
  3)))
temperature.PCA<-temperature[, c("janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "aout", 
  "septembre", "octobre", "novembre", "decembre", "Latitude", "Longitude", "Amplitude", "Moyenne", "Coul.Pol", 
  "Littoral")]
res<-PCA(temperature.PCA , scale.unit=TRUE, ncp=Inf, quanti.sup=c(13: 16), quali.sup=c(17: 18), graph = FALSE)
res.hcpc<-HCPC(res ,nb.clust=-1,consol=FALSE,min=2,max=10,graph=TRUE)
res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", 
  col.quali="magenta", label=c("ind", "ind.sup", "quali"),new.plot=TRUE)
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", 
  "quanti.sup"), lim.cos2.var=0)
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(temperature.PCA)
temperature.PCA<-temperature[, c("janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "aout", 
  "septembre", "octobre", "novembre", "decembre", "Latitude", "Longitude", "Amplitude", "Moyenne", "Coul.Pol", 
  "Littoral")]
res<-PCA(temperature.PCA , scale.unit=TRUE, ncp=Inf, quanti.sup=c(13: 16), quali.sup=c(17: 18), graph = FALSE)
res.hcpc<-HCPC(res ,nb.clust=-1,consol=FALSE,min=2,max=10,graph=TRUE)
res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", 
  col.quali="magenta", label=c("ind", "ind.sup", "quali"),new.plot=TRUE)
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", 
  "quanti.sup"), lim.cos2.var=0)
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(temperature.PCA)
temperature.PCA<-temperature[, c("janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "aout", 
  "septembre", "octobre", "novembre", "decembre", "Latitude", "Longitude", "Amplitude", "Moyenne", "Coul.Pol", 
  "Littoral")]
res<-PCA(temperature.PCA , scale.unit=TRUE, ncp=Inf, quanti.sup=c(13: 16), quali.sup=c(17: 18), graph = FALSE)
res.hcpc<-HCPC(res ,nb.clust=0,consol=FALSE,min=2,max=10,graph=TRUE)
res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", 
  col.quali="magenta", label=c("ind", "ind.sup", "quali"),new.plot=TRUE)
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", 
  "quanti.sup"), lim.cos2.var=0)
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(temperature.PCA)
temperature.PCA<-temperature[, c("janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "aout", 
  "septembre", "octobre", "novembre", "decembre", "Latitude", "Longitude", "Amplitude", "Moyenne", "Coul.Pol", 
  "Littoral")]
res<-PCA(temperature.PCA , scale.unit=TRUE, ncp=Inf, quanti.sup=c(13: 16), quali.sup=c(17: 18), graph = FALSE)
res.hcpc<-HCPC(res ,nb.clust=0,consol=FALSE,min=2,max=10,graph=TRUE)
res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", 
  col.quali="magenta", label=c("ind", "ind.sup", "quali"),new.plot=TRUE)
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", 
  "quanti.sup"), lim.cos2.var=0)
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(temperature.PCA)
temperature.PCA<-temperature[, c("janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "aout", 
  "septembre", "octobre", "novembre", "decembre", "Latitude", "Longitude", "Amplitude", "Moyenne", "Coul.Pol", 
  "Littoral")]
res<-PCA(temperature.PCA , scale.unit=TRUE, ncp=Inf, quanti.sup=c(13: 16), quali.sup=c(17: 18), graph = FALSE)
res.hcpc<-HCPC(res ,nb.clust=0,consol=FALSE,min=2,max=10,graph=TRUE)
res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", 
  col.quali="magenta", label=c("ind", "ind.sup", "quali"),new.plot=TRUE)
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", 
  "quanti.sup"), lim.cos2.var=0)
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(temperature.PCA)
temperature.PCA<-temperature[, c("janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "aout", 
  "septembre", "octobre", "novembre", "decembre", "Latitude", "Longitude", "Amplitude", "Moyenne", "Coul.Pol", 
  "Littoral")]
res<-PCA(temperature.PCA , scale.unit=TRUE, ncp=Inf, quanti.sup=c(13: 16), quali.sup=c(17: 18), graph = FALSE)
res.hcpc<-HCPC(res ,nb.clust=0,consol=FALSE,min=2,max=10,graph=TRUE)
res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", 
  col.quali="magenta", label=c("ind", "ind.sup", "quali"),new.plot=TRUE)
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", 
  "quanti.sup"), lim.cos2.var=0)
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(temperature.PCA)
res.hcp$callt$quot
res$hcp
temperature.PCA<-temperature[, c("janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "aout", 
  "septembre", "octobre", "novembre", "decembre", "Latitude", "Longitude", "Amplitude", "Moyenne", "Coul.Pol", 
  "Littoral")]
res<-PCA(temperature.PCA , scale.unit=TRUE, ncp=Inf, quanti.sup=c(13: 16), quali.sup=c(17: 18), graph = FALSE)
res.hcpc<-HCPC(res ,nb.clust=0,consol=FALSE,min=2,max=10,graph=TRUE)
res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
res.hcpc$desc.var
res.hcpc$desc.axes
res.hcpc$desc.ind
plot.PCA(res, axes=c(1, 2), choix="ind", habillage="none", col.ind="black", col.ind.sup="blue", 
  col.quali="magenta", label=c("ind", "ind.sup", "quali"),new.plot=TRUE)
plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black", col.quanti.sup="blue", label=c("var", 
  "quanti.sup"), lim.cos2.var=0)
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
remove(temperature.PCA)
res$hcp$desc.ind
$para

