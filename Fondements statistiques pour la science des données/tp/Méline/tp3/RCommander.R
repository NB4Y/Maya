
load("/adhome/m/mb/mbourlang/Documents/stats/TP3/TP3_2/tp3.RData")
Dataset.MCA<-Dataset[, c("Concerne", "Position.Al.A", "Manif", 
  "Media.Actif", "Info.Active", "Produits.Phytosanitaires", "Famine", 
  "Amelioration.Agr", "Futur.Progres", "Danger", "Menace", "Risque.Eco", 
  "Procede.Inutile", "Grds.Parents", "rec.Position.Al.H", 
  "rec.Position.Culture", "Sexe", "Age", "CSP", "Relation", 
  "Parti.Politique")]
res<-MCA(Dataset.MCA, ncp=5, quali.sup=17: 21, graph = FALSE)

X11()
plot.MCA(res, axes=c(1, 2), new.plot=TRUE, col.ind="black", 
  col.ind.sup="blue", col.var="darkred", col.quali.sup="darkgreen", 
  label=c("ind", "ind.sup", "quali.sup", "var"))

plot.MCA(res, axes=c(1, 2), new.plot=TRUE, choix="var", col.var="darkred", 
  col.quali.sup="darkgreen", label=c("var", "quali.sup"))
plot.MCA(res, axes=c(1, 2), new.plot=TRUE, choix="quanti.sup", 
  col.quanti.sup="blue", label=c("quanti.sup"))
summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")
res$eig
res$var
res$ind
res$quali.sup
dimdesc(res, axes=1:5)
remove(Dataset.MCA)

